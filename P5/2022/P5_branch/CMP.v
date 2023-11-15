`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:40 12/02/2022 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input [31:0] SrcA,
    input [31:0] SrcB,
    output Zero,
    output GreaterZero,
    output LessZero,
    output check
);
    integer i, flag = 1;
    assign Zero = (SrcA == SrcB) ? 1'b1 : 1'b0;
    assign GreaterZero = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LessZero = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;
    
    /*always @(*) begin
        flag = 1;
        for (i = 0; i < 32; i = i + 1) begin
            if (SrcA[i] ^ SrcA[31 - i]) begin
                flag = 0;
            end
        end
            if (flag) check = 1'b1;
            else check = 1'b0;
    end*/
    assign check = ~((SrcA[0] ^ SrcA[31]) | (SrcA[1] ^ SrcA[30]) |(SrcA[2] ^ SrcA[29]) |(SrcA[3] ^ SrcA[28]) |(SrcA[4] ^ SrcA[27]) |(SrcA[5] ^ SrcA[26]) |(SrcA[6] ^ SrcA[25]) | (SrcA[7] ^ SrcA[24]) | (SrcA[8] ^ SrcA[23]) | (SrcA[9] ^ SrcA[22]) | (SrcA[10] ^ SrcA[21]) | (SrcA[11] ^ SrcA[20]) | (SrcA[12] ^ SrcA[19]) | (SrcA[13] ^ SrcA[18]) | (SrcA[14] ^ SrcA[17]) | (SrcA[15] ^ SrcA[16]) );
endmodule
