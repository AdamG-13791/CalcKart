import math
import sys
import os

n = sys.argv[1]
f = open(n + ".z80", "r")
t = f.readlines()
f.close()
o = ""

code = False
tId = 16

for i in range(len(t)):
    l = t[i]
    if l[:7] == "\tMODULE" or l[:7] == "\t.optsd" or l[:5] == "\tXREF":
        l = ';' + l
    if l[:5] == "\tXDEF":
        l = ';' + l
    if l[:5] == "\tDEFS":
        # Check variable size
        s = int(l[6])
        t[i-1] = t[i-1][0:-2] + " .equ temp + " + str(tId) + "\n"
        l = ";" + l
        tId += s
    if l[0] == '.':
        l = l[1:-1]
        l = l + ":\n"
    if l == "; code\n":
        code = True
    if l[0] == '_':
        l = "c_" + n + l
        #if code == False:
        #    l = ';' + l
    # Replace variable name
    if l[0] == '\t':
        j = 0
        while(j < len(l)):
            if l[j] == '_':
                if l[j-1] != 'l':
                    l = l[:j] + "c_" + n + l[j:]
                    j = 2000
            j += 1
    t[i] = l
for l in t:
    o += l
    
f = open(n + ".z80", "w")
f.write(o)
f.close()

