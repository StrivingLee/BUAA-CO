`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:05 12/02/2022 
// Design Name: 
// Module Name:    M_REG 
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
module M_REG(
    input clk,
    input reset,
    input [31:0] E_Instr,
    input [31:0] E_PC,
    input [31:0] E_WD2,
    input [31:0] E_ALUResult,
    input [31:0] E_EXTResult,
    input E_check,
    
    output reg [31:0] M_Instr,
    output reg [31:0] M_PC,
    output reg [31:0] M_WD2,
    output reg [31:0] M_ALUResult,
    output reg [31:0] M_EXTResult,
    output reg M_check
    );
    
    always @(posedge clk) begin
        if (reset) begin
            M_Instr <= 32'b0;
            M_PC <= 32'h00003000;
            M_WD2 <= 32'b0;
            M_ALUResult <= 32'b0;
            M_EXTResult <= 32'b0;
            M_check <= 1'b0;
        end
        else begin
            M_Instr <= E_Instr;
            M_PC <= E_PC;
            M_WD2 <= E_WD2;
            M_ALUResult <= E_ALUResult;
            M_EXTResult <= E_EXTResult;
            M_check <= E_check;
        end
    end
    


endmodule
