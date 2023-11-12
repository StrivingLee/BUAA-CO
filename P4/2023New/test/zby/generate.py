import random
import sys

Instr = {0: "ori", 1: "addu", 2: "subu", 3: "lw", 4: "sw", 5: "lui", 6: "beq", 7: "nop", 8: "jal", 9: "jr"}
Reg = {0: "$0",
       1: "$1",
       2: "$2",
       3: "$3",
       4: "$4",
       5: "$5",
       6: "$6",
       7: "$7",
       8: "$8",
       9: "$9",
       10: "$10",
       11: "$11",
       12: "$12",
       13: "$13",
       14: "$14",
       15: "$15",
       16: "$16",
       17: "$17",
       18: "$18",
       19: "$19",
       20: "$20",
       21: "$21",
       22: "$22",
       23: "$23",
       24: "$24",
       25: "$25",
       26: "$26",
       27: "$27",
       28: "$28",
       29: "$29",
       30: "$30",
       31: "$31"}


def ori(rt, rs, imm):
    imm = hex(imm)
    print("ori " + rt + "," + rs + "," + str(imm))


def addu(rd, rs, rt):
    print("addu " + rd + "," + rs + "," + rt)


def subu(rd, rs, rt):
    print("subu " + rd + "," + rs + "," + rt)


def lw(base, rt):
    offset = 4 * random.randint(0, 10)
    print("lw " + rt + "," + str(offset) + "(" + base + ")")


def sw(base, rt):
    offset = 4 * random.randint(0, 10)
    print("sw " + rt + "," + str(offset) + "(" + base + ")")


def lui(rt):
    print("lui " + rt + "," + str(hex(random.randint(0, 65535))))


def beq(rs, rt, label):
    print("beq " + rs + "," + rt + "," + label)


def nop():
    print("nop")


def jal(label):
    print("jal " + label)


def jr(rs):
    print("jr " + rs)


mip = open("mips1.asm", "w")
mip.write("ori $29,$0,0x22fc\n")
mip.write("ori $28,$0,0x1800\n")
mip.write("ori $31,$0,0x3000\n")
sys.stdout = mip
Labels = []
i = 0
epoch = 200  # 修改这里表示每次生成的asm代码行数
jal_flag = 0
for i in range(epoch):
    Labels.append("label" + str(i))
label_num = 0
for i in range(epoch):
    instr = random.randint(0, 9)
    rs = random.randint(0, 30)  # 不要操作32号寄存器比较好
    rt = random.randint(0, 30)
    rd = random.randint(0, 30)
    base = random.randint(0, 30)
    print("label" + str(i) + ":", end="")
    if instr == 0:
        imm = random.randint(0, 65535)
        ori(Reg[rt], Reg[rs], imm)
    elif instr == 1:
        addu(Reg[rd], Reg[rs], Reg[rt])
    elif instr == 2:
        subu(Reg[rd], Reg[rs], Reg[rt])
    elif instr == 3:
        ori(Reg[base], Reg[0], 4 * random.randint(0, 127))
        lw(Reg[base], Reg[rt])
    elif instr == 4:
        ori(Reg[base], Reg[0], 4 * random.randint(0, 127))
        sw(Reg[base], Reg[rt])
    elif instr == 5:
        lui(Reg[rt])
    elif instr == 6:
        if i < epoch - 1:
            lab = random.randint(i + 1, epoch - 1)
            beq(Reg[rs], Reg[rt], Labels[lab])
        else:
            print("nop")
    elif instr == 7:
        nop()
    elif instr == 8:
        if i < epoch - 1:
            lab = random.randint(i + 1, epoch - 1)
            jal(Labels[lab])
            jal_flag = 1
        else:
            print("nop")
    elif instr == 9:
        if jal_flag == 1:
            jr(Reg[31])
            jal_flag = 0
        else:
            nop()
    else:
        print("nop")
