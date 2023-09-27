`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output Zero,
    output GreatZero,
    output LessZero,
    output reg[31:0] ALUResult
);

    assign Zero = (SrcA == SrcB);
    assign GreatZero = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LessZero = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;

    always @(*) begin
        case (ALUControl)
        3'b000:
            ALUResult = SrcA + SrcB;
        3'b001:
            ALUResult = SrcA - SrcB;
        3'b010:
            ALUResult = SrcA & SrcB;
        3'b011:
            ALUResult = SrcA | SrcB;
        3'b100:
            ALUResult = SrcB << shamt;
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule