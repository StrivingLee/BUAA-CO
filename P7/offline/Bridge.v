`timescale 1ns / 1ps
`include "Const.v"

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    22:17:46 11/23/2023 
//////////////////////////////////////////////////////////////////////////////////

module Bridge(
        output [31:0] m_data_addr,
        input  [31:0] m_data_rdata,
        output [31:0] m_data_wdata,
        output [3 :0] m_data_byteen,

        input  [31:0] cpu_m_data_addr,
        output [31:0] cpu_m_data_rdata,
        input  [31:0] cpu_m_data_wdata,
        input  [3 :0] cpu_m_data_byteen,

        output [31:0] m_int_addr,
        output [3 :0] m_int_byteen,
        
        output [31:0] TC0_Addr,
        output        TC0_WE,
        output [31:0] TC0_Din,
        input  [31:0] TC0_Dout,
        
        output [31:0] TC1_Addr,
        output        TC1_WE,
        output [31:0] TC1_Din,
        input  [31:0] TC1_Dout
    );

    assign m_data_addr = cpu_m_data_addr;
    assign TC0_Addr    = cpu_m_data_addr;
    assign TC1_Addr    = cpu_m_data_addr;

    assign m_data_wdata = cpu_m_data_wdata;
    assign TC0_Din      = cpu_m_data_wdata;
    assign TC1_Din      = cpu_m_data_wdata;

    wire SelTC0 = (cpu_m_data_addr >= `TC0StartAddr) & (cpu_m_data_addr <= `TC0EndAddr);
    wire SelTC1 = (cpu_m_data_addr >= `TC1StartAddr) & (cpu_m_data_addr <= `TC1EndAddr);
    wire SelInt = (cpu_m_data_addr >= `IntStartAddr) & (cpu_m_data_addr <= `IntEndAddr);

    wire WE = (| cpu_m_data_byteen);

    assign TC0_WE = WE & SelTC0;
    assign TC1_WE = WE & SelTC1;

    assign m_data_byteen = (SelTC0 | SelTC1) ? 4'b0 : 
                           (SelInt & (| cpu_m_data_byteen)) ? 4'b1 :
                           cpu_m_data_byteen;
    
    assign cpu_m_data_rdata = (SelTC0) ? TC0_Dout :
                              (SelTC1) ? TC1_Dout :
                              m_data_rdata;
    
    assign m_int_addr = cpu_m_data_addr;
    assign m_int_byteen = m_data_byteen;


endmodule
