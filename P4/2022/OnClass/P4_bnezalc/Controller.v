`timescale 1ns / 1ps

module Controller(
    input [5:0] opcode,
    input [5:0] funct,
    input [4:0] rt,
    input Zero,
    output [2:0] ALUControl,
    output MemRead,
    output MemWrite,
    output RegWrite,
    output [2:0] Mem2Reg,
    output [2:0] EXTControl,
    output ALUSrc,
    output [1:0] RegDst,
    output [2:0] NPCControl,
    output Beq,
    output Bgtz,
    output Bnezalc
);

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
    assign sb = (opcode == 6'b101001);
    assign bgtz = (opcode == 6'b000111);
    assign addi = (opcode == 6'b001000);
    assign bnezalc = (opcode == 6'b000001) & (rt == 5'b10011);

    assign ALUControl = (sub) ? 3'b001 :
                        (isXor) ? 3'b010 :
                        (ori) ? 3'b011 :
                        (sll) ? 3'b100 :
                        3'b000;
    assign MemRead = lw | lb;
    assign MemWrite = sw | sb;
    assign RegWrite = add | sub | ori | lw | lui | jal | jalr | sll | lb | addi | isXor | Bnezalc;
    assign Mem2Reg = (lw) ? 3'b001 :
                     (lui) ? 3'b010 :
                     (jal | jalr | Bnezalc) ? 3'b011 :
                     (lb) ? 3'b100 :
                     3'b000;
    assign EXTControl = (lw | sw | beq | lb | sb | addi | bgtz | Bnezalc) ? 3'b001 :
                        (lui) ? 3'b010 :
                        3'b000;
    assign ALUSrc = (ori | lw | sw | lui | lb | sb | addi);
    assign RegDst = (add | sub | jalr | sll | isXor) ? 2'b01 :
                    (jal | Bnezalc) ? 2'b10 : // here
                    2'b00;
    assign NPCControl = (beq | bgtz | Bnezalc) ? 3'b001 :
                        (j | jal) ? 3'b010 :
                        (jr | jalr) ? 3'b100 :
                        3'b000;
    assign Beq = beq;
    assign Bgtz = bgtz;
    assign Bnezalc = bnezalc;

endmodule