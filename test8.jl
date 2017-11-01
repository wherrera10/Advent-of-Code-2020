# This program expects a source rules file and a text file for
# translating to be provided as the first and second arguments
# of the script, eg julia markovrules.jl <rulesfilename> <textfilename>

function getmarkovrules(filename)
    nonvoid(m) = (m != match(r"x", "y"))
    rules = []
    lines = []
    open(filename) do rulesfh
        lines = readlines(rulesfh)
    end
    for line in lines
        if(!ismatch(r"\A#", line))
            regm = match(r"/(.*?)\s+->\s+(\.?)(.*)/", line)
            if(nonvoid(regm) && length(regm.captures) > 0)
                println(regm.captures)
                push!(rules, (regm.captures[1], regm.captures[2], regm.captures[3]))
            else
                println("No matches for line $line.")
            end
        end
    end
    rules
end

function markovtranslate(filename, rules)
    fh  = open(filename, "r")
    txt = readall(fh)
    close(fh)
    translated = ""
    redoing = true
    while redoing
        for rule in rules
            (from, terminating, to) = rule
            replace!(txt, r"\Q$(from)\E$(to)")
            if(terminating == ".")
                redoing = false
                break
            end
        end
    end
    txt
end

#const rulesfile = ARGV[1]
#const textfile = ARGV[2]
const rulesfile = "rules.txt"
const textfile = "input.txt"
println("Using rules from file $rulesfile, processing text $textfile.\nOutput:\n")
markovrules = getmarkovrules(rulesfile)
println(markovtranslate(textfile, markovrules))
