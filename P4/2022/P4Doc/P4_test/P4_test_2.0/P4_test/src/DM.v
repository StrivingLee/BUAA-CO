`timescale 1ns / 1ps
module DM(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] PC,
    input [31:0] MemAddr,
    input [31:0] MemData,
    output [31:0] MemReadData,
    output [31:0] ReadByteData
);
    reg [31:0] RAM [0:1023];
    wire [1:0] Offset;
    wire [7:0] Temp;
    integer i;

	initial begin
		for(i = 0; i < 1024; i = i + 1) begin  //1024
			RAM[i] <= 32'b0;
		end
	end

    assign Offset = MemAddr[1:0];
    assign MemReadData = MemRead ? RAM[MemAddr[11:2]] : 32'b0;
    assign Temp = MemReadData[8 * Offset + 7 -: 8];
    assign ReadByteData = {{24{Temp[7]}}, Temp}; // sign_extend

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