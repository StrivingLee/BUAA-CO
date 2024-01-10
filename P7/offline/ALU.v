`timescale 1ns / 1ps
`include "Const.v"

module ALU(
    input ALU_CAL_Ov,
    input ALU_DM_Ov,

    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,

    output reg[31:0] ALUResult,
    output EXC_CAL_Ov,
    output EXC_DM_Ov
);
    wire [32:0] sign_ext_SrcA = {SrcA[31], SrcA};
    wire [32:0] sign_ext_SrcB = {SrcB[31], SrcB};
    wire [32:0] sign_ext_add = sign_ext_SrcA + sign_ext_SrcB;
    wire [32:0] sign_ext_sub = sign_ext_SrcA - sign_ext_SrcB;

    assign EXC_CAL_Ov = (ALU_CAL_Ov) & 
                        ( ((ALUControl == `ADD) & (sign_ext_add[32] != sign_ext_add[31])) |
                          ((ALUControl == `SUB) & (sign_ext_sub[32] != sign_ext_sub[31])) );
    assign EXC_DM_Ov = (ALU_DM_Ov) & 
                       ( ((ALUControl == `ADD) & (sign_ext_add[32] != sign_ext_add[31])) |
                         ((ALUControl == `SUB) & (sign_ext_sub[32] != sign_ext_sub[31])) );


    always @(*) begin
        case (ALUControl)
        `ADD:
            ALUResult = SrcA + SrcB;
        `SUB:
            ALUResult = SrcA - SrcB;
        `AND:
            ALUResult = SrcA & SrcB;
        `OR:
            ALUResult = SrcA | SrcB;
        `XOR:
            ALUResult = SrcA ^ SrcB;
        `SLL:
            ALUResult = SrcB << shamt;
        `SLT: begin
            if ($signed(SrcA) < $signed(SrcB)) ALUResult = 32'b1;
            else ALUResult = 32'b0;
        end
        `SLTU: begin
            if ((SrcA) < (SrcB)) ALUResult = 32'b1;
            else ALUResult = 32'b0;
        end
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule