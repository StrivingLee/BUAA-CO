`timescale 1ns / 1ps
module NPC(
    input [2:0] NPCControl,
    input Zero,
    input GreaterZero,
    input beq,
    input bgtz,
    input [31:0] PC,
    input [25:0] Imm26,
    input [31:0] EXTImm32,
    input [31:0] GRFrs,
    output reg [31:0] NPC,
    output [31:0] PC4
);

    assign PC4 = PC + 4;

    always @(*) begin
        case (NPCControl)
            3'b001: NPC = PC + 4 + (EXTImm32 << 2);
            3'b010: NPC = {{PC[31:28]}, Imm26, 2'b00};
            3'b100: NPC = GRFrs;
            default: NPC = PC + 4;
        endcase
    end

    

endmodule