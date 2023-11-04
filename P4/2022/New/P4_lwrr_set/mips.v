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

    // The wire Controller needs
    wire [2:0] ALUControl;
    wire MemRead;
    wire MemWrite;
    wire RegWrite;
    wire [2:0] Mem2Reg;
    wire [2:0] EXTControl;
    wire ALUSrc;
    wire [1:0] RegDst;
    wire [2:0] NPCControl;
    wire Beq;
    wire Bgtz;
    wire Bal;

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
    wire BalSign;

    // The wire DM needs
    wire [31:0] MemAddr;
    wire [31:0] MemData;
    wire [31:0] MemReadData;
    wire [31:0] ReadByteData;
    
    // The wire EXT needs
    wire [31:0] EXTImm32;
    
    // The wire NPC needs
    wire [31:0] PC4;

    // Splitter
    assign opcode = Instr[31:26];
    assign rs = Instr[25:21];
    assign rt = Instr[20:16];
    assign rd = Instr[15:11];
    assign shamt = Instr[10:6];
    assign funct = Instr[5:0];
    assign Imm16 = Instr[15:0];
    assign Imm26 = Instr[25:0];

    // assign A1 = rs;
    // assign A2 = rt;
    assign SrcA = RD1;
    // assign SrcB = RD2;
    assign MemAddr = Result;
    assign MemData = RD2;

    IFU MyIFU (
    .clk(clk), 
    .reset(reset), 
    .NPC(NPC), 
    .PC(PC), 
    .Instr(Instr)
    );
    Controller MyController (
    .opcode(opcode), 
    .funct(funct), 
    .ALUControl(ALUControl), 
    .MemRead(MemRead), 
    .MemWrite(MemWrite), 
    .RegWrite(RegWrite), 
    .Mem2Reg(Mem2Reg), 
    .EXTControl(EXTControl), 
    .ALUSrc(ALUSrc), 
    .RegDst(RegDst), 
    .NPCControl(NPCControl),
    .Beq(Beq),
    .Bgtz(Bgtz),
    .Bal(Bal)
    );
    GRF MyGRF (
    .clk(clk), 
    .reset(reset), 
    .RegWrite(RegWrite), 
    .A1(rs), 
    .A2(rt), 
    .RegAddr(RegAddr), 
    .RegData(RegData), 
    .PC(PC), 
    .RD1(RD1), 
    .RD2(RD2)
    );
    ALU MyALU (
    .SrcA(SrcA), 
    .SrcB(SrcB), 
    .ALUControl(ALUControl), 
    .shamt(shamt), 
    .Zero(Zero), 
    .GreaterZero(GreaterZero), 
    .LessZero(LessZero), 
    .BalSign(BalSign),
    .ALUResult(Result)
    );
    EXT MyEXT (
    .Imm16(Imm16), 
    .EXTControl(EXTControl), 
    .EXTResult(EXTImm32)
    );
    DM MyDM (
    .clk(clk), 
    .reset(reset), 
    .MemWrite(MemWrite), 
    .MemRead(MemRead), 
    .PC(PC), 
    .MemAddr(MemAddr), 
    .MemData(MemData), 
    .MemReadData(MemReadData), 
    .ReadByteData(ReadByteData)
    );
    NPC MyNPC (
    .NPCControl(NPCControl), 
    .Zero(Zero), 
    .GreaterZero(GreaterZero), 
    .BalSign(BalSign),
    .Beq(Beq), 
    .Bgtz(Bgtz), 
    .Bal(Bal),
    .PC(PC), 
    .Imm26(Imm26), 
    .EXTImm32(EXTImm32), 
    .GRFrs(RD1), 
    .NPC(NPC), 
    .PC4(PC4)
    );

    MUX_8_32 RegDataMUX(.in0(Result), .in1(MemReadData), .in2(EXTImm32), .in3(PC4), .in4(ReadByteData), .sel(Mem2Reg), .out(RegData));
    MUX_4_5 RegAddrMUX(.in0(rt), .in1(rd), .in2(5'b11111), .sel(RegDst), .out(RegAddr));
    MUX_2_32 SrcBMUX(.in0(RD2), .in1(EXTImm32), .sel(ALUSrc), .out(SrcB));


endmodule