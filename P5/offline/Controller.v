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
    output bgezal,
    output jal, 
    output jr,
	output load,
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
    assign lb = (opcode == 6'b100000);
    assign lh = (opcode == 6'b100001);
    assign sw = (opcode == 6'b101011);
    assign sb = (opcode == 6'b101000);
    assign sh = (opcode == 6'b101001);
    assign beq = (opcode == 6'b000100);
    assign lui = (opcode == 6'b001111);
    assign jal = (opcode == 6'b000011);
    assign j = (opcode == 6'b000010);

    /* Extended Instructions */
    // Branch
    assign bgtz = (opcode == 6'b000111);
    assign bgezal = (opcode == 6'b000001);
    // Immediate
    assign addi = (opcode == 6'b001000);

    assign load = lb | lh | lw;
    assign store = sb | sh | sw;
    assign branch = beq | bgtz | bgezal;
    assign link = jal | jalr | bgezal;

    assign ALUControl = (sub) ? 3'b001 :
                        (isXor) ? 3'b010 :
                        (ori) ? 3'b011 :
                        (sll) ? 3'b100 :
                        3'b000;
    assign MemWrite = store;
    assign RegWrite = calc_r | calc_i | load | lui | link;
    assign Mem2Reg = (load) ? 3'b001 :
                     (lui) ? 3'b010 :
                     (link) ? 3'b011 : // PC+4
                     3'b000;
    assign EXTControl = (load | store | branch | addi) ? 3'b001 : // signed-extend
                        (lui) ? 3'b010 : // upper-extend
                        3'b000; // zero-extend
    assign ALUSrc = (calc_i | load | store | lui);
    assign RegAddr = (calc_r | jalr) ? rd :
                     (calc_i | load | lui) ? rt : 
                     (jal) ? 5'b11111 :
                     5'b0;
    assign DMControl = (sh | lh) ? 2'b01 : // load or store half
                       (sb | lb) ? 2'b10 : // load or store byte
                       2'b00; // load or store word

    assign calc_r = add | sub | isXor | sll;
	assign calc_i = ori | addi;

endmodule