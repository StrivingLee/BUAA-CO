// Verilog Test Fixture Template
`timescale 1 ns / 1 ps

module textbench;

	// Inputs
    reg [1:0] in;
	reg clk;
	reg clr;

	// Outputs
	wire [2:0] out;

	// Instantiate the Unit Under Test (UUT)
	awful_fsm uut (
		.in(in), 
        .clk(clk), 
		.out(out), 
		.clr(clr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		in = 0;
		clr = 1;

		// Wait 100 ns for global reset to finish
		#100;
		clr = 0;
		in = 'd0;
		#10;
		in = 'd1;
		#20;
		in = 'd2;
		#50;
		in = 'd0;
		#10;
		in = 'd3;
		
        
		// Add stimulus here

	end
	
	always #5 clk = ~clk;
      
endmodule