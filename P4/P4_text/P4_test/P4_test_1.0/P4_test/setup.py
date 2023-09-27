import os

Mars_prj_add = "mips1.asm"  # mars源文件地址，需要自己修改
Mars_prj_for_cpu = open("cpu_test.asm", "w")  # 生成的向CPU导入的asm文件，将addu，subu转为add，sub
with open(Mars_prj_add) as prj:
    while True:
        line = prj.readline()
        if not line:
            break
        line = line.replace("addu", "add").replace("subu", "sub")
        Mars_prj_for_cpu.write(line)
Mars_prj_for_cpu.close()
bat = open("getCompile.bat", "w")
mips_tb = open("src\mips_tb.v", "w")
mips_tb.write("`timescale 1ns / 1ps\n" +
              "`include \"mips.v\"\n" +
              "module mips_tb;\n" +
              "\n" +
              "\t// Inputs\n" +
              "\treg clk;\n" +
              "\treg reset;\n" +
              "\n" +
              "\t// Instantiate the Unit Under Test (UUT)\n" +
              "\tmips uut (\n" +
              "\t\t.clk(clk), \n" +
              "\t\t.reset(reset)\n" +
              "\t);\n" +
              "\tinitial begin\n" +
              "\t\t$dumpfile(\"mips_tb.vcd\");\n" +
              "\t\t$dumpvars;\n" +
              "\t\tclk = 0;\n" +
              "\t\treset = 1;\n" +
              "\t\t#20;\n" +
              "\t\treset = 0;\n" +
              "        \t\t#4096;\n" +
              "\t\t$finish;\n" +
              "\tend\n" +
              "      \talways #1 clk = ~clk;\n" +
              "endmodule")
os.system(
    "java -jar Mars_Changed.jar nc mc CompactDataAtZero a dump .text HexText src\code.txt cpu_test.asm")  # 导出指令
os.system("java -jar Mars_Changed.jar mc CompactDataAtZero nc " + Mars_prj_add + " > std.txt")  # 用Mars运行正确结果

bat.write("cd src\n")
bat.write("iverilog -o mips_tb.v.out mips_tb.v\n")  # 首先要写一个tb 命名为mips_tb.v
bat.write("vvp mips_tb.v.out > out.txt\n")
bat.write("cd ..")
