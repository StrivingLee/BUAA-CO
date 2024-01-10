`timescale 1ns / 1ps
`include "Const.v"

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    18:03:59 11/24/2023 
//////////////////////////////////////////////////////////////////////////////////

module BE(
    input        MemWrite,

    input [31:0] Addr,
    input [2 :0] BEControl,
    input [31:0] RTData,

    input        M_EXC_DM_Ov,

    input        store,


    output [3 :0] m_data_byteen,
    output [31:0] m_data_wdata,
    output        M_EXC_AdES
    );

    wire ErrAlign = ((BEControl == `WORD) & (| Addr[1:0])) |
                    ((BEControl == `HALF) & (  Addr[0]  ));
    
    wire ErrOutOfRange = !( ((Addr >= `DMStartAddr ) & (Addr <= `DMEndAddr )) |
                            ((Addr >= `TC0StartAddr) & (Addr <= `TC0EndAddr)) |
                            ((Addr >= `TC1StartAddr) & (Addr <= `TC1EndAddr)) |
                            ((Addr >= `IntStartAddr) & (Addr <= `IntEndAddr)) );
    
    wire ErrTimer = ((Addr >= `TC0CountStartAddr) & (Addr <= `TC0EndAddr)) | // 写进只读的 COUNT 寄存器
                    ((Addr >= `TC1CountStartAddr) & (Addr <= `TC1EndAddr)) | 
                    (BEControl != `WORD) & ((Addr >= `TC0StartAddr) & (Addr <= `TC1EndAddr)); // 对 Timer 进行半字或字节读
    
    assign M_EXC_AdES = (store) & (ErrAlign | ErrOutOfRange | ErrTimer | M_EXC_DM_Ov);

    assign m_data_wdata = (BEControl == `WORD) ? RTData :
                          (BEControl == `HALF & Addr[1]) ? {RTData[15:0], 16'b0} :
                          (BEControl == `HALF & !Addr[1]) ? {16'b0, RTData[15:0]} :
                          (BEControl == `BYTE & Addr[1:0] == 2'b11) ? {RTData[7:0], 24'b0} :
                          (BEControl == `BYTE & Addr[1:0] == 2'b10) ? {8'b0, RTData[7:0], 16'b0} :
                          (BEControl == `BYTE & Addr[1:0] == 2'b01) ? {16'b0, RTData[7:0], 8'b0} :
                          (BEControl == `BYTE & Addr[1:0] == 2'b00) ? {24'b0, RTData[7:0]} :
                          32'b0;
    assign m_data_byteen = (!MemWrite) ? 4'b0000 :
                           (BEControl == `WORD) ? 4'b1111 :
                           (BEControl == `HALF & Addr[1]) ? 4'b1100 : 
                           (BEControl == `HALF & !Addr[1]) ? 4'b0011 :
                           (BEControl == `BYTE & Addr[1:0] == 2'b11) ? 4'b1000 :
                           (BEControl == `BYTE & Addr[1:0] == 2'b10) ? 4'b0100 :
                           (BEControl == `BYTE & Addr[1:0] == 2'b01) ? 4'b0010 :
                           (BEControl == `BYTE & Addr[1:0] == 2'b00) ? 4'b0001 :
                           4'b0;


endmodule
