

function init_interval_list!()

    
    return Any[create_dummy("front"), create_dummy("rear")]
end

function create_dummy(pos)
    if pos == "front"
        start = 0
        finish = 0
    else
        start = typemax(Int)
        finish = typemax(Int)
    end
    time = Time(Dict("start" => start,
        "finish" => finish))
   
    interval_detail = IntervalDetails("Dummy", time)
    return Dummy(interval_detail)
end


get_id(inter::Interval) = inter.attributes.time.id
get_start(inter::Interval) = inter.attributes.time.start
get_finish(inter::Interval) = inter.attributes.time.finish
get_duration(inter::Interval) = inter.attributes.time.duration

#
function set_start(inter::Interval, time::Int)
    inter.attributes.time.start = time
end

function set_finish(inter::Interval, time::Int)
    inter.attributes.time.finish = time
end

function set_duration(inter::Interval, time::Int)
    inter.attributes.time.duration = time
end


Base.isless(a::Interval, b::Interval) = a.attributes.time.start < b.attributes.time.start
Base.isequal(a::Interval, b::Interval) = a.attributes.time.start == b.attributes.time.start

function Base.show(io::IO, inter::Interval)
    println(io, "$(typeof(inter)) $(get_id(inter)) ($(get_start(inter)), $(get_duration(inter)), $(get_finish(inter)))")
end