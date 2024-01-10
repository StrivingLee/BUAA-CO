`timescale 1ns / 1ps
`include "Const.v"
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output reg[31:0] ALUResult
);
    
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