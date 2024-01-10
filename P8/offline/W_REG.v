`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    18:52:39 12/02/2022 
//////////////////////////////////////////////////////////////////////////////////

module W_REG(
    input        clk,
    input        reset,
    input        Req,

    input [31:0] M_Instr,
    input [31:0] M_PC,
    input [31:0] M_ALUResult,
    input [31:0] M_EXTResult,
    input [31:0] M_MemReadData,
    input [31:0] M_CP0Result,
    input [31:0] M_HI,
    input [31:0] M_LO,
    input        M_check,
    
    output reg [31:0] W_Instr,
    output reg [31:0] W_PC,
    output reg [31:0] W_ALUResult,
    output reg [31:0] W_EXTResult,
    output reg [31:0] W_MemReadData,
    output reg [31:0] W_CP0Result,
    output reg [31:0] W_HI,
    output reg [31:0] W_LO,
    output reg        W_check
    );
    
    initial begin
        W_Instr       = 32'b0;
		W_PC          = 32'h0000_3000;
        W_ALUResult   = 32'b0;
        W_EXTResult   = 32'b0;
        W_MemReadData = 32'b0;
        W_CP0Result   = 32'b0;
        W_HI          = 32'b0;
        W_LO          = 32'b0;
        W_check       = 1'b0;
	end
	always@(posedge clk) begin
		if (reset | Req) begin
            W_Instr       <= 32'b0;
			W_PC          <= (Req) ? 32'h0000_4180 : 32'h0000_3000;
            W_ALUResult   <= 32'b0;
            W_EXTResult   <= 32'b0;
            W_MemReadData <= 32'b0;
            W_CP0Result   <= 32'b0;
            W_HI          <= 32'b0;
            W_LO          <= 32'b0;
            W_check       <= 1'b0;
		end
		else begin
            W_Instr       <= M_Instr;
			W_PC          <= M_PC;
            W_ALUResult   <= M_ALUResult;
            W_EXTResult   <= M_EXTResult;
            W_MemReadData <= M_MemReadData;
            W_CP0Result   <= M_CP0Result;
            W_HI          <= M_HI;
            W_LO          <= M_LO;
            W_check       <= M_check;
		end
	end


endmodule
