`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output Zero,
    output GreaterZero,
    output LessZero,
    output reg isOez,
    output reg[31:0] ALUResult
);

    assign Zero = (SrcA == SrcB);
    assign GreaterZero = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LessZero = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;
    
    integer a = 0;
    integer b = 0;
    integer i = 0;
    always @(*) begin
        a = 0;
        b = 0;
        for (i = 0; i < 32; i = i + 1) begin
            if (SrcA[i] == 1'b1) a = a + 1;
        end
        for (i = 0; i < 32; i = i + 1) begin
            if (SrcB[i] == 1'b0) b = b + 1;
        end
        if (a == b) isOez = 1'b1;
        else isOez = 1'b0;
    end

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
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule