input = """
105: 12 | 69
42: 69 48 | 12 41
66: 69 69 | 12 12
91: 69 38 | 12 26
75: 105 105
39: 69 119 | 12 124
88: 12 87 | 69 133
7: 69 55 | 12 84
55: 12 12
31: 116 69 | 125 12
100: 96 69 | 87 12
40: 49 12 | 66 69
58: 69 71 | 12 57
122: 12 34 | 69 17
65: 12 98 | 69 124
2: 69 49 | 12 84
111: 20 69 | 54 12
64: 12 51 | 69 108
9: 98 69 | 82 12
38: 55 69 | 84 12
71: 59 12 | 100 69
120: 86 12 | 30 69
6: 12 87 | 69 124
63: 12 124 | 69 49
129: 12 52 | 69 103
0: 8 11
69: "a"
35: 111 12 | 58 69
32: 69 3 | 12 46
78: 69 37 | 12 87
93: 69 82 | 12 49
99: 2 12 | 61 69
16: 12 133 | 69 98
37: 12 69
115: 12 119 | 69 66
21: 117 69 | 124 12
119: 69 69 | 12 69
8: 42
84: 69 105 | 12 12
83: 69 49 | 12 117
130: 12 56 | 69 21
132: 66 69 | 98 12
124: 69 12
24: 12 113 | 69 123
53: 12 93 | 69 83
117: 69 12 | 12 105
18: 55 12 | 75 69
68: 133 69
17: 12 106 | 69 127
56: 12 55 | 69 75
112: 124 12 | 66 69
57: 12 2 | 69 59
30: 87 12 | 119 69
12: "b"
70: 96 69 | 101 12
3: 75 12 | 119 69
73: 69 29 | 12 130
79: 12 85 | 69 81
92: 69 55 | 12 87
26: 12 124 | 69 96
41: 12 35 | 69 89
47: 87 12 | 124 69
114: 69 47 | 12 16
28: 91 12 | 45 69
11: 42 31
22: 133 69 | 55 12
72: 39 12 | 70 69
118: 75 105
52: 69 134 | 12 80
131: 12 66 | 69 37
13: 76 12 | 27 69
4: 69 75 | 12 87
27: 12 63 | 69 7
113: 69 114 | 12 79
80: 12 5 | 69 118
125: 12 126 | 69 129
51: 112 12 | 15 69
33: 69 131 | 12 59
101: 12 69 | 69 105
10: 69 23 | 12 25
77: 69 33 | 12 104
20: 69 102 | 12 18
25: 59 12 | 60 69
126: 12 13 | 69 64
116: 69 122 | 12 19
97: 69 117 | 12 55
87: 12 69 | 69 12
109: 98 69 | 75 12
96: 12 12 | 105 69
15: 12 101 | 69 119
107: 69 96 | 12 87
14: 12 10 | 69 1
108: 12 59 | 69 94
123: 95 69 | 32 12
46: 87 69 | 98 12
86: 82 12 | 124 69
61: 117 12 | 49 69
121: 117 12 | 98 69
74: 96 12 | 124 69
59: 124 12 | 84 69
102: 82 12 | 84 69
135: 62 69 | 38 12
34: 99 12 | 67 69
95: 74 12 | 65 69
5: 37 69 | 96 12
81: 49 12 | 98 69
98: 69 69 | 69 12
89: 69 73 | 12 44
48: 12 14 | 69 24
110: 69 133 | 12 37
67: 121 12 | 78 69
82: 69 69
62: 84 69
134: 132 12 | 110 69
43: 88 12 | 97 69
50: 84 12 | 37 69
94: 101 12 | 98 69
103: 12 120 | 69 90
104: 6 69 | 40 12
60: 87 69 | 124 12
49: 12 12 | 69 12
29: 22 12 | 4 69
76: 12 63 | 69 109
133: 12 69 | 12 12
90: 50 69 | 36 12
19: 77 69 | 28 12
106: 69 107 | 12 88
45: 92 69 | 110 12
1: 12 53 | 69 72
54: 12 18 | 69 68
23: 9 69
128: 49 12 | 84 69
85: 66 69 | 75 12
44: 69 43 | 12 135
127: 115 12 | 128 69
36: 55 69 | 55 12

babababbabaababbaaabababbaabaaabaaabbbbb
abaabbaaaaababbbabbbaaaa
bbbbbabbbbbabbaabaabaabbaabaabaa
ababbbbbabbaabaabbabbaaabbbbabbbaabaaaababaaaabb
aabaaaabbabababaabbababa
abbbababbbaabababbaababaabbabbbbabaabaab
bbabaaaabbbbaabaabbbaabb
bbbaaaabaaababaaaaaaaaabbbaababababbbbaabbbabbba
abbbaaabbbbaabbaabbbaaabaabbbabbabaabbaaabaaabaa
aaaaabbbaababbbaabaabbab
ababbbbbabbbaaabbabaaaaa
aabbbaabbbbbabbabbabbabbbaaabbaabbababba
bbaaaababbbbbabbbababaaa
abbbabbabbabaabbabaaababbbbbabab
babbbbbbbbbaabaaaabbbbaa
bbbaabaabbaabbbaabbbabba
ababaabbbbbbaaabaaabbaaa
baaabbabbaabaabaaaabbbbabbbbaaaabbbabbbb
aaabababbbbbbababbbaaabbaabbbbaaabbbaaaa
bbbbbbabbbabbababaaabaabbbaaababaaabaaba
babaabbbabaaababbbaaabbb
abbbabaababbaaaaabaabbab
aaaaabaaabbbbabaabbbbbba
bababbbaabaabababbabbbaa
bbabbabaabaaaaaaabbaaabaabaabaabbbbaabbbbababaabbbbbaaaaababbabb
abaababaabaaaaabaaaababaaaaababaabbbaaaa
bbbabaabbaababaabaaababb
aaabababaaababbbbbabaaaaaaaaabbabbbaaabaabbbbaab
aaabaabbabbaabaabbabbaaabbaabbaaabbabbbbbbabbbabbabbaabaabaaabaa
abababbabbabbabbabbbbbaa
abbbababbabaababbbbabbba
ababaabbbbbaaabbbababbbaaaaabbbbbaaabaaabbbaaaba
aaababbaababbbaabbababbb
abaaaabaabaaabbabbaaaabababbabbbabbbaaba
bbabbaaaababababbaaaabaa
abbaabaaaaaabbbabababababbbaabbbbababaabbbbbabaaaaaabbabbbaaaabbaabaaaba
babbbbabbbbbbbbaaaaaaaaa
bbbbbabaaabbbabbaaaaaaba
baaaabbaaababaaaabababaa
bbaaaabbbabbababbbababbaaabbabba
abbabaabbbaaaaaabbababbbabaabbaabababaababaabbaa
bbbbbababbbbaaabbaaaaaaababbabbbaabaabab
babbabbbbabaaababbbabaaa
bbaaaaabaaabbaababbbaaabbbaabbba
babaabbbbbaaaaabbaabaaab
babbbbbbabbbabaaabaaaaabbbaaabbb
bbbaaabababbaabbbbbbbaababbabbaaabbabbabbbabababababbbbababbababababaabb
bbbaabbababbbbbbbaaaaaaa
aaabababbaabaabbbaabbababbbbbbbaabababbbaaabbaab
baaaaabababbabbbaaababbbbbaabaabbabbbabbbbababba
abaabaaaaabaaabbbabaaabb
bbbaaaaaaaaaabbbbababaaa
bbbababbababbbabbbababab
abbbabbaaababbbbaabbbbbbbaabababaaabbbab
abaabbaabaabbabaababbaaababbbbaababbabaaaabababa
abababbbababbaaabaaabbba
baabbababaabbaaaababaaba
bbbbbababbbaaaaabababaaa
babbaabbbbbababbaaabbaba
baabbbbabaabababbbbabbaaaabaabaaaaabaabaabababbabbaababababaaaaabbababaababbbbbbaabbbbbb
aaaabaababbbbbabaabaabaa
bbabbababbbbbaabaaabbbaa
bbaabbaaabaabbaabaababbb
aabaaabaaaabbaabbbbbbbabaabbbbbbbbbbbabaabbbabaaabbaabbb
abbaaabaabaababbabbbaaabbbaaabba
babbbbaaabbaabaabbbababbbababbaa
bbabaaaabaaaaaaaaabaaaab
abaabbababbabababaabbbabaabaaaababbbbbbb
abbbbbabbaaaaaaababbbaba
baabbbbbbbbabbbbbbabbbaa
bbababaaaabbbbbbabbaabab
babbbbbbaaaabaabaaaabaabaabbbbaaaaaaabab
aabbbaabbbaabbabbbababbaaabbbabbbbbbababbaabaabaabbaaaaaaabaaabbabaaaabaabbbababbbbbaaba
bababbabbbabaabbbaaaabab
abaabababaaabbaaabbbaaaa
bbababbababbababbbabaabaaabbaaab
bbbaabbaaaabababbbbaabab
bbbbbabaaaabbbabbaaabababbbbaaaabbabaabaaabababbaaabbaaaabbaabbbaaaaabbababbaaabaabbabaaabbbbabb
abababbaaabaabababaaabbb
aaaaaaabbabbabbbaaaabaababababababbabaabbbaaabba
bbbaaaabaaaababbabaabbab
abaabbaabbbbbbababaabbaabbbabaaaabaabbba
bbbaabbaabbaaaaabaaaabaababbaaba
bbbaabaabaaabaababaabaab
babbabaababbbbabababaaaa
aabbbaababababbabbabaabbbbbbabab
bbbbbbbbabbaabbbbbaababaaaabbaaaaabbaaaabaaabbaabaabbabbabaabbbabbbabaaa
abbaabbbbabbabbaaabaaaaabaaaabbabaaabbaaabbaababaaaaaaabbbaababbbbbaaaba
aaababababbaabaabbbaaabbbbaaabba
aabbbbbbaabbbbabbbbaabababaaaabbabaaaabbbaabbababaabbbaa
abbbabbabbabaaaabababaab
babaababbbababaabaabaabbabababaabaaabbba
aabaaabababbbbbbbababbbb
abbaaaababaabaabbbaaabbaabbabaabaabbbabbabaaaaabbbbaabbb
babbaaaababaabbababbbabb
baaaabaaaaaaabbabaabbabbbaabbababbbaabaabbbbbaaabbbabbbb
bbaaaababbbaaaaaaababaabbaabaaababbabaab
aabaaabbaaababaaaaaaaabbaababbbabaaababaabbabbabbaabbbba
aaabaabababbaaaabbaaaaaaaaaaaabbaabaabbbaabaaaababbabbbaaabbbbba
bbbababbbaabbbaaabababbbbabbbaaababbbbaa
bbaabaababaaabababaabbbb
bbaabbbaabbbbaaabbaabbbb
ababababbaaabbaaabbaabbb
abaaabbaabaaabbaabbbababbbbababbabbabbababbbbaabababaababbaabaaaabbbbaba
abbaabbaabbababbabbaabbbaabbaaabaabaaabaaabaabbbbbbaabbabababbab
abbaabaaaabbaaaababbbbabaabbbabaabababaa
baababbababaababbbaaabaa
baaabbbbbaaaabbaabaabaaaabbbbbabaababaabaabaabbb
babaabbbbbabaabbabaaaaabaaabababbbbbbbaaaaabbababbaabbab
bbababaabbaabbbabaaaabbb
ababaabbbaaababaaababbaa
aabababaabaabbbbabbabbbaabaabbbb
baabbaaaaababaabbabbbbba
bbbbbbbbbaababaabbabbbaa
ababbbabbbbbbaaaabaababb
bbabbabbababababaabababa
bbbbbbbbbaaaabbbabbaaababaabaaaaaaabbbaabbbaaabbabbbbabbbaabababbbabbbbb
bbaababaaabbbbbabaaababb
aabbabbbaabbbabbaaabaaba
baabbaaaaaaaabbaabbaabab
abbbabbabaababbaabaabbbb
baaaaaaababbabbbbbabbbaa
aabbaabbbaaabbbbbbbaabaabbabbababbaabaababbaababbbababba
bbbbbbbaaaaaababbbababab
aabbbbabababbaaaaaabbbab
aaaaaaabbabbaaabbbabbbaaababbbba
aabaaababaaabaababbabbabaaaabbabbbabaaba
bbbaaaabaaaaaaabababbaaababaaaaa
aaaaaaababaabaaababbbbba
ababbbabbaabbabbbabbbbba
babbbbabbbaaabbbbaabababbaaaabab
abbbbaaaabaaaaabaababbaa
abbaaaaabbaabbabbbabbbbabbbabaaaabbbbaaaabbabbbababababaababbbbb
aaabaabbaaaababababbabab
aabaaaabaabbabbaabababaabbbbabaa
aaabaabbbabbaabbaabababa
abbbaaabbbbaaaabaaabbbab
abaaaaabaaaaabbaabbbaabb
baababbabbbaaaaaaabaaabbaababbaababbbaaabbaaabba
bababbbaaaaabbbbaabbaabbbbbababaabababaaababaaaa
baaabbabbababbabaabaaaab
bbbbaaaaaaaaaaabaaabaaabbaaaabbabaaabaabaabbbaaaabbabbabbabaaabbaabaabaaabaaabbb
aaaaababbbaaababbabbabbabbaabbbbaaaabaaabbaababbaaaabaaa
bbbabbbbaabbbbbabababbabbabbaaabbbaaabababbaabaabaabaaaababbbbabbbaaabbabbbaaaaaababbaab
abababbababbabbbabaaabbaabaabbababbaabbb
aabbbbababbbabbbbabbbabb
bbabbaabbbbaaaabaaaabaabaabaaaaa
aaaaabbaababbaaabbbaabba
abbaabaaaaaaabaababbabab
aaaababaaabbbabbbaabaaabaaabbbab
aabbabbbaaaababbaabababa
aaabababbaaaaaaababbabaaaabaaaab
aabaabbabbbbbaaaababbabbabbbbaaababbbababbabbabbabababbaaaabaaababaabaababaababbbaaaabaaaabaabba
abaaaaaabbbaabbaabbbbbbbbabbbbbabbabaaabaaabbbbaabaabbbabbbbabababbbbaab
aabaabababbbabababbbbbaa
bbabbababbbbbaababababbaaaaabbaa
babaabbabaaaabaaaabaaabb
abaababaabaaaaaababbbbbbbabbbababbabaaab
bbaaababaaababaaababbbabbbaabbbaabaabaababbabaab
abbaabaaaaabaaaaaaaaabba
bababbbaabababbbbaaabbaababaaaaababbaaba
aaaabaabaaaaabbaabbbbabb
ababaabbbabbaaaabbabbbab
babaabababbaaabaababbaab
aaabababababbbbbbbaabbaaababbbbabaabbbba
aaaaaaababaaaababbabaaba
bbbbbabaaaaababbabaabbaabbbbaabbbbabaabbabaabbbbaaabbbabbbbabababaaaabbb
aaabaabaaabababbbbbbbbaa
bbbbaababbabaabbbaaabbabababababbbabbaababaabbbb
baabbabbabaababbbaabbabbaaaababbabbbbbbb
baabaababaaabbabaaabbabb
bbbbbaabaabbaabbaababbbabababbaa
bbbabbaaababaabbaabaababaaabbabb
bbbaaabbaabbabbaabbbaaaa
abbbbbabbbabaaabbaaaabababbbaabb
aabbbaaabbbababbabaababaaababbbaababbaaabbbaaaaaabbabbbb
aabaaaabbbbbbbbaabbabbbbbbabaabbbabbbaabbbaabbbabbbabbbaabbaaaaababbbabbbaabbbba
aabaaababaaaaaaaaaabbaba
babaabaabbbbbababbbabbbb
bbabbbabbaaaababaabbbaababbaabaaaaabbbaabbbbaaabbbabaabaaaabbbbbbbaaabaabbbaaabbabbababbbaaaabbb
aaabbaabbbbaabbaababaaabaaabbaba
aaaabbbbaaabbbbaaabbbaababbaabaabaabbabbbbbbaaaababbbaaabbbbbabaaabaabbaabbabbaaaaaabaaa
bbbbaababbbbaababaaaabab
ababababbbbbbababbbbbbbbabbbbbba
bbbababbbbaabbaaababbaba
baabbbbbbbabbaaabaabbbabbbbabbaaaabbbbaaaaabbaabaaaaabaaababbbbabbbbaaababaaaaaa
abaabaaaabaababbbbbabaaa
bbbaabaabbbbabbababbaaba
baabaaabbbaaaaaaaaaabbbaababaaaaabbabababbbaaabaabbaaaaabaababbaaabbabaaabaaabbbabbaabbb
bbaabaababababbaabbababa
bbabaabbaabbbaabbaaababb
abababbbbbaabababababbbaabbababa
aaaaaaabbaaaaaaaaabaaaaa
aabbbbababbbaaabaaababbaababaabbaabaabbb
aabbaababbabbaabbababbbb
bababbbabbaabbbabbbbaaabaabbbbababaaabbb
aaabbaababaaaababbbbabbbbbbababa
aaaabaababaaabababaaababaaabaaab
aaaababaabbbabaaaabaabababbbbaaabbabbaaaaabbbbbabbaaaabb
aabbaababbbbbabaabaaabbb
bbbabaabbaaaaaaaabababaa
bbbbabbababbabbbbbaabbaabaababbabbbaabab
aaaaabbabaabbbbbabaaaaaaaaaabbababbababb
bbabbababaaabaabbaababbb
ababaabbbabbbbabbbaabbab
babaaabababbaabbbaabbaabbbbaaaba
abaabaaababaabbabbbabbbb
bababbbaababbbaaaabbaaaabbabbbababbaaaaabbbbaababaabbbaa
aaaabaababbbbbabbaaaabab
abbababbbbabbbaaabbabbab
abbababbaabbbbaabbbbaabbabaaabababbabbaaabbbaaaabbabaabbbbbaaaba
aabbbbbabaaabbbbaabaaaaa
bbbbabbabaabbabaababaaba
baaabbbbbbaababaaaaaaaaaaabaabbaaaaabbabaaababab
ababaabbaabbaabbbabbbbab
bbbaaaaaabbbababbabbbbabaaababbabaabbbbaabbabbabaaabbbbbaaabbaaaaabbabaaabaabaaa
aaabbbabaaabaababbbbaabaabaaaabbaaaaabaaababbbbababaabaa
aaabaabbaaaabababaaaabab
bbabaaaaaaabbbbabbabbaabaaaaaabbbbbbbbaa
abaaaabaabbaaaaaaaaababbbbbaabbaaabaabba
bbaabbbababbbbababbbaaba
aaabbaabaabbaaaabbbbbaaabbabbababbbbbaab
abbbabbbbbbbbbabaaaaabbaaabaaaababbbaaba
bbbaaabaaaabaababbbabaababbbaaabbaabbaabbbbbbaaabbababab
aaabbaabbbabbabbababbbaa
abaaabbaabaaaaabbabaaaab
baabbbbbbabaababbaabaaaa
baabbaabababbbababbabbab
bbbbaabbabbbabaaaaaababbabaaababbabbabaabbbbababbabbbabaabbabaaa
bbaabaabbbbaaaababababbbaabaabba
aaababbbbbbaabaabababaaa
babababbbbbbabaabaabbaababaaabbabbbbabbbbaaaabbb
baabbabbaaaaabbabbbabaaa
abbaaaaabbababaabaaaaabb
bbabaabbbaaabaaaaabbbbabbbaabbbaaaabaaabaabbabab
abababbababbbbaaabbaabba
aabbbbabbbbbbaababbbababbaabbbbbabaababaaabaaaab
bbbaaabbbaabbabbabababbababbaaaabbbbbaabaaabbbbabaabbbabaabaabbbbbbababaababbbaa
babababbaaababaabaabbbbbbaabbaabbbaabbbb
baaabbababaabbaaabbbbbaa
aabbbbbabbaabaabaaabaaaaaaabbbaa
bbaabaabbbababbbabaabaab
aababaabaabaaabbaaababbbbbbabbbbaabaabba
bbbaaabbbabbbbabaabbbaaaabaababaabbbbbaa
bababbababababbaaaaaaaba
aabbbaabbbabbaaababbbbabbabbbbbbbabbbaaa
bbbaaaaaaaabaaaabaaababb
bbaaababbbbbbabaabbbbaba
baaabbbbbbbabbaaabbabbaa
abaababbabaaaaaaaaabaaaabaaaaabaaaaabbabbbbababa
baabaaabbbbbababaaabbbabbbaaaaab
aaababaababbbbaaabaababa
aababaabaaaaaaaaabbababaaaababbbbbbbbabb
baaabababbbabaababbbbbbb
babababbaabbbbabbabaaabb
bababbbabababbbabaabbbab
baaabbaabbbbbbabbaabbbab
ababbbbbbabbaaaabbbbabaa
baabbbbabbbbbbaabababbabaababababababbaaababbaaaabbbabbabbabbaaabbbababa
babaabbabbabbaaabbabbabbbabbababbbbbbbaa
aaaababababaaabaaabaaaabaababaaabbaabbbabbbabbaaaaaabbbbbbbabbabbbabaabaaaababbbabababaaaabaabaa
abbbbaaabbbbbababaaaabbabaaabaabbabbbaab
aaaaaabbbbaaaaaabaaaaabb
aaaaabbabbaabbbbaabbbbaabbabaabbaabababbaaaaabbbbbaaaaaabbbbaabbabbabbababbaabaa
babababbabababbbaaabbaba
bbabbaabbbbbbaaabbaabbbaababbaab
bbaabbaaaabbbbbbaabbaabbbabbbaaa
abbaabaaabaaababbbaaabba
abaaaaaababaabaaababbabb
baaabaabbbbabbaabaabaaab
babbabbbaaaaaaabbbbaaaba
aaabaabbbaaababaaabaaabaaabbabbababaaaab
bbbaaaabbbbaabbbbaabbabaababbbbaaaaaabbabbaabbbabbbbabab
abaaabbaabbbbbababbabaaa
aaababaabbbaabbaaaaaabaaabbabbba
ababbaaabbabbaaabaabaabbaaabaaaaabbaabba
ababbbbbbbaabaabaaabaabbabbaababbbbaabbb
babbbbbbaababbbbbabbaaba
bbbaaaabbabababbabababbb
babbbbaabababbbaabababbababaabaabaaaabbbbbaaaabbaabbabab
abbbbababbbbbbbabbbbaaababbbbababbbbabbaaabbabbbbaababbabbabababbbabbabbabaaabbabbbbbaaa
abbbabbaaaababababaabbaabbaababaabbaaabbabbaabbb
aaababaaaaabbaabbbaaababbaabbbbbbbaabaaababaaaab
aabbaabbabbbbaaababaaaaa
bbbaabbaabababbababbabbbbaaaaabbbbaaaabb
aabbaaababaaabaaabaabbbbaaabbbab
baaaabbabbaabababbaaabba
aabbbaaaaababbbbbaaabaaa
aababaababbaabaabbababaabbababbaaabbabba
bbaabbaaababbaaababababa
abaababbbabbabaaababaaaa
aaaaabaaababbbabbbbbbaab
bbbababbbbbbbbbabbabbbab
bababbabbababbbaababbbbbaabbaaab
aaaaaabbaaaabaabaabaabba
babaabbabbaabababbbaabaaaaabbabb
bbbaaabaabbabababbbaaaba
aabbbbbbaabbbabbbbaaaaabbabbbaabababbaba
abbbabbaabaabaabaaabaaaa
abaabaaaaaabbbbaaaababaaaababbbabbaabaabababbaababbabbbbbbabaaba
bbabbabbababbaaaabaabbbb
aabbbababbbaaaaabbbabbaaaaabaaabaaabaaabbbaababbbaaabbaabbbbabaaaabbaaabbaaaababbaabbbbb
ababaaabbababbabbabaaaaa
abaaaaaaabbaabbbaabbaababbbbbbab
aaababbabaabbbbbbbbaaabbbabbbaab
aabbaabbbaaabbababaabababbaaabbbbbbaabab
bbaaaaaabbbbbabaaabaaaaa
abababbbaaaaabaabababaab
abaaabbaaabbbbabaaaabbab
abbabbaabbabbbbabaaabbabaaabaaababaaaaabaaaabababbabbaba
bbbabbaaabaaabbaabbbabbababbaabb
babbbabaababbabaaabababbbbabaaaabbbaababbaaababb
aabaaabaaabbbaaaababababaaaabbab
bbbaaaabbababbbaabbabaab
aaabababaabaaabbbaabbbba
baababaabaaabaabbaabbabaababaaaabbbbabab
aabbbabbaabbbaaaaabbbbbababaaabababbbaaa
abaaabababaaaabaaaabbaba
aaaababbbaaaaaaaabaaaaaaaababbaaabbaaaab
bbabaabbababbaababababaaabbbbabb
ababaabbaaaaabbbbbaaabba
ababaaabbaaabbaababbbbbbabbaabba
bbbbbabbabbabbbabbabaababbbbabbabbbabababbaababbaabaaaaaabababaababababb
abaaabbaabbaaaaaababaaaa
baabaabbbabaabaabbbaabbabaabbbaabbaababbaaabaaab
baaaabbaababbbbaababbaba
aabaaabaabaaabbaaaabbbbaaabbbbaa
baaababaaaabaaaababaaaab
bbaababbabaabaabbbaabaabbbbaaabbabbabbbbbabbaabbbbbaaaababbbaabb
bbbababbbbbaaabbbabbaaaababbbbbbaaabbbabaabbabaaaaabaaba
bbabaabbbabaabbbaabbaababbbaabbbbbaaaabb
abaabaaabbaabaababaabbbb
abaaabaaaabbabbbbbabababbaabababbbbababbaababbbbaaaaaaaaaaabaaabbbaaaaababbababb
bbbaabbabbbaabbbbabbabab
bbbaaaaaaabbbabbaaaabbaa
aaaabbbbababaaabbbbbbaabbabaabbabbaaabaaababaaaaaaaaaaaa
bbaaababbaabaabbbaaabaabaabbbbaaababbaab
aabbbaaabaaabbaabababbba
bbaaababaaaababbbaaabaabbbbababa
bbbaaaaabbbbbbabaabbabbbabbabbbb
baaababaaaabababaaaabaaabaabbabbababbbabaaaababbaabaabbbaaababbbbbbaabaabbaababababbbbbb
bbbbbabbaaaaabbaabbaaaaaabbbabaabbbbbbaa
baaaabbabbabbaabbaabaaaa
abbaaaaabbbbbbbabaaaabbaabaaaabb
abbaabaabbaaabbaabbaaaabbaaaaabaaababbbbbbbabbbaaaabbbabbbbabaaababbabaaaabaabbbbbbababb
baabaaaababaaaabbabbbabb
baababbababaabbabbbabaaa
bbaabbbaaaaaabaaabaaaaaabbbaaaaaabaababbababaaaaaaaabbabbababbaa
bbbabbaaaabbbbababaaaaaaabaaaaaaabababbbbbbababa
bbaabababbbaaaabaabbbbbabaabaabaabbbbabbabaaaabb
abababababaaaaaababbbbaaaabbbbbbaababbbaaabaabbbaababbaaabababaa
abaabbaababbaaaababbbaab
abbbbaaaabababbabbabbaabababbaaabbaaabba
bbaaaaabbabbabaabbabbaaaaabbabababbaaaabababbbbabbaaabbbbabababa
bbbaabaabababbabaabbaaaababaaaabaabaaabaabbbaabbaababbababbbaaabbbaaaaba
aaabbaabbaaabbbbbaabaabaaabbbaaabbaabbaabaaaaaaaabbaabba
baaabbbbaabbaabaaaabbaaa
bbabaaaabaabbababbbbbbbaaabbbaaaaabaabbbbabbbabb
abbaaabaaababaabbabbbaba
abbbaaabbaabbababbbbabab
babaabaaabababababbaabba
bbabaaaabaabbaaabaabbaaababaabaababbabbbbaaaabaaababbbaaabbaabbaaaabbabaababbababbbbbbaa
babaaaaabababaaaabbbaabbaaababbbaabbabbbbaaaabba
aabababaabbbaabbbabababbaabbbbbabaaaaababaaaabbbabaabaaaaaaaabaaaaaaaabb
baabbbabaaabbaabbaaaababaabbabbbbbbaabbbbaaabbaaaaaababbbbabbbbabaabaaaabbaabbbaabaaaabbbbaabbbb
aaabbaabbaababbaaabababa
bbaaababbbaaababbbaaababaaababaabaaaaabaaabababbaababbababbabbba
aabbabbbbabbbbaababbbaaa
abaabaaabaaaaaaabbaabbabaaaaaaabbbbabbaabbabbbab
ababaabbbabbabaaabbbaaaa
abaabbaaabbaaabaaaaabaaa
bbbaabaabbaabaabbaabbabbbbbaabbaaabaaaaa
babbaaaabaabbaaaababbbbbbbbbaaaa
bbaaaaabbbababaaaaaaaaaa
abbbabbbbbabaaaaabababab
baabaabbbaaabababababaaa
aabaabaaabbbbaababbaaabbbbaaabbbabbbbabaabbbaaba
babbaaaaaaabaabbbbbbabaa
ababaaababaabbbbbaabbbbabbabaababaabaaaa
abbbabaaaabbaaaabbbbbbbabbaababb
bbbabbbbaaabbabbbabbabba
baababbaababbaaaaaabbbbb
abaabaaaaaaaaabbbbaababaabaaaaaaaaabaaba
baaabbbbaabbabbbbbbbbaabbaaababbaabbabab
bbbabbaababaaababbaabaaa
abbabbaaabbbaabaaabaabaa
ababaaabbaaabbaabaaaabbb
abaabbaaabaaababaaaabbaa
baababaaaababbbbabbabbaa
bbbbaababbababaaabbbbaab
aababbbabbbaaabbaabbabbbaaababbabbabbbba
abababbaababbaaabbbaabaababababbbaaabbaabbaaaaaaaabbaaababbbbbba
aaaaaabbbaaababaaaabbaaa
abaabbaaaababaabbababbbabbbbabbb
aabbabbbaababbbbbbbbaabbbabbabbbbaaababb
babababbaaabbbbabbbababa
aababaaabaabaabbbabbaaaababaaabb
bbbbbaaababaabaababaaababaaaabbaaaabbabb
bbbaaabbbbabbabababaabbbbbaaaaaaababbbababbbbbaaabaabbbabbbaaaba
aaaababaaabbbabbabaabbbb
babaaabaabababbaababaaaa
abbaabaabbbbbaabbaaaaabb
abbbbabaaabaaaabbabbaabaaaaabbab
abaaabbaaabaaabaababbabb
abbbbbabaabaababbaababbaaaabaaab
bbabbababbaababbbbabbbbabbabaabbbbaabbabbbabbabbaabaabbbabaaaaababbababbaaababababbabbab
bbbbbaaaabaabbaaabaaaabaaaaaaabbbaaaabaaabbababbaaabaaba
bababaaabbbbabbaababaaabbbababbaababbaaaabbaabbaaaabbbab
bbabbabaaaabaabbbabbabbbabbbaaba
ababaaabbaababaaaaaaabbabaaaaabaaabbabab
bbbaabbaababbbbbaabbbaabbbbaabba
baaabaabaaaababbabaaabaababbaabaabaabbbaabbaabbb
abaaabbaabaaabaabaabababaaaabbababaabbabababbaabbaaabaab
abbaaaabaababbabababaaba
bbbabbbabaababaaaaaabbababbabbbaaaabbbab
bababbabbbabbabaaabbbbbabaabaaaa
abababababaabaaabbabaabbababbbaa
bbbbaabbaabbaabaabbbabaabbabbaaabbaaabaa
aaababaaaaabbbbabaabbbba
babbbbabbbaaaabaabbababa
abaababbaabbaaaaaabaabaa
abaabbaabbabaabbbbaabbbaaaaaabbbbaabaaabbababbaa
abbaaaaaaabbbbababababbbaaaaaaaa
baaaabaabbabbbaaaaaaaabaaaabaabaaabbbabbaaaabbbb
aaaababaabbbabbabaabbaaabbbabbbababbbaab
bbaabaababaabaaaabbbabaaabbabbab
bbbbabaababbbaaaabbaaabaaabababababaaababbaaaabbbaaababa
abaabaaaaababbbbbaaabbba
baabbabbbabbbbabbbbbbbbbaaaaabbaabaaabbabbbabbba
babaabbaabbbbbaababbbabbaabaabbaaabbabaa
abbbbbabaaaabaabbbbaaaaaabbbababbaabaabababaaabbaaaaaaaaabbbbabb
ababababbaaabbbbbbbbabaa
abaaaababbbabbaaabbabbab
aabbaabbbbbaabaabbbababa
baabbaabbabbbbaaaabababa
babbaabbbbbbababaabbbbabaabaabbaabbbaaaaabaabbab
abbabbbaabbaabbababbbaababbbbaab
bbbbbbbaaabbabbbaaabbaba
babbaabbabbbaaabbbaabbbaabababbbaabaaabbaaabbabb
bbaaaababbbbbaaabbaaabba
aaaabababaabbaabbabaaaaa
bbabaaaaaabbbaabbabbbbbbbbbabbaabaaaaabbaabaabbb
aabbbbabbabbbbaabaaabbbbababaabaabaabbbbbaabbbba
aaababaabbbababbbbababab
baaabbbabaaabaaaaababbaabbaaabba
baabaabaababbaaabababbbb
baababbabaaaaabaaaaabaabababaaabbabbbbabaaaaaabaaaaaababaabaabba
aabaaabbaababaabaaabaaab
babababbbbaaaabaabbaaaab
bbbaaabbbbabaabaaaaabbab
"""

