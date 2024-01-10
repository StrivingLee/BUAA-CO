`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:49 10/08/2022 
// Design Name: 
// Module Name:    a1 
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
//
//////////////////////////////////////////////////////////////////////////////////
module a1(
	input clk,
	input reset,
	input [3:0] a,
	input [3:0] b,
	output ans1,
   output ans2
   );
   assign ans1 = a > b;
   assign ans2 = $signed(a) > $signed(b);
    

endmodule
