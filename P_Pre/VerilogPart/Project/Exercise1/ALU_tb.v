`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:57 10/08/2022
// Design Name:   ALU
// Module Name:   D:/Xilinx/Project/Exercise1/ALU_tb.v
// Project Name:  Exercise1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [3:0] inA;
	reg [3:0] inB;
	reg [1:0] op;

	// Outputs
	wire [3:0] ans;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.inA(inA), 
		.inB(inB), 
		.op(op), 
		.ans(ans)
	);

	initial begin
		// Initialize Inputs
		inA = 0;
		inB = 0;
		op = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

