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
    
    output calc_r,
	output calc_i,
    output beq,
    output bgtz,
    output jal, 
    output jr,
    output lwie,
	output load,
    output type,
	output store,
	output lui
);
    
    wire [5:0] opcode, funct;
    assign opcode = Instr[31:26];
    assign rs = Instr[25:21];
    assign rt = Instr[20:16];
    assign rd = Instr[15:11];
    assign shamt = Instr[10:6];
    assign funct = Instr[5:0];
    assign Imm16 = Instr[15:0];
    assign Imm26 = Instr[25:0];

    assign R = (opcode == 6'b000000) ? 1'b1 : 1'b0;
    assign add = R & (funct == 6'b100000) ? 1'b1 : 1'b0;
    assign sub = R & (funct == 6'b100010) ? 1'b1 : 1'b0;
    assign isXor = R & (funct == 6'b100110) ? 1'b1 : 1'b0;
    assign jr = R & (funct == 6'b001000) ? 1'b1 : 1'b0;
    assign jalr = R & (funct == 6'b001001) ? 1'b1 : 1'b0;
    assign sll = R & (funct == 6'b000000) ? 1'b1 : 1'b0;
    assign ori = (opcode == 6'b001101);
    assign lw = (opcode == 6'b100011);
    assign sw = (opcode == 6'b101011);
    assign beq = (opcode == 6'b000100);
    assign lui = (opcode == 6'b001111);
    assign jal = (opcode == 6'b000011);
    assign j = (opcode == 6'b000010);
    assign lb = (opcode == 6'b100000);
    assign bgtz = (opcode == 6'b000111);
    assign addi = (opcode == 6'b001000);
    assign lwie = (opcode == 6'b111001);

    assign ALUControl = (sub) ? 3'b001 :
                        (isXor) ? 3'b010 :
                        (ori) ? 3'b011 :
                        (sll) ? 3'b100 :
                        3'b000;
    assign MemWrite = sw;
    assign RegWrite = add | sub | ori | lw | lwie | lui | jal | jalr | sll | lb | addi | isXor;
    assign Mem2Reg = (lw | lwie | lb) ? 3'b001 :
                     (lui) ? 3'b010 :
                     (jal | jalr) ? 3'b011 :
                     // (lb) ? 3'b100 :
                     3'b000;
    assign EXTControl = (lw | lwie | sw | lb | addi) ? 3'b001 :
                        (lui) ? 3'b010 :
                        3'b000;
    assign ALUSrc = (ori | lw | lwie | sw | lui | lb | addi);
    assign RegAddr = (add | sub | jalr | sll | isXor) ? rd :
                    (ori | lw | lwie | lui | addi) ? rt : 
                    (jal) ? 5'b11111 :
                    5'b0;
    
    assign calc_r = add | sub | sll;
	assign calc_i = ori | addi;
    assign type = lb;
	assign load = lw | lb | lwie;
	assign store = sw;

endmodule