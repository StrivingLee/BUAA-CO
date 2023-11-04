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
	 
	assign result = (vector_a[0]&vector_b[0])+(vector_a[1]&vector_b[1])+(vector_a[2]&vector_b[2])+(vector_a[3]&vector_b[3])+(vector_a[4]&vector_b[4])+(vector_a[5]&vector_b[5])+(vector_a[6]&vector_b[6])+(vector_a[7]&vector_b[7])+(vector_a[8]&vector_b[8])+(vector_a[9]&vector_b[9])+(vector_a[10]&vector_b[10])+(vector_a[11]&vector_b[11])+(vector_a[12]&vector_b[12])+(vector_a[13]&vector_b[13])+(vector_a[14]&vector_b[14])+(vector_a[15]&vector_b[15])+(vector_a[16]&vector_b[16])+(vector_a[17]&vector_b[17])+(vector_a[18]&vector_b[18])+(vector_a[19]&vector_b[19])+(vector_a[20]&vector_b[20])+(vector_a[21]&vector_b[21])+(vector_a[22]&vector_b[22])+(vector_a[23]&vector_b[23])+(vector_a[24]&vector_b[24])+(vector_a[25]&vector_b[25])+(vector_a[26]&vector_b[26])+(vector_a[27]&vector_b[27])+(vector_a[28]&vector_b[28])+(vector_a[29]&vector_b[29])+(vector_a[30]&vector_b[30])+(vector_a[31]&vector_b[31]);
endmodule
