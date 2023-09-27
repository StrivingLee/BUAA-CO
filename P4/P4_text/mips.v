`timescale 1ns / 1ps
module mips(
    input clk,
    input reset
);


    // The wire IFU needs
    wire [31:0] NPC;
    wire [31:0] Instr;
    wire [31:0] PC;

    // The wire Splitter needs
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] funct;
    wire [15:0] Imm16;
    wire [25:0] Imm26;

    // The wire ByteSplitter needs
    wire [1:0] ReadOffset;

    // The wire Controller needs
    wire [2:0] ALUControl;
    wire MemRead;
    wire MemWrite;
    wire RegWrite;
    wire [2:0] Mem2Reg;
    wire [1:0] EXTControl;
    wire ALUSrc;
    wire [1:0] RegDst;
    wire [2:0] NPCControl;
    wire beq;
    wire bgtz;

    // The wire GRF needs
    wire [4:0] A1;
    wire [4:0] A2;
    wire [4:0] RegAddr;
    wire [31:0] RegData;
    wire [31:0] RD1;
    wire [31:0] RD2;

    // The wire ALU needs
    wire [31:0] SrcA;
    wire [31:0] SrcB;
    wire [31:0] Result;
    wire Zero;
    wire GreaterZero;
    wire LessZero;

    // The wire DM needs
    wire [5:0] MemAddr;
    wire [31:0] MemData;
    wire [31:0] MemReadData;
    wire [31:0] ReadByteData;

    // The wire NPC needs
    wire [31:0] PC4;
    wire [31:0] EXTImm32;

    // Splitter
    assign opcode = Instr[31:26];
    assign rs = Instr[25:21];
    assign rt = Instr[20:16];
    assign rd = Instr[15:11];
    assign shamt = Instr[10:6];
    assign funct = Instr[5:0];
    assign Imm16 = Instr[15:0];
    assign Imm26 = Instr[25:0];

    // Byte Splitter
    assign ReadOffset = Result[1:0];

    assign A1 = rs;
    assign A2 = rt;
    assign SrcA = RD1;
    assign SrcB = RD2;
    assign MemAddr = Result;
    assign MemData = RD2;

    IFU MyIFU(clk, reset, NPCControl, NPC, PC, Instr);
    Controller MuController(opcode, funct, ALUControl, MemRead, 
    MemWrite, RegWrite, Mem2Reg, EXTControl, ALUSrc, RegDst, NPCControl);
    GRF MyGRF(clk, reset, RegWrite, A1, A2, RegAddr, RegData, PC, RD1, RD2);
    ALU MyALU(SrcA, SrcB, ALUControl, shamt, Zero, GreaterZero, LessZero, Result);
    EXT MyEXT(Imm16, EXTControl, EXTImm32);
    DM MyDM(clk, reset, MemWrite, MemRead, ReadOffset, PC, MemAddr, MemData, MemReadData, ReadByteData);

    MUX_8_32 RegDataMUX(.in0(Result), .in1(MemReadData), .in2(EXTImm32), .in3(PC4), .in4(ReadByteData), .sel(Mem2Reg));
    MUX_4_5 RegAddrMUX(.in0(rt), .in1(rd), .in2(5'b11111), .sel(RegDst));
    MUX_2_32 SrcBMUX(.in0(RD2), .in1(EXTImm32), .sel(ALUSrc));


endmodule