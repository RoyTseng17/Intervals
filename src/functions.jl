function init_interval_list!()
    return [create_dummy("front"), create_dummy("rear")]
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