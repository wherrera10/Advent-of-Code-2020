"""
This program expects a source rules file and a text file for translating to be provided as the 
first and second arguments of the script, as in: > julia markovrules.jl <rulesfilename> <textfilename>

To run the program, make individual files containing the rulesets and test texts (see below). 
"""
The following are the files used:

function getmarkovrules(filename)
    rules = []
    lines = []
    linenum = 0
    open(filename) do rulesfh
        lines = readlines(rulesfh)
    end
    for line in lines
        linenum += 1
        if(!ismatch(r"^#", line) && !ismatch(r"^\s*$", line))
            regm = match(r"^(.+)\s+->\s+(\.)?(.+)?$", line)
            if(regm != nothing && length(regm.captures) > 0)
                push!(rules, (regm.captures[1], regm.captures[2], regm.captures[3]))
            else
                println("RULESET ERROR: No proper matches for line $linenum in file $filename.")
            end
        end
    end
    rules
end

function markovtranslate(filename, rules)
    testfh  = open(filename)
    txt = join(map(c -> Char(c), read(testfh)))
    close(testfh)
    translated = ""
    redoing = true
    while redoing
        nomatch = true
        for rule in rules
            (from, terminating, to) = rule
            if(length(search(txt, from)) > 0)
                nomatch = false
                if(to == nothing)
                    to = ""
                end
                txt = replace(txt, from, to)
                if(terminating != nothing)
                    redoing = false
                end
                break
            end
        end
        if(nomatch)
            redoing = false
        end
    end
    txt
end

const rulesfile = ARGS[1]
const textfile = ARGS[2]
print("\nUsing rules from file $rulesfile, processing text $textfile.\nResult of test: ")
markovrules = getmarkovrules(rulesfile)
println(markovtranslate(textfile, markovrules))
</lang>
<pre> 

In ruleset1.txt:
# This rules file is extracted from Wikipedia:
# http://en.wikipedia.org/wiki/Markov_Algorithm
A -> apple
B -> bag
S -> shop
T -> the
the shop -> my brother
a never used -> .terminating rule

In test1.txt:
I bought a B of As from T S.

In ruleset2.txt:
# Slightly modified from the rules on Wikipedia
A -> apple
B -> bag
S -> .shop
T -> the
the shop -> my brother
a never used -> .terminating rule

In test2.txt:
I bought a B of As from T S.

In ruleset3.txt:
# BNF Syntax testing rules
A -> apple
WWWW -> with
Bgage -> ->.*
B -> bag
->.* -> money
W -> WW
S -> .shop
T -> the
the shop -> my brother
a never used -> .terminating rule

In test3.txt:
I bought a B of As W my Bgage from T S.

In ruleset4.txt:
### Unary Multiplication Engine, for testing Markov Algorithm implementations
### By Donal Fellows.
# Unary addition engine
_+1 -> _1+
1+1 -> 11+
# Pass for converting from the splitting of multiplication into ordinary
# addition
1! -> !1
,! -> !+
_! -> _
# Unary multiplication by duplicating left side, right side times
1*1 -> x,@y
1x -> xX
X, -> 1,1
X1 -> 1X
_x -> _X
,x -> ,X
y1 -> 1y
y_ -> _
# Next phase of applying
1@1 -> x,@y
1@_ -> @_
,@_ -> !_
++ -> +
# Termination cleanup for addition
_1 -> 1
1+_ -> 1
_+_ -> 

In test4.txt:
_1111*11111_

In ruleset5.txt:
# Turing machine: three-state busy beaver
#
# state A, symbol 0 => write 1, move right, new state B
A0 -> 1B
# state A, symbol 1 => write 1, move left, new state C
0A1 -> C01
1A1 -> C11
# state B, symbol 0 => write 1, move left, new state A
0B0 -> A01
1B0 -> A11
# state B, symbol 1 => write 1, move right, new state B
B1 -> 1B
# state C, symbol 0 => write 1, move left, new state B
0C0 -> B01
1C0 -> B11
# state C, symbol 1 => write 1, move left, halt
0C1 -> H01
1C1 -> H11

In test5.txt:
000000A000000
        
</pre>
{{output}}
<pre>
prompt>julia markov.jl ruleset1.txt test1.txt

Using rules from file ruleset1.txt, processing text test1.txt.
Result of test: I bought a bag of apples from my brother.

prompt>julia markov.jl ruleset2.txt test2.txt

Using rules from file ruleset2.txt, processing text test2.txt.
Result of test: I bought a bag of apples from T shop.

prompt>julia markov.jl ruleset3.txt test3.txt

Using rules from file ruleset3.txt, processing text test3.txt.
Result of test: I bought a bag of apples with my money from T shop.

prompt>julia markov.jl ruleset4.txt test4.txt

Using rules from file ruleset4.txt, processing text test4.txt.
Result of test: 11111111111111111111

prompt>julia markov.jl ruleset5.txt test5.txt

Using rules from file ruleset5.txt, processing text test5.txt.
Result of test: 00011H1111000
</pre>
