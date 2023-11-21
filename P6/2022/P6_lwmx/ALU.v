`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output reg[31:0] ALUResult
);
    parameter ADD = 3'b000, SUB = 3'b001, AND = 3'b010, OR = 3'b011, XOR = 3'b100, SLL = 3'b101, SLT = 3'b110, SLTU = 3'b111;
    always @(*) begin
        case (ALUControl)
        ADD:
            ALUResult = SrcA + SrcB;
        SUB:
            ALUResult = SrcA - SrcB;
        AND:
            ALUResult = SrcA & SrcB;
        OR:
            ALUResult = SrcA | SrcB;
        XOR:
            ALUResult = SrcA ^ SrcB;
        SLL:
            ALUResult = SrcB << shamt;
        SLT: begin
            if ($signed(SrcA) < $signed(SrcB)) ALUResult = 32'b1;
            else ALUResult = 32'b0;
        end
        SLTU: begin
            if ((SrcA) < (SrcB)) ALUResult = 32'b1;
            else ALUResult = 32'b0;
        end
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule