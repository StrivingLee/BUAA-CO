`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:33 11/28/2021 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
	input WE,
    input clk,
    input reset,
	input [31:0] PC,
    output reg [31:0] O1,
    output reg [31:0] O2
    );
	reg [31:0] register [31:0];
	integer i;
	initial begin
		for (i=0; i<32; i=i+1) begin
			register[i] = 32'h00000000;
		end
		O1 = 32'h00000000;
		O2 = 32'h00000000;
	end
	always@(*) begin
		if (A1 == A3 && A1 != 0 && WE) begin
			O1 = WD;
		end
		else begin
			O1 = register[A1];
		end
		if (A2 == A3 && A2 != 0 && WE) begin
			O2 = WD;
		end
		else begin
			O2 = register[A2];
		end
	end
	always@(posedge clk) begin
		if (reset == 1'b1) begin
			for (i=0; i<32; i=i+1) begin
				register[i] <= 32'h00000000;
			end
		end
		else begin
			if (A3 != 5'h00000 && WE == 1'b1)begin
				register[A3] <= WD;
				$display("%d@%h: $%d <= %h", $time, PC, A3, WD);
			end
			else begin
			end
		end
	end

endmodule
