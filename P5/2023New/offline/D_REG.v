`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:23:11 12/02/2022 
// Design Name: 
// Module Name:    D_REG 
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
module D_REG(
    input clk,
    input reset,
    input en,
    input [31:0] F_PC,
    input [31:0] F_Instr,
    output reg [31:0] D_PC,
    output reg [31:0] D_Instr
    );
    
    initial begin
        D_PC = 32'h00003000;
		D_Instr = 32'h00000000;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            D_PC <= 32'h00003000;
            D_Instr <= 32'h00000000;
        end
        else if (en) begin
            D_PC <= F_PC;
            D_Instr <= F_Instr;
        end
    end

endmodule
