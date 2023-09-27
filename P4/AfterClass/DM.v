`timescale 1ns / 1ps
    module DM(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] PC,
    input [31:0] MemAddr,
    input [31:0] MemData,
    input Lboez,
    output [31:0] MemReadData,
    output [31:0] ReadByteData
);
    reg [31:0] RAM [0:3071];
    wire [1:0] Offset;
    wire [7:0] Temp;
    integer i;
    integer j;
    integer cnt0 = 0;
    integer cnt1 = 1;

	initial begin
		for(i = 0; i < 3072; i = i + 1) begin  //1024
			RAM[i] <= 32'b0;
		end
	end

    assign Offset = MemAddr[1:0];
    assign MemReadData = MemRead ? RAM[MemAddr[11:2]] : 32'b0;
    assign Temp = MemReadData[8 * Offset + 7 -: 8];
    
    // assign sign = ^Temp;
    always @(*) begin
        cnt0 = 0;
        cnt1 = 0;
        for (j = 0; j < 8; j = j + 1) begin
            if (Temp[j]) cnt1 = cnt1 + 1;
            else cnt0 = cnt0 + 1;
        end
    end
    
    assign sign = (cnt0 == cnt1) ? 1'b1 : 1'b0;
    
    assign ReadByteData = sign ? {{24{Temp[7]}}, Temp} : 0; // sign_extend

    always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 3072; i = i + 1) begin
				RAM[i] <= 32'b0; // clear all the memory
			end
		end
		else if (MemWrite) begin
            if(Lboez) begin
            RAM[MemAddr[11:2]] <= MemReadData;
            $display("@%h: *%h <= %h", PC, MemAddr, MemReadData);
            end
            else begin
            RAM[MemAddr[11:2]] <= MemData;
            $display("@%h: *%h <= %h", PC, MemAddr, MemData);
            end
		end
	end

endmodule