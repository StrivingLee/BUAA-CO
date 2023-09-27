`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output reg[31:0] ALUResult
);
    
    reg [31:0] temp;
    wire [4:0] s;
    assign s = SrcB[4:0];
    
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
            // if (s == 5'b0) ALUResult = SrcA;
            if (SrcB[0]) begin// left
                temp = SrcA << s;
                temp = temp | (SrcA >> (32 - s));
                ALUResult = temp;
            end
            else if (!SrcB[0]) begin// right
                temp = SrcA >> s;
                temp = temp | (SrcA << (32 - s));
                ALUResult = temp;
            end
            // temp = 32'h114514;
        end
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule