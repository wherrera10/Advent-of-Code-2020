const char2num = Dict('B'=>1,'F'=>1,'P'=>1,'V'=>1,'C'=>2,'G'=>2,'J'=>2,'K'=>2,
    'Q'=>2,'S'=>2,'X'=>2,'Z'=>2,'D'=>3,'T'=>3,'L'=>4,'M'=>5,'N'=>5,'R'=>6)

function soundex(s)
    s = replace(s, r"[^a-zA-Z]", "")
    if s == ""
        return ""
    end
    ret = "$(uppercase(s[1]))"
    lastletter = '0'
    lastletternum = haskey(char2num, ret[1]) ? char2num[ret[1]] : ""
    for c in s[2:end]
        c = uppercase(c)
        if haskey(char2num, c)
            letternum = char2num[c]
            if letternum != lastletternum || (!(lastletter in ('H', 'W')) && length(ret) > 2)
                ret = "$ret$letternum"
                lastletternum = letternum
            end
        end
        if length(ret) >= 4
            break
        end
        lastletter = c
    end
    while length(ret) < 4
        ret *= "0"
    end
    ret
end

const names = "Soundex Example Ashcroft Ascroft Ashcraftman Sownteks Ekzampul O'Hara Gauss Lloyd Lukasiewicz"

for name in split(names)
    println("Word: $name, soundex: $(soundex(name)).")
end