let
    ruledict = Dict()
    rulelines, messagelines = split(input, "\n\n")

    for line in split(rulelines, "\n")
        p = split(line, ":")
        n = parse(Int, p[1])
        if occursin("\"", p[2])
            s = String(strip(p[2]))
        else
            s = []
            for t in split(p[2], "|")
                arr = []
                for x in split(t)
                    push!(arr, parse(Int, x))
                end
                push!(s, arr)
            end
        end
        ruledict[n] = s
    end

    messages = strip.(split(messagelines, "\n"))

    function canbemadefrom(rulenumbers, s)
        t1, t2 = isempty(rulenumbers), isempty(s)
        (t1 || t2) && return t1 && t2
        rule1 = ruledict[rulenumbers[1]]
        if rule1 isa String && occursin("\"", rule1)
            return occursin(s[1], rule1) ?  canbemadefrom(rulenumbers[2:end], s[2:end]) : false
        end
        return any(r -> canbemadefrom([r; rulenumbers[2:end]], s), rule1)
    end

    println("Part 1:", count([canbemadefrom([0], m) for m in messages]))

    ruledict[8] = [[42], [42, 8]]
    ruledict[11] = [[42, 31], [42, 11, 31]]
    println("Part 2:", count([canbemadefrom([0], m) for m in messages]))

end

