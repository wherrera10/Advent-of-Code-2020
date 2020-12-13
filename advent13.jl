input = """
1015292
19,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,743,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,x,x,x,x,x,x,x,x,x,x,29,x,643,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,23
"""

let
    line1, line2 = split(input, "\n")
    t0 = parse(Int, line1)
    inservice = filter(x -> x != nothing, map(y -> tryparse(Int, y), split(line2, ",")))
    allservice = map(y -> tryparse(Int, y), split(line2, ","))
    pairs =[[x , i] for (i, x) in enumerate(allservice) if x != nothing]

    times = Int[]
    for route in inservice
        nexttime = div(t0 + route - 1, route) * route
        push!(times, nexttime - t0)
    end
    (t, i) = findmin(times)
    println(inservice[i], "  ", t, "   part 1: ", inservice[i] * t)

    interval = 1
    n = 0
    for p in pairs
        for i in n:interval:typemax(Int)
            if (i + p[2] - 1) % p[1] == 0
                n = i
                interval = interval * p[1]
                break
            end
        end
    end

    println("Part 2: $n")

end
