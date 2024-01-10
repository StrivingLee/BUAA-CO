`timescale 1ns / 1ps

module NPC(
    // input [2:0] NPCControl,
    input        Req,
    input        eret,
    input [31:0] EPC,

    input        Zero,
    input        GZ,
    input        LZ,
    input        check,
    input        beq,
    input        bne,
    input        bgtz,
    input        newbal,
    input        jal, 
    input        jr,
    
    input [31:0] F_PC,
    input [31:0] D_PC,
    input [25:0] Imm26,
    input [31:0] GRFrs,
    
    output [31:0] NPC
);

    assign NPC = (Req) ? 32'h0000_4180 :
                 (eret) ? EPC + 4 :
                 (beq == 1'b1 && Zero == 1'b1) ? D_PC + 4 + {{14{Imm26[15]}}, Imm26[15:0], 2'b00} : 
                 (bne == 1'b1 && Zero == 1'b0) ? D_PC + 4 + {{14{Imm26[15]}}, Imm26[15:0], 2'b00} : 
                 (bgtz == 1'b1 && GZ == 1'b1) ? D_PC + 4 + {{14{Imm26[15]}}, Imm26[15:0], 2'b00} : 
                 // todo
                 (newbal == 1'b1 && check == 1'b1) ? GRFrs : 
                 (jal == 1'b1) ? {D_PC[31:28], Imm26, 2'b00}:
                 (jr == 1'b1) ? GRFrs : 
                 F_PC + 4;

endmodule
