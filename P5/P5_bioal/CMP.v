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
    output isP
);
    
    // integer i, flag = 1;
    wire [32:0] temp;
    assign temp = {SrcA[31], SrcA} + {SrcB[31], SrcB};
    assign isP = (temp[31] ^ temp[32]);
    
    assign Zero = (SrcA == SrcB) ? 1'b1 : 1'b0;
    assign GreaterZero = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LessZero = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;
    

endmodule
