`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output reg[31:0] ALUResult
);
    
    wire [32:0] temp;
    assign temp = {SrcB[31], SrcB} + {SrcA[31], SrcA};
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
            if (temp[32] ^ temp[31]) ALUResult = SrcB;
            else ALUResult = temp;
        end
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule