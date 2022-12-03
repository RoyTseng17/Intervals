module Intervals

export OrderBlock, 
       Time,
       create_dummy, 
       init_interval_list!
    include("./structs.jl")
    include("./functions.jl")
end # module
