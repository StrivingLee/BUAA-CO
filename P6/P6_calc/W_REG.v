`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:39 12/02/2022 
// Design Name: 
// Module Name:    W_REG 
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
module W_REG(
    input clk,
    input reset,
    input [31:0] M_Instr,
    input [31:0] M_PC,
    input [31:0] M_ALUResult,
    input [31:0] M_EXTResult,
    input [31:0] M_MemReadData,
    input [31:0] M_HI,
    input [31:0] M_LO,
    
    output reg [31:0] W_Instr,
    output reg [31:0] W_PC,
    output reg [31:0] W_ALUResult,
    output reg [31:0] W_EXTResult,
    output reg [31:0] W_MemReadData,
    output reg [31:0] W_HI,
    output reg [31:0] W_LO
    );
    
    initial begin
        W_Instr = 32'b0;
		W_PC = 32'h00003000;
        W_ALUResult = 32'b0;
        W_EXTResult = 32'b0;
        W_MemReadData = 32'b0;
        W_HI = 32'b0;
        W_LO = 32'b0;
	end
	always@(posedge clk) begin
		if (reset) begin
            W_Instr <= 32'b0;
			W_PC <= 32'h00003000;
            W_ALUResult <= 32'b0;
            W_EXTResult <= 32'b0;
            W_MemReadData <= 32'b0;
            W_HI <= 32'b0;
            W_LO <= 32'b0;
		end
		else begin
            W_Instr <= M_Instr;
			W_PC <= M_PC;
            W_ALUResult <= M_ALUResult;
            W_EXTResult <= M_EXTResult;
            W_MemReadData <= M_MemReadData;
            W_HI <= M_HI;
            W_LO <= M_LO;
		end
	end


endmodule
