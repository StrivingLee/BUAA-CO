`timescale 1ns / 1ps
module DM(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [1:0] DMControl,
    input [31:0] PC,
    input [31:0] MemAddr,
    input [31:0] MemData,
    output [31:0] MemReadData
);
    reg [31:0] RAM [0:3071];

    integer i;
	initial begin
		for(i = 0; i < 3072; i = i + 1) begin
			RAM[i] <= 32'b0;
		end
	end
    
    /* Offset */
    wire [1:0] ByteOffset;
    wire HalfOffset;
    assign ByteOffset = MemAddr[1:0];
    assign HalfOffset = MemAddr[1];

    /* ReadData */
    wire [31:0] MemReadTemp;
    wire [7:0] ByteReadTemp;
    wire [15:0] HalfReadTemp;
    assign MemReadTemp = RAM[MemAddr[13:2]];
    assign ByteReadTemp = MemReadTemp[8 * ByteOffset + 7 -: 8];
    assign HalfReadTemp = MemReadTemp[16 * HalfOffset + 15 -: 16];
    assign MemReadData = (DMControl == 2'b10) ? {{24{ByteReadTemp[7]}}, ByteReadTemp} :
                         (DMControl == 2'b01) ? {{16{HalfReadTemp[15]}}, HalfReadTemp} :
                         MemReadTemp;
    
    /* WriteData */
    wire [31:0] MemWriteData;
    reg [31:0] MemWriteReg;
    assign MemWriteData = MemWriteReg;
    always @(*) begin
        MemWriteReg = MemReadTemp;
        if (DMControl == 2'b10) begin
            MemWriteReg[8 * ByteOffset + 7 -: 8] = MemData[7:0];
        end
        else if (DMControl == 2'b01) begin
            MemWriteReg[16 * ByteOffset + 15 -: 16] = MemData[15:0];
        end
        else MemWriteReg = MemReadTemp;
    end

    always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 3072; i = i + 1) begin
				RAM[i] <= 32'b0; // clear all the memory
			end
		end
		else if (MemWrite) begin
            RAM[MemAddr[13:2]] <= MemWriteData;
            $display("@%h: *%h <= %h", PC, {MemAddr[31:2], 2'b00}, MemWriteData);
		end
	end

endmodule