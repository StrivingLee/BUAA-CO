`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:39:58 10/08/2022
// Design Name:   a1
// Module Name:   D:/Xilinx/Project/hhhhh/a1_tb.v
// Project Name:  hhhhh
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: a1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module a1_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire ans1;
	wire ans2;

	// Instantiate the Unit Under Test (UUT)
	a1 uut (
		.clk(clk), 
		.reset(reset), 
		.a(a), 
		.b(b), 
		.ans1(ans1), 
		.ans2(ans2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 4;
		b = -1;
		#2;
		a = 4;
		b = 7;
		#2;
		a = 4;
		b = 15;
        
		// Add stimulus here

	end
      
endmodule

