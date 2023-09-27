`timescale 1ns / 1ps

module Controller(
    input [5:0] opcode,
    input [5:0] funct,
    output [2:0] ALUControl,
    output MemRead,
    output MemWrite,
    output RegWrite,
    output [2:0] Mem2Reg,
    output [1:0] EXTControl,
    output ALUSrc,
    output [2:0] RegDst,
    output [2:0] NPCControl
);

    assign R = (opcode == 6'b000000) ? 1'b1 : 1'b0;
    assign add = R & (funct == 6'b100000) ? 1'b1 : 1'b0;
    assign sub = R & (funct == 6'b100010) ? 1'b1 : 1'b0;
    assign jr = R & (funct == 6'b001000) ? 1'b1 : 1'b0;
    assign jalr = R & (funct == 6'b001001) ? 1'b1 : 1'b0;
    assign sll = R & (funct == 6'b000000) ? 1'b1 : 1'b0;
    assign ori = (funct == 6'b001101);
    assign lw = (funct == 6'b100011);
    assign sw = (funct == 6'b101011);
    assign beq = (funct == 6'b000100);
    assign lui = (funct == 6'b001111);
    assign jal = (funct == 6'b000011);
    assign j = (funct == 6'b000010);
    assign lb = (funct == 6'b100000);
    assign bgtz = (funct == 6'b000111);
    assign addi = (funct == 6'b001100);

    assign ALUControl = (sub) ? 2'b01:
                        (ori) ? 2'b11:
                        2'b00;
    assign MemRead = lw | lb;
    assign MemWrite = sw;
    assign RegWrite = add | sub | ori | lw | lui | jal | jalr | sll | lb | addi;
    assign Mem2Reg = (lw) ? 3'b001 :
                     (lui) ? 3'b010 :
                     (jal | jalr) ? 3'b011 :
                     (lb) ? 3'b100 :
                     3'b000;
    assign EXTControl = (lw | sw | beq | lb | addi | bgtz) ? 3'b001 :
                        (lui) ? 3'b010 :
                        3'b000;
    assign ALUSrc = (ori | lw | sw | lui | lb | addi);
    assign RegDst = (add | sub | jalr | sll) ? 3'b001 :
                    (jal) ? 3'b010 :
                    3'b000;
    assign NPCControl = (beq | bgtz) ? 3'b001 :
                        (j | jal) ? 3'b010:
                        (jr | jalr) ? 3'b100:
                        3'b000;

endmodule