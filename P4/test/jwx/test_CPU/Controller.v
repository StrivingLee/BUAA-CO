`timescale 1ns / 1ps

module Controller(
    input [5:0] opcode,
    input [5:0] funct,
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
    output [1:0] DMControl
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
    assign lb = (opcode == 6'b100000);
    assign lh = (opcode == 6'b100001);
    assign sw = (opcode == 6'b101011);
    assign sb = (opcode == 6'b101000);
    assign sh = (opcode == 6'b101001);
    assign beq = (opcode == 6'b000100);
    assign lui = (opcode == 6'b001111);
    assign jal = (opcode == 6'b000011);
    assign j = (opcode == 6'b000010);
    assign bgtz = (opcode == 6'b000111);
    assign addi = (opcode == 6'b001000);

    assign load = lb | lh | lw;
    assign store = sb | sh | sw;

    assign ALUControl = (sub) ? 3'b001 :
                        (isXor) ? 3'b010 :
                        (ori) ? 3'b011 :
                        (sll) ? 3'b100 :
                        3'b000;
    assign MemRead = load;
    assign MemWrite = store;
    assign RegWrite = add | sub | ori | load | lui | jal | jalr | sll | addi | isXor;
    assign Mem2Reg = (load) ? 3'b001 :
                     (lui) ? 3'b010 :
                     (jal | jalr) ? 3'b011 :
                     3'b000;
    assign EXTControl = (load | store | beq | addi | bgtz) ? 3'b001 :
                        (lui) ? 3'b010 :
                        3'b000;
    assign ALUSrc = (ori | load | store | lui | addi);
    assign RegDst = (add | sub | jalr | sll | isXor) ? 2'b01 : // rd
                    (jal) ? 2'b10 : // $ra
                    2'b00;
    assign NPCControl = (beq | bgtz) ? 3'b001 :
                        (j | jal) ? 3'b010:
                        (jr | jalr) ? 3'b100:
                        3'b000;
    assign Beq = beq;
    assign Bgtz = bgtz;
    assign DMControl = (sb | lb) ? 2'b10 : // load or store byte
                       (sh | lh) ? 2'b01 : // load or store half
                       2'b00; // load or store word

endmodule