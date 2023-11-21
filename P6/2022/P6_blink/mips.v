`timescale 1ns / 1ps
module mips(
    input clk,
    input reset,
    input [31:0] i_inst_rdata,
    input [31:0] m_data_rdata,
    output [31:0] i_inst_addr,
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3 :0] m_data_byteen,
    output [31:0] m_inst_addr,
    output w_grf_we,
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr
);
    parameter SW = 4'd1, SH = 4'd2, SB = 4'd3;
    parameter LW = 4'd1, LH = 4'd2, LB = 4'd3;
    
    // The wire F needs
    wire [31:0] F_Instr;
    wire [31:0] F_PC;
    
    
    // The wire ControllerD needs
    wire [31:0] D_Instr;
    wire [31:0] D_PC;
    wire [4:0] D_rs;
    wire [4:0] D_rt;
    wire [4:0] D_rd;
    wire [15:0] D_Imm16;
    wire [25:0] D_Imm26;
    wire [2:0] D_EXTControl;
    wire [4:0] D_RegAddr;
    wire D_RegWrite;
    wire D_MemWrite;
    wire D_calc_r, D_calc_i;
    wire D_beq, D_bne, D_bgtz, D_slt, D_sltu;
    wire D_jal, D_jr, D_load, D_store;
    wire D_set, D_md, D_mf, D_mt;
    wire D_bezal; ////////////////////////////////////////////////////
    
    
    // The wire ControllerE needs
    wire [31:0] E_Instr;
    wire [31:0] E_PC;
    wire [4:0] E_rs;
    wire [4:0] E_rt;
    wire [4:0] E_rd;
    wire [4:0] E_shamt;
    wire E_ALUSrc;
    wire [2:0] E_ALUControl;
    wire [3:0] E_MDUControl;
    wire E_RegWrite;
    wire [2:0] E_Mem2Reg;
    wire [4:0] E_RegAddr1;
    wire [4:0] E_RegAddr;
    wire E_calc_r, E_calc_i, E_load, E_lui;
    wire E_md;
    wire E_mf;
    wire E_bezal; ////////////////////////////////////////////////////
    
    
    // The wire ControllerM needs
    wire [31:0] M_Instr;
    wire [31:0] M_PC;
    wire [4:0] M_rs;
    wire [4:0] M_rt;
    wire [4:0] M_rd;
    wire M_RegWrite;
    wire [2:0] M_Mem2Reg;
    wire [4:0] M_RegAddr1;
    wire [4:0] M_RegAddr;
    wire M_MemWrite;
    wire M_load;
    wire [3:0] M_SControl;
    wire [3:0] M_LControl;
    wire M_bezal; ////////////////////////////////////////////////////
                    
                    
    // The wire ControllerW needs
    wire [31:0] W_Instr;
    wire [31:0] W_PC;
    wire [4:0] W_rs;
    wire [4:0] W_rt;
    wire [4:0] W_rd;
    wire W_RegWrite;
    wire [2:0] W_Mem2Reg;
    wire [4:0] W_RegAddr1;
    wire [4:0] W_RegAddr;
    wire W_bezal; ////////////////////////////////////////////////////
    
    
    // The wire NPC needs
    wire [31:0] NPC;
    
    
    // The wire CMP needs
    wire [31:0] CMPSrcA;
    wire [31:0] CMPSrcB;
    wire Zero;
    wire GZ;
    wire LZ;
    wire GS;
    wire LS;
    wire GU;
    wire LU;
    wire GIS;
    wire LIS;
    wire D_flag;


    // The wire GRF needs
    wire [31:0] D_RD1;
    wire [31:0] D_RD2;
    
    
    // The wire E_REG needs
    wire [31:0] D_WD1;
    wire [31:0] D_WD2;
    wire [31:0] D_EXTResult;
    wire D_check;
    wire [31:0] E_WD1;
    wire [31:0] E_WD2;
    wire [31:0] E_EXTResult;
    wire E_check;


    // The wire MDU needs
    wire E_Busy;
    wire E_Start;
    wire MDUData;
    wire [31:0] MDUSrcA;
    wire [31:0] MDUSrcB;
    wire [31:0] E_HI;
    wire [31:0] E_LO;
    
    
    // The wire ALU needs
    wire [31:0] ALUSrcA;
    wire [31:0] ALUSrcB;
    wire [31:0] E_ALUResult;
    
    
    // The wire M_REG needs
    wire M_check;
    wire [31:0] M_WD2;
    wire [31:0] M_ALUResult;
    wire [31:0] M_EXTResult;
    wire [31:0] M_HI;
    wire [31:0] M_LO;
    
    
    // The wire "DM" needs
    wire [31:0] M_MemReadData;
    wire [15:0] M_Half;
    wire [7:0] M_Byte;
    
    
    // The wire W_REG needs
    wire W_check;
    wire [31:0] W_ALUResult;
    wire [31:0] W_EXTResult;
    wire [31:0] W_MemReadData;
    wire [31:0] W_HI;
    wire [31:0] W_LO;
    
    
    // The wire Forward and Stall needs
    wire [31:0] E_Src, M_Src, W_Src;
    wire [31:0] D_MFRS;
    wire [31:0] D_MFRT;
    wire [31:0] E_MFRS;
    wire [31:0] E_MFRT;
    wire [31:0] M_MFRT;
    wire [1:0] Tuse_RS, Tuse_RT;
	wire [1:0] E_Tnew;
    wire [1:0] M_Tnew;
    wire Stall_RS_E, Stall_RS_M, Stall_RS;
    wire Stall_RT_E, Stall_RT_M, Stall_RT;
    wire Stall_MDU;
    wire Stall;
    wire en, clr;
    

    IFU MyIFU (
    .clk(clk), 
    .reset(reset), 
    .en(en), 
    .NPC(NPC), 
    
    .PC(F_PC)
    );
    
    
    D_REG MyD_REG (
    .clk(clk), 
    .reset(reset), 
    .en(en), 
    .F_PC(F_PC), 
    .F_Instr(F_Instr), 
    
    .D_PC(D_PC), 
    .D_Instr(D_Instr)
    );
    
    
    Controller ControllerD (
    .Instr(D_Instr), 
    
    .rs(D_rs), 
    .rt(D_rt),  
    .rd(D_rd), 
    .Imm16(D_Imm16),
    .Imm26(D_Imm26),
    .MemWrite(D_MemWrite), 
    .EXTControl(D_EXTControl), 
    .RegAddr(D_RegAddr),
    
    
    .calc_r(D_calc_r), 
    .calc_i(D_calc_i), 
    .beq(D_beq),
    .bne(D_bne),
    .bgtz(D_bgtz),
    .bezal(D_bezal),
    .jal(D_jal),
    .jr(D_jr),
    .slt(D_slt),
    .sltu(D_sltu),
    .load(D_load), 
    .store(D_store),
    .set(D_set),
    .md(D_md),
    .mf(D_mf),
    .mt(D_mt)
    );
    
    
    CMP MyCMP (
    .SrcA(D_MFRS), 
    .SrcB(D_MFRT), 
    .Imm16(D_Imm16), 
    .Zero(Zero), 
    .GZ(GZ), 
    .LZ(LZ), 
    .GS(GS), 
    .LS(LS), 
    .GU(GU), 
    .LU(LU), 
    .GIS(GIS), 
    .LIS(LIS),
    .check(D_flag)
    );
    
    assign D_check = D_flag & D_bezal;
    assign Nullify = ~D_flag & D_bezal;
    
    NPC MyNPC (
    .Zero(Zero), 
    .GZ(GZ), 
    .check(D_flag),
    .beq(D_beq), 
    .bne(D_bne), 
    .bgtz(D_bgtz), 
    .bezal(D_bezal),
    .jal(D_jal), 
    .jr(D_jr), 
    .F_PC(F_PC), 
    .D_PC(D_PC), 
    .Imm26(D_Imm26), 
    .GRFrs(D_MFRS), 
    
    .NPC(NPC)
    );
    
    
    GRF MyGRF (
    .clk(clk), 
    .reset(reset), 
    .RegWrite(W_RegWrite), 
    .A1(D_rs), 
    .A2(D_rt), 
    .RegAddr(W_RegAddr), 
    .RegData(W_Src), 
    .PC(W_PC), 
    
    .RD1(D_RD1), 
    .RD2(D_RD2)
    );
    
    
    EXT MyEXT (
    .Imm16(D_Imm16), 
    .EXTControl(D_EXTControl), 
    
    .EXTResult(D_EXTResult)
    );
    
    
    E_REG MyE_REG (
    .clk(clk), 
    .reset(reset), 
    .clr(clr), 
    .D_Instr(D_Instr),
    .D_PC(D_PC), 
    .D_WD1(D_MFRS), 
    .D_WD2(D_MFRT), 
    .D_EXTResult(D_EXTResult), 
    .D_check(D_check),
    
    .E_Instr(E_Instr), 
    .E_PC(E_PC), 
    .E_WD1(E_WD1), 
    .E_WD2(E_WD2), 
    .E_EXTResult(E_EXTResult),
    .E_check(E_check)
    );
    
    
    Controller ControllerE (
    .Instr(E_Instr), 
    
    .rs(E_rs), 
    .rt(E_rt), 
    .rd(E_rd), 
    .shamt(E_shamt), 
    .Mem2Reg(E_Mem2Reg),
    .ALUControl(E_ALUControl), 
    .MDUControl(E_MDUControl),
    .ALUSrc(E_ALUSrc), 
    .RegWrite(E_RegWrite),  
    .RegAddr(E_RegAddr1), 
    .bezal(E_bezal),
    .calc_r(E_calc_r), 
    .calc_i(E_calc_i), 
    .load(E_load), 
    .lui(E_lui),
    .md(E_md),
    .mf(E_mf)
    );
    
    assign E_RegAddr = (E_bezal) ? (E_check ? 5'b11111 : 5'b0) : E_RegAddr1;
    
    MDU MyMDU (
    .clk(clk), 
    .reset(reset), 
    .MDUControl(E_MDUControl),
    .SrcA(E_MFRS), 
    .SrcB(E_MFRT), 
    .Start(E_Start), 
    
    .Busy(E_Busy), 
    .HI(E_HI),
    .LO(E_LO)
    );
    
    
    ALU MyALU (
    .SrcA(ALUSrcA), 
    .SrcB(ALUSrcB), 
    .ALUControl(E_ALUControl), 
    .shamt(E_shamt), 
    .ALUResult(E_ALUResult)
    );
    
    
    M_REG MyM_REG (
    .clk(clk), 
    .reset(reset), 
    .E_Instr(E_Instr),
    .E_PC(E_PC), 
    .E_WD2(E_MFRT), 
    .E_ALUResult(E_ALUResult), 
    .E_EXTResult(E_EXTResult), 
    .E_HI(E_HI),
    .E_LO(E_LO),
    .E_check(E_check),
    
    .M_Instr(M_Instr),
    .M_PC(M_PC), 
    .M_WD2(M_WD2), 
    .M_ALUResult(M_ALUResult), 
    .M_EXTResult(M_EXTResult),
    .M_HI(M_HI),
    .M_LO(M_LO),
    .M_check(M_check)
    );
    
    
    Controller ControllerM (
    .Instr(M_Instr), 
    
    .rs(M_rs), 
    .rt(M_rt), 
    .rd(M_rd), 
    .RegWrite(M_RegWrite),
    .MemWrite(M_MemWrite),
    .Mem2Reg(M_Mem2Reg),
    .RegAddr(M_RegAddr1),
    .bezal(M_bezal),
    .load(M_load),
    .SControl(M_SControl),
    .LControl(M_LControl)
    );
    
    assign M_RegAddr = (M_bezal) ? (M_check ? 5'b11111 : 5'b0) : M_RegAddr1;
    
    W_REG MyW_REG (
    .clk(clk), 
    .reset(reset), 
    .M_Instr(M_Instr), 
    .M_PC(M_PC), 
    .M_ALUResult(M_ALUResult), 
    .M_EXTResult(M_EXTResult), 
    .M_MemReadData(M_MemReadData), 
    .M_HI(M_HI),
    .M_LO(M_LO),
    .M_check(M_check),
    
    .W_Instr(W_Instr), 
    .W_PC(W_PC), 
    .W_ALUResult(W_ALUResult), 
    .W_EXTResult(W_EXTResult), 
    .W_MemReadData(W_MemReadData),
    .W_HI(W_HI),
    .W_LO(W_LO),
    .W_check(W_check)
    );
    
    
    Controller ControllerW (
    .Instr(W_Instr), 
    
    .rs(W_rs), 
    .rt(W_rt), 
    .rd(W_rd), 
    .RegWrite(W_RegWrite), 
    .Mem2Reg(W_Mem2Reg), 
    .RegAddr(W_RegAddr1),
    .bezal(W_bezal)
    );
    
    assign W_RegAddr = (W_bezal) ? (W_check ? 5'b11111 : 5'b0) : W_RegAddr1;
    
    assign Tuse_RS = (D_beq | D_jr | D_bgtz | D_bne | D_bezal) ? 2'b00 : 
                     (D_calc_r | D_calc_i | D_load | D_store | D_md | D_mt) ? 2'b01 : 
                     2'b11;
    assign Tuse_RT = (D_beq | D_bgtz | D_bne | D_bezal | D_slt | D_sltu) ? 2'b00 : 
                     (D_calc_r | D_md) ? 2'b01 : 
                     (D_store) ? 2'b10 : 
                     2'b11;

    
    assign E_Tnew = (E_calc_r | E_calc_i | E_lui | E_mf) ? 2'b01:
                    (E_load) ? 2'b10:
                    2'b00;
 
    assign M_Tnew = M_load ? 2'b01: 2'b00;
    
    
    assign Stall_RS_E = (Tuse_RS < E_Tnew) & (D_rs == E_RegAddr) & (D_rs != 5'b0) & (E_RegWrite);
    assign Stall_RS_M = (Tuse_RS < M_Tnew) & (D_rs == M_RegAddr) & (D_rs != 5'b0) & (M_RegWrite);
    assign Stall_RS = Stall_RS_E | Stall_RS_M;
    
    assign Stall_RT_E = (Tuse_RT < E_Tnew) & (D_rt == E_RegAddr) & (D_rt != 5'b0) & (E_RegWrite);
    assign Stall_RT_M = (Tuse_RT < M_Tnew) & (D_rt == M_RegAddr) & (D_rt != 5'b0) & (M_RegWrite);
    assign Stall_RT = Stall_RT_E | Stall_RT_M;
    
    
    assign E_Start = E_md;
    assign Stall_MDU = E_Start | E_Busy & (D_md | D_mf | D_mt);
    
    assign Stall = Stall_RS | Stall_RT | Stall_MDU;
    
    
    assign en = !Stall;
    assign clr = Stall;
    
    
    
    assign E_Src = (E_Mem2Reg == 3'b010) ? E_EXTResult : 
                   (E_Mem2Reg == 3'b011) ? E_PC + 8 : 
                   32'h00000000;
    assign M_Src = (M_Mem2Reg == 3'b000) ? M_ALUResult : 
                   (M_Mem2Reg == 3'b010) ? M_EXTResult : 
                   (M_Mem2Reg == 3'b011) ? M_PC + 8 : 
                   (M_Mem2Reg == 3'b100) ? M_HI : 
                   (M_Mem2Reg == 3'b101) ? M_LO : 
                   32'h00000000;
    assign W_Src = (W_Mem2Reg == 3'b000) ? W_ALUResult : 
                   (W_Mem2Reg == 3'b001) ? W_MemReadData : 
                   (W_Mem2Reg == 3'b010) ? W_EXTResult : 
                   (W_Mem2Reg == 3'b011) ? W_PC + 8 : 
                   (W_Mem2Reg == 3'b100) ? W_HI : 
                   (W_Mem2Reg == 3'b101) ? W_LO : 
                   32'h00000000;
    
    assign D_MFRS = (D_rs == 5'b0) ? 32'b0 : 
                    (D_rs == E_RegAddr && E_RegWrite == 1'b1) ? E_Src : 
                    (D_rs == M_RegAddr && M_RegWrite == 1'b1) ? M_Src : 
                    (D_rs == W_RegAddr && W_RegWrite == 1'b1) ? W_Src : 
                    D_RD1;
    assign D_MFRT = (D_rt == 5'b0) ? 32'b0 : 
                    (D_rt == E_RegAddr && E_RegWrite == 1'b1) ? E_Src : 
                    (D_rt == M_RegAddr && M_RegWrite == 1'b1) ? M_Src : 
                    (D_rt == W_RegAddr && W_RegWrite == 1'b1) ? W_Src : 
                    D_RD2;
    assign E_MFRS = (E_rs == 5'b0) ? 32'b0 : 
                    (E_rs == M_RegAddr && M_RegWrite == 1'b1) ? M_Src : 
                    (E_rs == W_RegAddr && W_RegWrite == 1'b1) ? W_Src : 
                    E_WD1;
    assign E_MFRT = (E_rt == 5'b0) ? 32'b0 : 
                    (E_rt == M_RegAddr && M_RegWrite == 1'b1) ? M_Src : 
                    (E_rt == W_RegAddr && W_RegWrite == 1'b1) ? W_Src : 
                    E_WD2;
    assign M_MFRT = (M_rt == 5'b0) ? 32'b0 : 
                    (M_rt == W_RegAddr && W_RegWrite == 1'b1) ? W_Src : 
                    M_WD2;
    
    assign ALUSrcA = E_MFRS;
    assign ALUSrcB = (E_ALUSrc) ? E_EXTResult : E_MFRT;
    
    
    assign F_Instr = i_inst_rdata; //
    assign i_inst_addr = F_PC; //
    assign m_data_addr = M_ALUResult; //
    assign m_inst_addr = M_PC; //
    assign w_grf_we = W_RegWrite; //
    assign w_grf_addr = W_RegAddr; //
    assign w_grf_wdata = W_Src; //
    assign w_inst_addr = W_PC; //
    
    assign m_data_wdata = (M_SControl == 1) ? M_MFRT :
                          (M_SControl == 2 & M_ALUResult[1]) ? {M_MFRT[15: 0], 16'b0} :
                          (M_SControl == 2 & ~M_ALUResult[1]) ? {16'b0, M_MFRT[15: 0]} :
                          (M_SControl == 3 & M_ALUResult[1:0] == 2'b11) ? {M_MFRT[7:0], 24'b0} :
                          (M_SControl == 3 & M_ALUResult[1:0] == 2'b10) ? {8'b0, M_MFRT[7:0], 16'b0} :
                          (M_SControl == 3 & M_ALUResult[1:0] == 2'b01) ? {16'b0, M_MFRT[7:0], 8'b0} :
                          (M_SControl == 3 & M_ALUResult[1:0] == 2'b00) ? {24'b0, M_MFRT[7:0]} :
                          32'b0; //
    assign m_data_byteen = (M_SControl == 1) ? 4'b1111 :
                           (M_SControl == 2 & m_data_addr[1]) ? 4'b1100 : 
                           (M_SControl == 2 & ~m_data_addr[1]) ? 4'b0011 :
                           (M_SControl == 3 & m_data_addr[1: 0] == 3) ? 4'b1000 :
                           (M_SControl == 3 & m_data_addr[1: 0] == 2) ? 4'b0100 :
                           (M_SControl == 3 & m_data_addr[1: 0] == 1) ? 4'b0010 :
                           (M_SControl == 3 & m_data_addr[1: 0] == 0) ? 4'b0001 :
                           32'b0; //
    
    assign M_Half = m_data_rdata[m_data_addr[1] * 16 + 15 -: 16]; //
    assign M_Byte = m_data_rdata[m_data_addr[1: 0] * 8 + 7 -: 8]; //
    assign M_MemReadData = (M_LControl == 4'd1) ?  m_data_rdata :
                           (M_LControl == 4'd2) ? {{16{M_Half[15]}}, M_Half} :
                           (M_LControl == 4'd3) ? {{24{M_Byte[7]}}, M_Byte} :
                           0; //

endmodule