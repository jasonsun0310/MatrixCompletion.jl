module Tst

include("abstract_unittest_functions.jl")

using MatrixCompletion


# legacy code to be refactored soon!!

const to = TimerOutput()





#==============================================================================#
#                               TEST OPTIONS                                   #
#==============================================================================#
const TEST_OPTION_PRINT_TIMER    = false
const TEST_OPTION_SMALL_INPUT    = true
const TEST_OPTION_MEDIUM_INPUT   = false
const TEST_OPTION_LARGE_INPUT    = false
const TEST_OPTION_USE_AUTOGRAD   = true
const TEST_OPTION_TEST_R_WRAPPER = false


#==============================================================================#
#                              SUBMODULE FLAGS                                 #
#==============================================================================#
const FLAG_TEST_CONCEPTS                         = false
const FLAG_TEST_SAMPLING                         = false
const FLAG_TEST_MISC                             = false
const FLAG_TEST_RANDOM_OBJECTS                   = false
const FLAG_TEST_DIAGNOSTICS                      = false
const FLAG_TEST_EXPONENTIAL_FAMILY               = false
const FLAG_TEST_INDEXING_TOOLS                   = true
const FLAG_TEST_SPARSE_EIGEN                     = false
const FLAG_TEST_BETTER_MGF                       = false
const FLAG_TEST_ESTIMATOR_MLE                    = false
const FLAG_TEST_MODEL_FITTING                    = true
const FLAG_TEST_LOSS_OPTIMIZER_POISSON           = false
const FLAG_TEST_LOSS_OPTIMIZER_BERNOULLI         = false
const FLAG_TEST_LOSS_OPTIMIZER_GAMMA             = false
const FLAG_TEST_LOSS_OPTIMIZER_GAUSSIAN          = false
const FLAG_TEST_LOSS_OPTIMIZER_NEGATIVE_BINOMIAL = false
const FLAG_TEST_LOSS_OPTIMIZER_MULTINOMIAL       = false
const FLAG_TEST_ALGO_ADMM                        = false
const FLAG_TEST_ALGO_GLRM                        = false
const FLAG_TEST_ALGO_SVT                         = false
const FLAG_TEST_ALGO_ONEBIT                      = false
const FLAG_TEST_ALGO_OPTSPACE                    = false


#==============================================================================#
#                             VISUALIZATION FLAGS                              #
#==============================================================================#
const FLAG_VISUAL_RANDOM_OBJECTS = false



#==============================================================================#
#                                 TEST SCRIPTS                                 #
#==============================================================================#
FLAG_TEST_MISC ?
    include("test_runner_misc.jl")               : @info @sprintf("Skipped: Miscellaneous Test\n")

FLAG_TEST_RANDOM_OBJECTS ?
    include("test_runner_random_objects.jl")     : @info @sprintf("Skipped: Random Objects Test\n")

FLAG_TEST_SAMPLING ?
    include("test_runner_sampling.jl")           : @info @sprintf("Skipped: Sampling Test\n")

FLAG_TEST_INDEXING_TOOLS ?
    include("test_runner_indexing.jl")           : @info @sprintf("Skipped: Indexing Tracker Test\n")   

FLAG_TEST_CONCEPTS ?
    include("test_runner_concepts.jl")           : @info @sprintf("Skipped: Concepts Test\n")

FLAG_TEST_DIAGNOSTICS ?
    include("test_runner_diagnostics.jl")        : @info @sprintf("Skipped: Diagnostics Test\n")

FLAG_TEST_EXPONENTIAL_FAMILY ?
    include("test_runner_exponential_family.jl") : @info @sprintf("Skipped: Exponential Family Test\n")

FLAG_TEST_BETTER_MGF ?
    include("test_runner_better_mgf.jl")         : @info @sprintf("Skipped: MGF Test\n")

FLAG_TEST_ESTIMATOR_MLE ?
    include("test_runner_estimator_mle.jl")      : @info @sprintf("Skipped: MLE Test\n")

FLAG_TEST_MODEL_FITTING ?
    include("test_runner_model_fitting.jl")      : @info @sprintf("Skipped: Model Fitting Test\n")

FLAG_TEST_LOSS_OPTIMIZER_POISSON ?
    include("test_runner_poisson_loss.jl")       : @info @sprintf("Skipped: Poisson Loss Test\n")

FLAG_TEST_LOSS_OPTIMIZER_BERNOULLI ?
    include("test_runner_bernoulli_loss.jl")     : @info @sprintf("Skipped: Bernoulli Loss Test\n")

FLAG_TEST_LOSS_OPTIMIZER_GAMMA ?
    include("test_runner_gamma_loss.jl")         : @info @sprintf("Skipped: Bernoulli Loss Test\n")

FLAG_TEST_ALGO_ADMM ?
    include("test_runner_admm_small_input.jl")   : @info @sprintf("Skipped: ADMM Small Input Test\n")


#==============================================================================#
#                                VISUAL SCRIPTS                                #
#==============================================================================#

FLAG_VISUAL_RANDOM_OBJECTS ?
    include("visual_random_objects.jl")        : nothing


if TEST_OPTION_PRINT_TIMER 
    println()
    println(to)
end

end
