`timescale 1ns / 1ps
`include "Const.v"

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    17:15:55 11/24/2023 
//////////////////////////////////////////////////////////////////////////////////

module DE(
    input        Req,

    input [31:0] Addr,
    input [2 :0] DEControl,
    input [31:0] m_data_rdata,

    input        M_EXC_DM_Ov,

    input        load,


    output [31:0] MemReadData,
    output        M_EXC_AdEL
    );

    wire ErrAlign = ((DEControl == `WORD) & (| Addr[1:0])) |
                    ((DEControl == `HALF) & (  Addr[0]  ));
    
    wire ErrOutOfRange = !( ((Addr >= `DMStartAddr ) & (Addr <= `DMEndAddr )) |
                            ((Addr >= `TC0StartAddr) & (Addr <= `TC0EndAddr)) |
                            ((Addr >= `TC1StartAddr) & (Addr <= `TC1EndAddr)) |
                            ((Addr >= `IntStartAddr) & (Addr <= `IntEndAddr)) );
    
    wire ErrTimer = (DEControl != `WORD) & ((Addr >= `TC0StartAddr) & (Addr <= `TC1EndAddr)); // 对 Timer 进行半字或字节读
    
    assign M_EXC_AdEL = (load) & (ErrAlign | ErrOutOfRange | ErrTimer | M_EXC_DM_Ov);


    wire [15:0] M_Half;
    wire [7 :0] M_Byte;
    assign M_Half = m_data_rdata[Addr[1] * 16 + 15 -: 16];
    assign M_Byte = m_data_rdata[Addr[1: 0] * 8 + 7 -: 8];
    assign MemReadData = (Req | M_EXC_AdEL) ? 32'b0 :
                         (DEControl == `WORD) ?  m_data_rdata :
                         (DEControl == `HALF) ? {{16{M_Half[15]}}, M_Half} :
                         (DEControl == `BYTE) ? {{24{M_Byte[7]}}, M_Byte} :
                         32'b0;

endmodule
