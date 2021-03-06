@testset "$(format("Loss: Poisson[construction]"))" begin
    @test typeof(Loss{Poisson}(Poisson())) == Loss{Poisson}
    @test typeof(Loss(Poisson())) == Loss{Poisson}
    @test typeof(Loss(:Poisson)) == Loss{Poisson}
end


@testset "$(format("Optimizer: Poisson Loss [Small][Forgiving][AutoGrad]"))"  begin
    @timeit to "Optimizer: Poisson Loss [Small][Forgiving][AutoGrad]"  begin
        let
            is_admissable(result)  = begin
                if result["relative-error[#within-radius(1e-5)]"] < 0.1 || result["relative-error[#within-radius(1)]"] <0.1
                    return true
                end
                @warn @sprintf("expected %f, got %f",0.1,result["relative-error[#within-radius(1e-5)]"])
                return false
            end
            @test !isnothing(provide(Loss(Poisson())))
            @test !isnothing(provide(Loss(:Poisson)))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(Poisson())),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 1000,
                                                        ρ                  = 0,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(Poisson())),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 3000,
                                                        ρ                  = 0,
                                                        step_size          = 0.1,
                                                        max_iter          = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(Poisson())),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 5000,
                                                        ρ                  = 0,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(Poisson())),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 1000,
                                                        ρ                  = 0.1,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(Poisson())),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 3000,
                                                        ρ                  = 0.1,
                                                        step_size          = 0.1,
                                                        max_iter = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(Poisson())),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 5000,
                                                        ρ                  = 0.2,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(:Poisson)),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 1000,
                                                        ρ                  = 0,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(:Poisson)),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 3000,
                                                        ρ                  = 0,
                                                        step_size          = 0.1,
                                                        max_iter          = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(:Poisson)),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 5000,
                                                        ρ                  = 0,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(:Poisson)),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 1000,
                                                        ρ                  = 0.1,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(:Poisson)),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 3000,
                                                        ρ                  = 0.1,
                                                        step_size          = 0.1,
                                                        max_iter = 100))
            @test is_admissable(unit_test_train_subloss(gradient_eval      = provide(Loss(:Poisson)),
                                                        input_distribution = Distributions.Poisson(5),
                                                        input_size         = 5000,
                                                        ρ                  = 0.2,
                                                        step_size          = 0.1,
                                                        max_iter           = 100))
        end
    end
end





@testset "$(format("Optimizer: Poisson Loss [Small][Forgiving][Native]"))" begin
    @timeit to "Optimizer: Poisson Loss [Small][Forgiving][Native]" begin
        is_admissable(result)  = begin
                if result["relative-error[#within-radius(1e-5)]"] < 0.1 || result["relative-error[#within-radius(1)]"] <0.1
                    return true
                end
                @warn @sprintf("expected %f, got %f",0.1,result["relative-error[#within-radius(1e-5)]"])
                return false
            end
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(Poisson()),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 1000,
                                                    ρ                  = 0,
                                                    step_size          = 0.1,
                                                    max_iter           = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(Poisson()),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 3000,
                                                    ρ                  = 0,
                                                    step_size          = 0.1,
                                                    max_iter          = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(Poisson()),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 5000,
                                                    ρ                  = 0,
                                                    step_size          = 0.1,
                                                    max_iter           = 100)) 
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(Poisson()),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 1000,
                                                    ρ                  = 0.2,
                                                    step_size          = 0.1,
                                                    max_iter           = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(Poisson()),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 3000,
                                                    ρ                  = 0.2,
                                                    step_size          = 0.1,
                                                    max_iter = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(Poisson()),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 5000,
                                                    ρ                  = 0.2,
                                                    step_size          = 0.1,
                                                    max_iter           = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(:Poisson),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 1000,
                                                    ρ                  = 0,
                                                    step_size          = 0.1,
                                                    max_iter           = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(:Poisson),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 3000,
                                                    ρ                  = 0,
                                                    step_size          = 0.1,
                                                    max_iter          = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(:Poisson),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 5000,
                                                    ρ                  = 0,
                                                    step_size          = 0.1,
                                                    max_iter           = 100)) 
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(:Poisson),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 1000,
                                                    ρ                  = 0.2,
                                                    step_size          = 0.1,
                                                    max_iter           = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(:Poisson),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 3000,
                                                    ρ                  = 0.2,
                                                    step_size          = 0.1,
                                                    max_iter = 100))
        @test is_admissable(unit_test_train_subloss(gradient_eval      = Loss(:Poisson),
                                                    input_distribution = Distributions.Poisson(5),
                                                    input_size         = 5000,
                                                    ρ                  = 0.2,
                                                    step_size          = 0.1,
                                                    max_iter           = 100))
    end
end



#include("test_impl_poissonloss.jl")
#include("test_impl_gammaloss.jl")



@label END_OF_TEST
