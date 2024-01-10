`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:47:37 10/08/2022
// Design Name:   a2
// Module Name:   D:/Xilinx/Project/hhhhh/a2_tb.v
// Project Name:  hhhhh
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: a2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module a2_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [3:0] ans1;
	wire [3:0] ans2;
	wire [3:0] ans3;

	// Instantiate the Unit Under Test (UUT)
	a2 uut (
		.clk(clk), 
		.reset(reset), 
		.a(a), 
		.b(b), 
		.ans1(ans1), 
		.ans2(ans2), 
		.ans3(ans3)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 3;
		b = 1;
		#2;
		a = -2;
		b = 1;

	end
      
endmodule

