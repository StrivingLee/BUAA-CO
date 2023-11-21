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
    input [15:0] Imm16,
    input slt,
    input sltu,
    output Zero,
    output GZ,
    output LZ,
    output GS,
    output LS,
    output GU,
    output LU,
    output GIS,
    output LIS
);
    
    wire [31:0] sign_extend_imm;
    assign sign_extend_imm = {{16{Imm16[15]}}, Imm16};
    assign Zero = (SrcA == SrcB) ? 1'b1 : 1'b0;
    assign GZ = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LZ = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;
    assign GS = ($signed(SrcA) > $signed(SrcB));
    assign LS = ($signed(SrcA) < $signed(SrcB));
    assign GU = (SrcA > SrcB);
    assign LU = (SrcA < SrcB);
    assign GIS = ($signed(SrcA) > $signed(sign_extend_imm));
    assign LIS = ($signed(SrcA) < $signed(sign_extend_imm));
    /*
    assign CMPResult = (slt) ? (LS ? 32'b1 : 32'b0) : 
                       (sltu) ? (LU ? 32'b1 : 32'b0) : 
                       32'b0;*/

endmodule
