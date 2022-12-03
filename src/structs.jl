
mutable struct Time
    start::Int64 #Interval開始時間(整備開始時間)
    duration::Int64 #YD  #demand *CT
    finish::Int64 #Bucket結束時間
end
function Time(info)
    start = get!(info, "start", 0)
    duration = get!(info, "duration", 0)
    finish = get!(info, "finish", 0)
    return Time(start, duration, finish)
end

## Interval
abstract type Interval end

struct IntervalDetails
    id::String
    time::Time
    info::Dict
    function IntervalDetails(id::String, time::Time)
        new(id, time, Dict())
    end
end

abstract type Block <: Interval end

## OrderBlock
struct OrderBlock <: Block
    attributes::IntervalDetails
    OrderBlock(id::String, start, duration, finish) = new(IntervalDetails(id, Time(start, duration, finish)))
end

## Forbidden
abstract type Forbidden <: Interval end

struct RestForbidden <: Forbidden
    attributes::IntervalDetails
end

struct HolidayForbidden <: Forbidden
    attributes::IntervalDetails
end

## Dummy
struct Dummy <: Interval
    attributes::IntervalDetails
end
