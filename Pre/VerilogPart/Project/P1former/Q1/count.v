`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:23 10/17/2022 
// Design Name: 
// Module Name:    count 
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
module count(
    input [31:0] expr,
    output [31:0] out
    );
    // reg [1:0] tmp;
    integer count;
    integer i;
    
    // assign out = tmp;
    
    always@(*) begin
        count = 32;
        for(i = 0; i < 32; i = i + 1) begin
            if(expr[i] & 1) count = count + 1;
            else count = count - 1;
        end
        if(count > 32) out = 'd0;
        else if(count < 32) out = 'd1;
        else out = 'd2;
    end


endmodule
