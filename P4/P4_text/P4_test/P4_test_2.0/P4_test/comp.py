from filediff.diff import file_diff_compare

tmp = open("src\out.txt", "r")
out = open("out.txt", "w")
while True:
    line = tmp.readline()
    if not line:
        break
    if "@" == line[0]:
        if not (" " == line[12] and "0" == line[13]):
            out.write(line)
out.write("\n")
out.close()
file_diff_compare("std.txt", "out.txt")
