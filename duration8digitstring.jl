
function float2fixedwidth(x,width=8, leftjustified=true)
    if x == 0.0
        return "0.0     "
    end
    neg = x < 0.0
    if neg
        x = -x
    end
    str = @sprintf("%016.7f", x)
    str = replace(str, r"^[0]*([^0].+)", s"\1")
    str = replace(str, r"(.+[^0])[0]*$", s"\1")
    if length(str) < width && str[1] == '.'
        str = "0" * str
    end
    if neg
        str = "-" * str
    end
    len = length(str)
    if len > width
        decimalplaces = len - search(str, '.')
        if len - decimalplaces - 1 > width
            throw("too many significant decimal places on left")
        end
        str = str[1:8]
    else
        while length(str) < width
            if leftjustified
                str = str * " "
            else
                str = " " * str
            end
        end
    end
    str
end

println(float2fixedwidth(18500678.92353532))
println(float2fixedwidth(1800.0800))
