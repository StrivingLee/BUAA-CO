`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output reg[31:0] ALUResult
);
    reg [31:0] temp;
    always @(*) begin
        case (ALUControl)
        3'b000:
            ALUResult = SrcA + SrcB;
        3'b001:
            ALUResult = SrcA - SrcB;
        3'b010:
            ALUResult = SrcA ^ SrcB;
        3'b011:
            ALUResult = SrcA | SrcB;
        3'b100:
            ALUResult = SrcB << shamt;
        3'b101: begin
            temp = -(SrcA + SrcB);
            if ($signed(temp) >= 0) ALUResult = temp;
            else begin temp = ~(temp - 1);
                ALUResult = {1'b1, temp[30:0]};
                end
        end
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule