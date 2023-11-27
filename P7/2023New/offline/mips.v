`timescale 1ns / 1ps

module mips(
    input         clk,            // 时钟信号
    input         reset,          // 同步复位信号
    input         interrupt,      // 外部中断信号
    output [31:0] macroscopic_pc, // 宏观 PC

    output [31:0] i_inst_addr,    // IM 读取地址（取指 PC）
    input  [31:0] i_inst_rdata,   // IM 读取数据

    output [31:0] m_data_addr,    // DM 读写地址
    input  [31:0] m_data_rdata,   // DM 读取数据
    output [31:0] m_data_wdata,   // DM 待写入数据
    output [3 :0] m_data_byteen,  // DM 字节使能信号

    output [31:0] m_int_addr,     // 中断发生器待写入地址
    output [3 :0] m_int_byteen,   // 中断发生器字节使能信号

    output [31:0] m_inst_addr,    // M 级 PC

    output        w_grf_we,       // GRF 写使能信号
    output [4 :0] w_grf_addr,     // GRF 待写入寄存器编号
    output [31:0] w_grf_wdata,    // GRF 待写入数据

    output [31:0] w_inst_addr     // W 级 PC
);

    // The wire CPU needs
	wire	 [5 :0] HWInt;
	wire			IntResponse;
    assign HWInt = {3'b0, interrupt, TC1_IRQ, TC0_IRQ};


    // The wire TC0 needs
	wire	 [31:0]	TC0_Addr;
    wire			TC0_WE;
    wire	 [31:0] TC0_Din;
    wire	 [31:0]	TC0_Dout;
	wire	 		TC0_IRQ;


    // The wire TC1 needs
	wire	 [31:0]	TC1_Addr;
    wire			TC1_WE;
    wire	 [31:0] TC1_Din;
	wire	 [31:0]	TC1_Dout;
	wire	 		TC1_IRQ;


    // The wire Bridge needs
	wire     [31:0] cpu_m_data_addr;
    wire     [31:0] cpu_m_data_rdata;
    wire     [31:0] cpu_m_data_wdata;
    wire     [3 :0] cpu_m_data_byteen;

    wire     [31:0] bridge_m_data_addr;
    wire     [3 :0] bridge_m_data_byteen;

    mips_cpu MyCPU (
        .clk(clk), 
        .reset(reset), 
        .HWInt(HWInt), 
        .macroscopic_pc(macroscopic_pc),

        .i_inst_addr(i_inst_addr), 
        .i_inst_rdata(i_inst_rdata), 

        .m_data_addr(cpu_m_data_addr), 
        .m_data_rdata(cpu_m_data_rdata), 
        .m_data_wdata(cpu_m_data_wdata), 
        .m_data_byteen(cpu_m_data_byteen), // 仅有 M 级和外设交互

        .m_inst_addr(m_inst_addr), 

        .w_grf_we(w_grf_we), 
        .w_grf_addr(w_grf_addr), 
        .w_grf_wdata(w_grf_wdata), 

        .w_inst_addr(w_inst_addr),

        .IntResponse(IntResponse)
    );

    // assign m_data_addr = (interrupt & IntResponse) ? 32'h0000_7f20 : bridge_m_data_addr;
    assign m_data_addr = bridge_m_data_addr;
    // assign m_data_byteen = (interrupt & IntResponse) ? 4'b1 : bridge_m_data_byteen;
    assign m_data_byteen = bridge_m_data_byteen;


    Bridge MyBridge(
        .m_data_addr(bridge_m_data_addr),
        .m_data_wdata(m_data_wdata),
        .m_data_byteen(bridge_m_data_byteen),
        .m_data_rdata(m_data_rdata),

        .cpu_m_data_addr(cpu_m_data_addr),
        .cpu_m_data_wdata(cpu_m_data_wdata),
        .cpu_m_data_byteen(cpu_m_data_byteen),
        .cpu_m_data_rdata(cpu_m_data_rdata),

        .m_int_addr(m_int_addr),
        .m_int_byteen(m_int_byteen),

        .TC0_Addr(TC0_Addr),
        .TC0_WE(TC0_WE),
        .TC0_Din(TC0_Din),
        .TC0_Dout(TC0_Dout),

        .TC1_Addr(TC1_Addr),
        .TC1_WE(TC1_WE),
        .TC1_Din(TC1_Din),
        .TC1_Dout(TC1_Dout)
    );


    TC MyTC0 (
        .clk(clk), 
        .reset(reset), 
        .Addr(TC0_Addr[31:2]), 
        .WE(TC0_WE), 
        .Din(TC0_Din), 
        .Dout(TC0_Dout), 
        .IRQ(TC0_IRQ)
    );


    TC MyTC1 (
        .clk(clk), 
        .reset(reset), 
        .Addr(TC1_Addr[31:2]), 
        .WE(TC1_WE), 
        .Din(TC1_Din), 
        .Dout(TC1_Dout), 
        .IRQ(TC1_IRQ)
    );


endmodule