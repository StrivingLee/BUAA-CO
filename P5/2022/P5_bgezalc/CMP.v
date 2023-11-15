`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:40 12/02/2022 
// Design Name: 
// Module Name:    CMP 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CMP(
    input [31:0] SrcA,
    input [31:0] SrcB,
    output Zero,
    output GreaterZero,
    output LessZero,
    output reg isP
);
    
    integer i, flag = 1;
    assign Zero = (SrcA == SrcB) ? 1'b1 : 1'b0;
    assign GreaterZero = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LessZero = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;
    
    always @(*) begin
        for (i = 0; i < 16; i = i + 1) begin
            if (SrcA[i] ^ SrcA[31 - i]) begin
                flag = 0;
            end
            if (flag) isP = 1'b1;
            else isP = 1'b0;
        end
        flag = 1;
    end

endmodule
