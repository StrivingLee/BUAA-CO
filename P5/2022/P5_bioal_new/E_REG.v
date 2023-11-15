`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:27 12/02/2022 
// Design Name: 
// Module Name:    E_REG 
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
module E_REG(
    input clk,
    input reset,
    input clr,
    input [31:0] D_Instr,
    input [31:0] D_PC,
    input D_check, 
    input [31:0] D_WD1,
    input [31:0] D_WD2,
    input [31:0] D_EXTResult,
    output reg [31:0] E_Instr,
    output reg [31:0] E_PC,
    output reg E_check, 
    output reg [31:0] E_WD1,
    output reg [31:0] E_WD2,
    output reg [31:0] E_EXTResult
    );
    
    initial begin
        E_Instr = 32'b0;
        E_PC = 32'h00003000;
        E_check = 1'b0;
        E_WD1 = 32'b0;
        E_WD2 = 32'b0;
        E_EXTResult = 32'b0;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            E_Instr <= 32'b0;
            E_PC <= 32'h00003000;
            E_check <= 1'b0;
            E_WD1 <= 32'b0;
            E_WD2 <= 32'b0;
            E_EXTResult <= 32'b0;
        end
        else if (clr) begin
            E_Instr <= 32'b0;
            E_PC <= 32'h00003000;
            E_check <= 1'b0;
            E_WD1 <= 32'b0;
            E_WD2 <= 32'b0;
            E_EXTResult <= 32'b0;
        end
        else begin
            E_Instr <= D_Instr;
            E_PC <= D_PC;
            E_check <= D_check;
            E_WD1 <= D_WD1;
            E_WD2 <= D_WD2;
            E_EXTResult <= D_EXTResult;
        end
    end

endmodule
