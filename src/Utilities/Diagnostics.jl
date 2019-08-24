export relative_error,
       total_error


using MatrixCompletion.Concepts
using LinearAlgebra 


struct ErrorMatrix{T<:ExponentialFamily} end






function provide(object::ErrorMetric{LpSpace})
    metric = nothing
    if p > 0 
        metric = (x,slack) -> norm(x,object.p)
    end
    metric = (x,slack) -> sum(Int.(abs.(x) .> slack))
    return metric;
end








function relative_error(metric::T,input,referece) where T
    metric = provide(ErrorMetric{T}())
    return metric(input - reference) / metric(reference)
end




function total_error(metric::T,input,reference) where T
    metric = provide(ErrorMetric{T}())
    return metric(input-reference)
end







# function relative_error(metric::T,input::Array{Float64,N},reference::Array{Float64,N})
    

# end



# function relative_error(metric::L2Distance,input::Array{Float64,N} = nothing, reference::Array{Float64,1}=nothing)
#    return norm(input .- reference,2)/norm(reference,2)
# end



# function relative_error(metric::L0Distance,input::Array{Float64,N}=nothing,reference::Array{Float64,1}=nothing,slack::Float64=1e-5)
#     return sum(Int.(input - reference .> slack)) / length(reference)
# end



# function relative_error(metric::L1Distance,input::Array{Float64,N}=nothing,reference::Array{Float64,1}=nothing)
#    return norm(input .- reference,1)/norm(reference,1)
# end





# function total_error(metric::L2Distance,input::Array{Float64,N} = nothing, reference::Array{Float64,1} = nothing)
#     return norm(input .- reference,2)
# end






# function total_error(metric::L0Distance,input::Array{Float64,N} =nothing,reference::Array{Float64,1}=nothing)
#     return sum(Int.(input == reference))
# end



function Concepts.provide(a::Int64)
    print("hello")
    end


# function Concepts.provide(object::Diagnostics{AbstractGamma};
#                  input_data::Array{Float64,1} = nothing,
#                  reference::Array{Float64,1}   = nothing)
    

#    print("gamma")
# end





# function Concepts.provide(object::Diagnostics{AbstractGamma};
#                  input_data::Array{Float64,N} = nothing,
#                  reference ::Array{Float64,N} = nothing)
#     return Dict("relative-error(L2 Distance)" => relative_error(L2Distance(),input_data,reference),
#                 "error-matrix"                => (input_data - reference),
#                 "total-error(L2 Distance)"    => total_error(L2Distance(),input_data, reference))
# end




# function Concepts.provide(object::Diagnostics{AbstractGaussian};
#                  input_data::Array{Float64,N} = nothing,
#                  reference ::Array{Float64,N} = nothing)
#     return Dict("relative-error(L2 Distance)" => relative_error(L2Distance(),input_data,reference),
#                 "error-matrix"                => (input_data - reference),
#                 "total-error(L2 Distance)"    => total_error(L2Distance,input_data, reference))
# end


# function Concepts.provide(object::Diagnostics{AbstractBinomial};
#                  input_data::Array{Float64,N} = nothing,
#                  reference::Array{Float64,N}  = nothing)
#     return Dict("relative-error(L0 Distance)" => relative_error(L0Distance(),input_data,reference),
#                 "error-matrix"                => (input_data-reference),
#                 "total_error(L0 Distance)"    => total_error(L0Distance(),input_data,reference))
# end



# function Concepts.provide(object::Diagnostics{AbstractPoisson};
#                  input_data::Array{Float64,N} = nothing,
#                  reference::Array{Float64,N}  = nothing)
#     return Dict("relative-error(L0 Distance)"          => relative_error(L0Distance(),input_data,reference),
#                 "relative-error(L0 Distance,slack =1)" => relative_error(L0Distance(),input_data,reference),
#                 "relative-error(L0 Distance,slack =2)" => relative_error(L0Distance(),input_data,reference),
#                 "error-matrix"                         => input_data-reference,
#                 "total_error(L0 Distance)"             => total_error(L0Distance(),input_data,reference))
# end


# function Concepts.provide(object::Diagnostics{AbstractNegativeBinomial};
#                  input_data::Array{Float64,N} = nothing,
#                  reference::Array{Float64,N}  = nothing)
#     return Dict("relative-error(L0 Distance)"         => relative_error(L0Distance(),input_data,reference),
#                 "relative-error(L0 Distance,slack=1)" => relative_error(L0Distance(),input_data,reference),
#                 "relative-error(L0 Distance,slack=2)" => relative_error(L0Distance(),input_data,reference),
#                 "error-matrix"                        => (input_data-reference),
#                 "total_error(L0 Distance)"            => total_error(L0Distance,input_data,reference))
# end



