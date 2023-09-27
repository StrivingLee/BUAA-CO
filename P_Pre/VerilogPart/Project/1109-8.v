`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:21 10/26/2022 
// Design Name: 
// Module Name:    code 
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
module code(
    input Clk,
    input Reset,
    input Slt,
    input En,
    output [63:0] Output0,
    output [63:0] Output1
    );
    
    reg [63:0] reg0, reg1;
    reg [1:0] count;
    assign Output0 = reg0;
    assign Output1 = reg1;
    
    initial begin
        count = 0;
        reg0 = 0;
        reg1 = 0;
    end
    
    always @(posedge Clk) begin
        if(Reset) begin
            reg0 <= 0;
            reg1 <= 0;
        end
        else if(En) begin
            if(!Slt) reg0 <= reg0 + 1;
            else begin
                if(count == 2'b11) begin
                    count <= 2'b00;
                    reg1 <= reg1 + 1;
                end
                else count <= count + 1;
            end
        end
    end


endmodule
