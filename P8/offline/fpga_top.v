/* Template Top Module for CO-FPGA */

module fpga_top (
    // clock and reset
    input clk_in,
    input sys_rstn,
    // dip switch
    input [7:0] dip_switch0,
    input [7:0] dip_switch1,
    input [7:0] dip_switch2,
    input [7:0] dip_switch3,
    input [7:0] dip_switch4,
    input [7:0] dip_switch5,
    input [7:0] dip_switch6,
    input [7:0] dip_switch7,
    // key
    input [7:0] user_key,
    // led
    output [31:0] led_light,
    // digital tube
    output [7:0] digital_tube2,
    output digital_tube_sel2,
    output [7:0] digital_tube1,
    output [3:0] digital_tube_sel1,
    output [7:0] digital_tube0,
    output [3:0] digital_tube_sel0,
    // uart
    input uart_rxd,
    output uart_txd
);

    wire        interrupt;
    wire [31:0] macroscopic_pc;
    wire [31:0] i_inst_addr;    // IM 读取地址（取指 PC）
    wire [31:0] i_inst_rdata;   // IM 读取数据

    wire [31:0] m_data_addr;    // DM 读写地址
    wire [31:0] m_data_rdata;   // DM 读取数据
    wire [31:0] m_data_wdata;   // DM 待写入数据
    wire [3 :0] m_data_byteen;  // DM 字节使能信号

    wire [31:0] m_int_addr;     // 中断发生器待写入地址
    wire [3 :0] m_int_byteen;   // 中断发生器字节使能信号

    wire [31:0] m_inst_addr;    // M 级 PC

    wire        w_grf_we;       // GRF 写使能信号
    wire [4 :0] w_grf_addr;     // GRF 待写入寄存器编号
    wire [31:0] w_grf_wdata;    // GRF 待写入数据

    wire [31:0] w_inst_addr;    // W 级 PC


    // The wire CPU needs
	wire [5 :0] HWInt;
	wire IntResponse;
    assign HWInt = {3'b0, interrupt, 1'b0, TC0_IRQ};


    // The wire TC needs
	wire	 [31:0]	TC_Addr;
    wire			TC_WE;
    wire	 [31:0] TC_Din;
    wire	 [31:0]	TC_Dout;
	wire	 		TC_IRQ;


    // The wire Bridge needs
	wire     [31:0] cpu_m_data_addr;
    wire     [31:0] cpu_m_data_rdata;
    wire     [31:0] cpu_m_data_wdata;
    wire     [3 :0] cpu_m_data_byteen;

    // wire     [31:0] bridge_m_data_addr;
    // wire     [3 :0] bridge_m_data_byteen;

    mips_cpu MyCPU (
        .clk(clk_in), 
        .reset(~sys_rstn), 
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
    // assign m_data_addr = bridge_m_data_addr;
    // assign m_data_byteen = (interrupt & IntResponse) ? 4'b1 : bridge_m_data_byteen;
    // assign m_data_byteen = bridge_m_data_byteen;


    Bridge MyBridge(
        // .m_data_addr(bridge_m_data_addr),
        .m_data_addr(m_data_addr),
        .m_data_wdata(m_data_wdata),
        // .m_data_byteen(bridge_m_data_byteen),
        .m_data_byteen(m_data_byteen),
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


    TC MyTC (
        .clk(clk), 
        .reset(reset), 
        .Addr(TC_Addr[31:2]), 
        .WE(TC_WE), 
        .Din(TC_Din), 
        .Dout(TC_Dout), 
        .IRQ(TC_IRQ)
    );

    always @(posedge clk_in) begin
        if (~sys_rstn) begin
            // synchronous reset
        end
        else begin
            // Your code here
        end
    end

    // Default assignment for peripherals not in use. Comment corresponding line(s) if you use them.
    // UART: idle
    assign uart_txd = 1'b1;
    // LED: off
    assign led_light = 32'hFFFF_FFFF;
    // Digital tube: off
    assign digital_tube_sel0 = 4'b1111;
    assign digital_tube_sel1 = 4'b1111;
    assign digital_tube_sel2 = 1'b1;
    assign digital_tube0 = 8'hFF;
    assign digital_tube1 = 8'hFF;
    assign digital_tube2 = 8'hFF;

endmodule