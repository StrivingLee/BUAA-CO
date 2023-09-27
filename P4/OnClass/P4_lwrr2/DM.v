`timescale 1ns / 1ps
module DM(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] PC,
    input [31:0] MemAddr,
    input [31:0] MemData,
    input Lwrr,
    output [31:0] MemReadData,
    output reg [31:0] ReadByteData
);
    reg [31:0] RAM [0:3071];
    wire [1:0] Offset;
    wire [7:0] Temp;
    wire [31:0] ByteData;
    integer i;

	initial begin
		for(i = 0; i < 3072; i = i + 1) begin  //1024
			RAM[i] <= 32'b0;
		end
	end

    assign Offset = MemAddr[1:0];
    assign MemReadData = MemRead ? RAM[MemAddr[11:2]] : 32'b0;
    
    always @(*) begin
        case (Offset)
            2'b00 : begin
                ReadByteData = MemReadData;
            end
            2'b01 : begin
                ReadByteData = {MemReadData[7:0], MemReadData[31:8]};
            end
            2'b10 : begin
                ReadByteData = {MemReadData[15:0], MemReadData[31:16]};
            end
            2'b11 : begin
                ReadByteData = {MemReadData[23:0], MemReadData[31:24]};
            end
        endcase
    end

    always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 3072; i = i + 1) begin
				RAM[i] <= 32'b0; // clear all the memory
			end
		end
		else if (MemWrite) begin
            RAM[MemAddr[11:2]] <= MemData;
            $display("@%h: *%h <= %h", PC, MemAddr, MemData);
		end
	end

endmodule