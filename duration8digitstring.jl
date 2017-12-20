
function duration8digitstring(x)
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
    if length(str) < 8 && str[1] == '.'
        str = "0" * str
    end
    if neg
        str = "-" * str
    end
    len = length(str)
    if len > 8
        decimalplaces = len - search(str, '.')
        if len - decimalplaces - 1 > 8
            throw("too many significant decimal places on left")
        end
        str = str[1:8]
    end
    str
end

println(duration8digitstring(18500678.92353532))


