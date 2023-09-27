`timescale 1ns / 1ps
module Controller(
    input [31:0] Instr,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [4:0] shamt,
    output [15:0] Imm16,
    output [25:0] Imm26,
    output [2:0] ALUControl,
    output MemWrite,
    output RegWrite,
    output [2:0] Mem2Reg,
    output [2:0] EXTControl,
    output ALUSrc,
    output [4:0] RegAddr,
    output [3:0] MDUControl,
    output [3:0] SControl,
    output [3:0] LControl,
    
    output calc_r,
	output calc_i,
    output beq,
    output bne,
    output bgtz,
    output jal, 
    output jr,
    output slt,
    output sltu,
	output load,
	output store,
	output lui,
    output lwmx,
    output md,
    output mf,
    output mt,
    output set
);
    parameter ADD = 3'b000, SUB = 3'b001, AND = 3'b010, OR = 3'b011, XOR = 3'b100, SLL = 3'b101, SLT = 3'b110, SLTU = 3'b111;
    parameter ALU = 3'b000, DM = 3'b001, EXT = 3'b010, PC = 3'b011, HI = 3'b100, LO = 3'b101;
    parameter SW = 4'd1, SH = 4'd2, SB = 4'd3;
    parameter LW = 4'd1, LH = 4'd2, LB = 4'd3;
    
    wire [5:0] opcode, funct;
    assign opcode = Instr[31:26];
    assign rs = Instr[25:21];
    assign rt = Instr[20:16];
    assign rd = Instr[15:11];
    assign shamt = Instr[10:6];
    assign funct = Instr[5:0];
    assign Imm16 = Instr[15:0];
    assign Imm26 = Instr[25:0];

    assign R = (opcode == 6'b000000);
    assign add = R & (funct == 6'b100000);
    assign sub = R & (funct == 6'b100010);
    assign sll = R & (funct == 6'b000000);
    assign mult = R & (funct == 6'b011000);
    assign multu = R & (funct == 6'b011001);
    assign div = R & (funct == 6'b011010);
    assign divu = R & (funct == 6'b011011);
    assign mfhi = R & (funct == 6'b010000);
    assign mflo = R & (funct == 6'b010010);
    assign mthi = R & (funct == 6'b010001);
    assign mtlo = R & (funct == 6'b010011);
    assign isAnd = R & (funct == 6'b100100);
    assign isOr = R & (funct == 6'b100101);
    assign isXor = R & (funct == 6'b100110);
    assign jr = R & (funct == 6'b001000);
    assign jalr = R & (funct == 6'b001001);
    assign slt = R & (funct == 6'b101010);
    assign sltu = R & (funct == 6'b101011);
    assign andi = (opcode == 6'b001100);
    assign ori = (opcode == 6'b001101);
    assign xori = (opcode == 6'b001110);
    assign lb = (opcode == 6'b100000);
    assign lh = (opcode == 6'b100001);
    assign lw = (opcode == 6'b100011);
    assign sb = (opcode == 6'b101000);
    assign sh = (opcode == 6'b101001);
    assign sw = (opcode == 6'b101011);
    assign beq = (opcode == 6'b000100);
    assign bne = (opcode == 6'b000101);
    assign lui = (opcode == 6'b001111);
    assign jal = (opcode == 6'b000011);
    assign j = (opcode == 6'b000010);
    assign lb = (opcode == 6'b100000);
    assign bgtz = (opcode == 6'b000111);
    assign addi = (opcode == 6'b001000);
    
    
    assign lwmx = (opcode == 6'b101010);
    

    assign ALUControl = (sub) ? SUB :
                        (isAnd | andi) ? AND :
                        (isOr | ori) ? OR :
                        (isXor | xori) ? XOR : 
                        (sll) ? SLL :
                        (slt) ? SLT :
                        (sltu) ? SLTU : 
                        ADD;
    assign MemWrite = sb | sh | sw;
    assign RegWrite = calc_r | calc_i | load | lui | md | mf | mt | set | jal | jalr;
    assign Mem2Reg = (load) ? DM :
                     (lui) ? EXT :
                     (jal | jalr) ? PC :
                     (mfhi) ? HI :
                     (mflo) ? LO :
                     ALU;
    assign EXTControl = (load | store | addi) ? 3'b001 : // sign
                        (lui) ? 3'b010 : // upper
                        3'b000; // zero
    assign ALUSrc = (calc_r | md) ? 1'b0 : 1'b1;
    assign RegAddr = (calc_r | mf | jalr) ? rd :
                     (calc_i | sltu | load | lui) ? rt : 
                     (jal) ? 5'b11111 :
                     5'b0;
    assign MDUControl = mult ? 4'd1:
	                    multu ? 4'd2:
                        div ? 4'd3:
                        divu ? 4'd4:
                        mfhi ? 4'd5:
                        mflo ? 4'd6:
                        mthi ? 4'd7:
              			mtlo ? 4'd8:
  						4'd0;
    assign SControl = (sw) ? SW : 
                      (sh) ? SH :
                      (sb) ? SB : 
                      4'd0;
    assign LControl = (lw | lwmx) ? LW : 
                      (lh) ? LH :
                      (lb) ? LB : 
                      4'd0;
    assign calc_r = add | sub | isAnd | isOr | isXor | sll | slt | sltu;
	assign calc_i = andi | ori | xori | addi;
	assign load = lb | lh | lw | lwmx;
	assign store = sb | sh | sw;
    assign set = slt | sltu;
    assign md = mult | multu | div | divu;
    assign mf = mfhi | mflo;
    assign mt = mthi | mtlo;

endmodule