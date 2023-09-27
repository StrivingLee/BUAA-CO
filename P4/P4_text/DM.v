`timescale 1ns / 1ps
module DM(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [1:0] ReadOffset,
    input [31:0] PC,
    input [31:0] MemAddr,
    input [31:0] MemData,
    output [31:0] MemReadData,
    output [31:0] ReadByteData
);
    reg [31:0] RAM [0:1023];
    integer i;

	initial begin
		for(i = 0; i < 1024; i = i + 1) begin  //1024
			RAM[i] <= 32'b0;
		end
	end

    assign MemReadData = RAM[MemAddr[11:2]];
    assign ReadByteData = {24'b0, MemReadData[8 * ReadOffset + 7 -: 8]};

    always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 1024; i = i + 1) begin
				RAM[i] <= 32'b0; // clear all the memory
			end
		end
		else if (MemWrite) begin
            RAM[MemAddr[11:2]] <= MemData;
            $display("@%h: *%h <= %h", PC, MemAddr, MemData);
		end
	end

endmodule