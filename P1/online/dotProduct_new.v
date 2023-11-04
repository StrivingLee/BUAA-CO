`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:54 10/16/2023 
// Design Name: 
// Module Name:    dotProduct 
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
module dotProduct(
    input [31:0] vector_a,
    input [31:0] vector_b,
    output [5:0] result
    );
	
    reg[5:0] sum;
    assign result = sum;

    integer i;
    
    always @(*) begin
        sum = 6'b0;
        for (i = 0; i < 32; i = i + 1)
            sum = sum + (vector_a[i] & vector_b[i]);
    end

endmodule
