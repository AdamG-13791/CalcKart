import sys

fName = sys.argv[1]

f = open(fName, "r")
lines = []

for line in f:
    if (line[0] != "_") and (not("DRAWFLOOR" in line)):
        lines.append(line)

f.close()
f = open(fName, "w")

f.writelines(lines)
