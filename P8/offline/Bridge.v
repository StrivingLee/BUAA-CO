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
        
        output [31:0] TC_Addr,
        output        TC_WE,
        output [31:0] TC_Din,
        input  [31:0] TC_Dout
    );

    assign m_data_addr = cpu_m_data_addr;
    assign TC_Addr     = cpu_m_data_addr;

    assign m_data_wdata = cpu_m_data_wdata;
    assign TC_Din       = cpu_m_data_wdata;

    wire SelTC  = (cpu_m_data_addr >= `TC0StartAddr) & (cpu_m_data_addr <= `TC0EndAddr);
    wire SelInt = (cpu_m_data_addr >= `IntStartAddr) & (cpu_m_data_addr <= `IntEndAddr);

    wire WE = (| cpu_m_data_byteen);

    assign TC_WE = WE & SelTC0;

    assign m_data_byteen = (SelTC) ? 4'b0 : 
                           (SelInt & (| cpu_m_data_byteen)) ? 4'b1 :
                           cpu_m_data_byteen;
    
    assign cpu_m_data_rdata = (SelTC) ? TC_Dout : m_data_rdata;
    
    assign m_int_addr = cpu_m_data_addr;
    assign m_int_byteen = m_data_byteen;


endmodule
