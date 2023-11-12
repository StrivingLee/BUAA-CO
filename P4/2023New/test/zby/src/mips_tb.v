`timescale 1ns / 1ps
`include "mips.v"
module mips_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);
	initial begin
		$dumpfile("mips_tb.vcd");
		$dumpvars;
		clk = 0;
		reset = 1;
		#20;
		reset = 0;
        		#4096;
		$finish;
	end
      	always #1 clk = ~clk;
endmodule