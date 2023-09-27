`timescale 1ns / 1ps
module DM(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] PC,
    input [31:0] MemAddr,
    input [31:0] MemData,
    input Sb,
    output [31:0] MemReadData,
    output [31:0] ReadByteData
);
    reg [31:0] RAM [0:3071];
    wire [1:0] Offset;
    wire [7:0] Temp;
    integer i;

	initial begin
		for(i = 0; i < 3072; i = i + 1) begin  //1024
			RAM[i] <= 32'b0;
		end
	end

    assign Offset = MemAddr[1:0];
    // assign Temp = MemReadData[8 * Offset + 7 -: 8];
    always @(*) begin
        case (Offset) 
            2'b00 : WriteByteData = MemData;
            2'b01 : WriteByteData = {MemData[0], MemData[31:1]};
            2'b10 : WriteByteData = {MemData[1:0], MemData[31:2]};
            2'b11 : WriteByteData = {MemData[2:0], MemData[31:3]};
        endcase
    end

    always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 3072; i = i + 1) begin
				RAM[i] <= 32'b0; // clear all the memory
			end
		end
		else if (MemWrite) begin
            if (Sb) begin
                RAM[MemAddr[11:2]] <= WriteByteData;
                $display("@%h: *%h <= %h", PC, MemAddr, WriteByteData);
            end
            else begin
                RAM[MemAddr[11:2]] <= MemData;
                $display("@%h: *%h <= %h", PC, MemAddr, MemData);
            end
		end
	end

endmodule