`timescale 1ns / 1ps
module NPC(
    // input [2:0] NPCControl,
    input Zero,
    input GreaterZero,
    input isP, 
    input beq,
    input bgtz,
    input jal, 
    input jr,
    input bpnal, 
    input [31:0] F_PC,
    input [31:0] D_PC,
    input [25:0] Imm26,
    input [31:0] GRFrs,
    
    output [31:0] NPC
);

    assign NPC = (beq == 1'b1 && Zero == 1'b1) ? D_PC + 4 + {{14{Imm26[15]}}, Imm26[15:0], 2'b00} : 
                 (bgtz == 1'b1 && GreaterZero == 1'b1) ? D_PC + 4 + {{14{Imm26[15]}}, Imm26[15:0], 2'b00} : 
                 (bpnal == 1'b1 && isP == 1'b1) ? D_PC + 4 + {{14{Imm26[15]}}, Imm26[15:0], 2'b00} : 
                 (jal == 1'b1) ? {D_PC[31:28], Imm26, 2'b00}:
                 (jr == 1'b1) ? GRFrs : 
                 F_PC + 4;

endmodule
