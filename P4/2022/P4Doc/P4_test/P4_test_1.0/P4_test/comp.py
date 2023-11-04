from filediff.diff import file_diff_compare

tmp = open("src\out.txt", "r")
out = open("out.txt", "w")
std = open("std.txt", "r")
while True:
    line = tmp.readline()
    if not line:
        break
    if "@" == line[0]:
        out.write(line)
out.write("\n")
out.close()
std.close()
file_diff_compare("std.txt", "out.txt")
