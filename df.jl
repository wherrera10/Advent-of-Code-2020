using DataFrames

function mungdata(filename)
    lines = readlines(filename)
    numlines = length(lines)
    dates = Array{DateTime, 1}(numlines)
    means = zeros(Float64, numlines)
    numvalid = zeros(Int, numlines)
    invalidlength = zeros(Int, numlines)
    invalidpos = zeros(Int, numlines)
    datamatrix = Array{Float64,2}(numlines, 24)
    datamatrix .= NaN
    totalsum = 0.0
    totalgood = 0
    for (linenum,line) in enumerate(lines)
        data = split(line)
        maxbad = longestpos = validcount = badlength = 0
        validsum = 0.0
        for i in 2:2:length(data)-1
            if parse(Int, data[i+1]) >= 0
                validsum += (datamatrix[linenum, Int(i/2)] = parse(Float64, data[i]))
                validcount += 1
                badlength = 0
            else
                badlength += 1
                if badlength > invalidlength[linenum]
                    invalidlength[linenum] = badlength
                    invalidpos[linenum] = Int(i/2) - invalidlength[linenum] + 1
                end
            end
        end
        dates[linenum] = DateTime(data[1], "y-m-d")
        means[linenum] = validsum / validcount
        numvalid[linenum] = validcount
        totalsum += validsum
        totalgood += validcount
    end
    dt = DataFrame(Date = dates, Mean = means, ValidValues = numvalid,
                   MaximumGap = invalidlength, GapPosition = invalidpos)
    for i in 1:size(datamatrix)[2]
        dt[Symbol("$(i-1):00")] = datamatrix[:,i]
    end
    dt, totalsum/totalgood
end


datafilename = "data.txt"
df, mean = mungdata(datafilename)
dupdate = df[nonunique(df[:,[:Date]]),:][:Date]
println("The following rows have duplicate DATESTAMP:")
println(df[find(df[:Date] == dupdate), :])
println("All values good in these rows:")
println(df[find(df[:ValidValues] == 24)])
