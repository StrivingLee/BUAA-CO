`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output Zero,
    output GreaterZero,
    output LessZero,
    output reg[31:0] ALUResult
);

    assign Zero = (SrcA == SrcB);
    assign GreaterZero = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LessZero = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;
    
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
            if (SrcA == 32'b0 || SrcA == 32'h80000000) ALUResult = 32'b0;
            else if (SrcA[31]) begin
                temp = ~SrcA;
                temp[31] = ~temp[31];
                temp = temp + 1'b1;
                ALUResult = temp;
            end
            else if (~SrcA[31]) ALUResult = SrcA;
        end
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule