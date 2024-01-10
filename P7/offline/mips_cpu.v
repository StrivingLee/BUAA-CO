`timescale 1ns / 1ps
`include "Const.v"

module mips_cpu(
    input         clk,
    input         reset,
    input  [5 :0] HWInt,
    output [31:0] macroscopic_pc,

    output [31:0] i_inst_addr,
    input  [31:0] i_inst_rdata,

    output [31:0] m_data_addr,
    input  [31:0] m_data_rdata,
    output [31:0] m_data_wdata,
    output [3 :0] m_data_byteen,

    output [31:0] m_inst_addr,

    output        w_grf_we,
    output [4 :0] w_grf_addr,
    output [31:0] w_grf_wdata,
    
    output [31:0] w_inst_addr,
    
    output        IntResponse
);
    // The wire EPC and Req needs
    wire [31:0] EPC;
    wire        Req;


    // The wire F needs
    wire [31:0] F_Instr;
    wire [31:0] temp_F_PC;
    wire [31:0] F_PC;
    wire        F_BD;
    wire        F_EXC_AdEL;
    wire        F_EXC_Sys;
    wire [4 :0] F_EXC_Code;
    wire [4 :0] temp_F_EXC_Code;


    // The wire D_REG needs
    wire        D_BD;
    wire [4 :0] D_EXC_Code;
    wire [4 :0] temp_D_EXC_Code;

    
    // The wire ControllerD needs
    wire [31:0] D_Instr;
    wire [31:0] D_PC;
    wire [4 :0] D_rs;
    wire [4 :0] D_rt;
    wire [4 :0] D_rd;
    wire [15:0] D_Imm16;
    wire [25:0] D_Imm26;
    wire [2 :0] D_NPCControl;
    wire [2 :0] D_EXTControl;
    wire [4 :0] D_RegAddr;
    wire        D_RegWrite;
    wire        D_MemWrite;
    wire        D_calc_r, D_calc_i;
    wire        D_beq, D_bne, D_bgtz, D_slt, D_sltu;
    wire        D_jal, D_jr, D_load, D_store;
    wire        D_set, D_md, D_mf, D_mt;
    wire        D_newbal;
    wire        D_newload;
    wire        D_mtc0;
    wire        D_eret;
    wire        D_EXC_RI;


    // The wire E_REG needs
    wire [31:0] D_WD1;
    wire [31:0] D_WD2;
    wire [31:0] D_EXTResult;
    wire        D_check;

    wire [31:0] E_WD1;
    wire [31:0] E_WD2;
    wire [31:0] E_EXTResult;
    wire        E_BD;
    wire [4 :0] E_EXC_Code;
    wire [4 :0] temp_E_EXC_Code;
    wire        E_check;
    
    
    // The wire ControllerE needs
    wire [31:0] E_Instr;
    wire [31:0] E_PC;
    wire [4 :0] E_rs;
    wire [4 :0] E_rt;
    wire [4 :0] E_rd;
    wire [4 :0] E_shamt;
    wire        E_ALUSrc;
    wire [2 :0] E_ALUControl;
    wire        E_ALU_CAL_Ov;
    wire        E_ALU_DM_Ov;
    wire [3 :0] E_MDUControl;
    wire        E_RegWrite;
    wire [2 :0] E_Mem2Reg;
    wire [4 :0] E_RegAddr1;
    wire [4 :0] E_RegAddr;
    wire        E_calc_r, E_calc_i, E_load, E_lui;
    wire        E_md;
    wire        E_mf;
    wire        E_newbal;
    wire        E_newload;
    wire        E_mfc0;
    wire        E_mtc0;
    
    
    // The wire NPC needs
    wire [31:0] NPC;
    
    
    // The wire CMP needs
    wire [31:0] CMPSrcA;
    wire [31:0] CMPSrcB;
    wire        Zero;
    wire        GZ;
    wire        LZ;
    wire        GS;
    wire        LS;
    wire        GU;
    wire        LU;
    wire        GIS;
    wire        LIS;
    wire        D_flag;


    // The wire GRF needs
    wire [31:0] D_RD1;
    wire [31:0] D_RD2;


    /* The wire MDU begins */
    wire        E_Busy;
    wire        E_Start;

    wire        MDUData;
    wire [31:0] MDUSrcA;
    wire [31:0] MDUSrcB;


    wire [31:0] E_HI;
    wire [31:0] E_LO;
    /* The wire MDU ends */
    
    
    // The wire ALU needs
    wire [31:0] ALUSrcA;
    wire [31:0] ALUSrcB;
    wire [31:0] E_ALUResult;
    wire        E_EXC_CAL_Ov;
    wire        E_EXC_DM_Ov;
    
    
    // The wire M_REG needs
    wire [31:0] M_WD2;
    wire [31:0] M_ALUResult;
    wire [31:0] M_EXTResult;
    wire [31:0] M_HI;
    wire [31:0] M_LO;
    wire        M_BD;
    wire [4 :0] M_EXC_Code;
    wire [4 :0] temp_M_EXC_Code;
    wire        M_EXC_DM_Ov;
    wire        M_check;
    
    
    // The wire ControllerM needs
    wire [31:0] M_Instr;
    wire [31:0] M_PC;
    wire [4 :0] M_rs;
    wire [4 :0] M_rt;
    wire [4 :0] M_rd;
    wire        M_RegWrite;
    wire [2 :0] M_Mem2Reg;
    wire [4 :0] M_RegAddr1;
    wire [4 :0] M_RegAddr;
    wire        M_MemWrite;
    wire        M_store;
    wire        M_load;
    wire [2 :0] M_BEControl;
    wire [2 :0] M_DEControl;
    wire        M_newbal;
    wire        M_newload;
    wire        M_mfc0;
    wire        M_mtc0;
    wire        M_eret;


    // The wire "DM" needs
    wire [31:0] M_MemReadData;
    wire        M_EXC_AdES;
    wire        M_EXC_AdEL;


    // The wire CP0 needs
    wire [31:0] M_CP0Result;
    // todo privilege
    wire        EXL;
    wire        CU0;
    wire        M_EXC_RI;
    
    
    // The wire W_REG needs
    wire W_check;
    wire [31:0] W_ALUResult;
    wire [31:0] W_EXTResult;
    wire [31:0] W_MemReadData;
    wire [31:0] W_CP0Result;
    wire [31:0] W_HI;
    wire [31:0] W_LO;


    // The wire ControllerW needs
    wire [31:0] W_Instr;
    wire [31:0] W_PC;
    wire [4 :0] W_rs;
    wire [4 :0] W_rt;
    wire [4 :0] W_rd;
    wire        W_RegWrite;
    wire [2 :0] W_Mem2Reg;
    wire [4 :0] W_RegAddr1;
    wire [4 :0] W_RegAddr;
    wire        W_newbal;
    wire        W_newload;

    
    // The wire Forward and Stall needs
    wire [31:0] E_Src, M_Src, W_Src;
    wire [31:0] D_MFRS;
    wire [31:0] D_MFRT;
    wire [31:0] E_MFRS;
    wire [31:0] E_MFRT;
    wire [31:0] M_MFRT;
    wire [1 :0] D_Tuse_RS, D_Tuse_RT;
	wire [1 :0] E_Tnew;
    wire [1 :0] M_Tnew;
    wire        E_Stall_RS, M_Stall_RS, Stall_RS;
    wire        E_Stall_RT, M_Stall_RT, Stall_RT;
    wire        E_Stall_MDU, Stall_MDU;
    wire        M_Stall_eret, Stall_eret;
    wire        Stall;
    wire        en, flush;


/* ============================== F begins ============================== */

    IFU MyIFU (
        .clk(clk), 
        .reset(reset), 
        .Req(Req),
        .en(en), 

        .NPC(NPC), 
        
        
        .PC(temp_F_PC)
    );

    assign F_PC = (D_eret) ? EPC : temp_F_PC;

    assign F_EXC_AdEL = ((| F_PC[1:0]) |
                       (F_PC < 32'h0000_3000) | (F_PC > 32'h0000_6ffc)) & !D_eret;
    assign F_EXC_Sys = (F_Instr[31:26] == 6'b0 & F_Instr[5:0] == 6'b001100) & !F_EXC_AdEL; // syscall，并且正常取数
    assign F_EXC_Code = (F_EXC_AdEL) ? `EXC_AdEL :
                        (F_EXC_Sys) ? `EXC_Sys :
                        `EXC_None;
    assign F_BD = (D_NPCControl != `INCRE);

    assign F_Instr = (F_EXC_AdEL) ? 32'd0 : i_inst_rdata; // 清空eret延迟槽，异常时清除指令
	
    assign i_inst_addr = F_PC;

/* ============================== F ends ============================== */

/* ============================== FD REG begins ============================== */
    
    D_REG MyD_REG (
        .clk(clk), 
        .reset(reset), 
        .en(en), 
        .Req(Req), 

        .F_PC(F_PC), 
        .F_Instr(F_Instr), 
        .F_BD(F_BD), 
        .F_EXC_Code(F_EXC_Code), 
        

        .D_PC(D_PC), 
        .D_Instr(D_Instr),
        .D_BD(D_BD), 
        .D_EXC_Code(temp_D_EXC_Code)
    );
    
/* ============================== FD REG ends ============================== */

/* ============================== D begins ============================== */

    Controller ControllerD (
        .Instr(D_Instr), 
        

        .rs(D_rs), 
        .rt(D_rt),  
        .rd(D_rd), 
        .Imm16(D_Imm16),
        .Imm26(D_Imm26),
        .NPCControl(D_NPCControl), 
        .MemWrite(D_MemWrite), 
        .EXTControl(D_EXTControl), 
        .RegAddr(D_RegAddr),
                
        .calc_r(D_calc_r), 
        .calc_i(D_calc_i), 
        .beq(D_beq),
        .bne(D_bne),
        .bgtz(D_bgtz),
        .jal(D_jal),
        .jr(D_jr),
        .slt(D_slt),
        .sltu(D_sltu),
        .load(D_load), 
        .store(D_store),
        .set(D_set),
        .md(D_md),
        .mf(D_mf),
        .mt(D_mt),
        .newbal(D_newbal),
        .newload(D_newload),
        .mtc0(D_mtc0),
        .eret(D_eret),
        .EXC_RI(D_EXC_RI)
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
    
    // todo branch
    assign D_check = D_flag & D_newbal;
    assign Nullify = ~D_flag & D_newbal;
    
    NPC MyNPC (
        .Req(Req),
        .eret(D_eret),
        .EPC(EPC), 


        .Zero(Zero), 
        .GZ(GZ), 
        .LZ(LZ), 
        .check(D_flag),
        .beq(D_beq), 
        .bne(D_bne), 
        .bgtz(D_bgtz), 
        .newbal(D_newbal),
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


    assign D_EXC_Code = (temp_D_EXC_Code) ? temp_D_EXC_Code : 
                        (D_EXC_RI) ? `EXC_RI :
                        `EXC_None;

/* ============================== D ends ============================== */

/* ============================== DE REG begins ============================== */
    
    E_REG MyE_REG (
        .clk(clk), 
        .reset(reset), 
        .flush(flush),
        .Req(Req), 

        .D_Instr(D_EXC_RI ? 32'b0 : D_Instr),
        .D_PC(D_PC), 
        .D_WD1(D_MFRS), 
        .D_WD2(D_MFRT), 
        .D_EXTResult(D_EXTResult), 
        .D_BD(D_BD), 
        .D_EXC_Code(D_EXC_Code), 
        .D_check(D_check),
        

        .E_Instr(E_Instr), 
        .E_PC(E_PC), 
        .E_WD1(E_WD1), 
        .E_WD2(E_WD2), 
        .E_EXTResult(E_EXTResult),
        .E_BD(E_BD), 
        .E_EXC_Code(temp_E_EXC_Code),
        .E_check(E_check)
    );

/* ============================== DE REG ends ============================== */

/* ============================== E begins ============================== */

    Controller ControllerE (
        .Instr(E_Instr), 
        
        .rs(E_rs), 
        .rt(E_rt), 
        .rd(E_rd), 
        .shamt(E_shamt), 
        .Mem2Reg(E_Mem2Reg),
        .ALUControl(E_ALUControl), 
        .ALU_CAL_Ov(E_ALU_CAL_Ov),
        .ALU_DM_Ov(E_ALU_DM_Ov),
        .MDUControl(E_MDUControl),
        .ALUSrc(E_ALUSrc), 
        .RegWrite(E_RegWrite),  
        .RegAddr(E_RegAddr1), 
        .calc_r(E_calc_r), 
        .calc_i(E_calc_i), 
        .load(E_load), 
        .lui(E_lui),
        .md(E_md),
        .mf(E_mf),
        .newbal(E_newbal),
        .newload(E_newload),
        .mfc0(E_mfc0),
        .mtc0(E_mtc0)
    );
    
    // todo branch
    assign E_RegAddr = (E_newbal) ? (E_check ? 5'b11111 : 5'b0) : E_RegAddr1;
    
    MDU MyMDU (
        .clk(clk), 
        .reset(reset), 
        .Req(Req),
        
        .MDUControl(E_MDUControl),
        .SrcA(E_MFRS), 
        .SrcB(E_MFRT), 
        
        .Busy(E_Busy), 
        .HI(E_HI),
        .LO(E_LO)
    );
    
    ALU MyALU (
        .ALU_CAL_Ov(E_ALU_CAL_Ov),
        .ALU_DM_Ov(E_ALU_DM_Ov),

        .SrcA(ALUSrcA), 
        .SrcB(ALUSrcB), 
        .ALUControl(E_ALUControl), 
        .shamt(E_shamt), 

        .ALUResult(E_ALUResult),
        .EXC_CAL_Ov(E_EXC_CAL_Ov),
        .EXC_DM_Ov(E_EXC_DM_Ov)
    );

    assign E_EXC_Code = (temp_E_EXC_Code) ? temp_E_EXC_Code :
                        (E_EXC_CAL_Ov) ? `EXC_Ov :
                        `EXC_None;

/* ============================== E ends ============================== */


/* ============================== EM REG begins ============================== */

    M_REG MyM_REG (
        .clk(clk), 
        .reset(reset), 
        .Req(Req), 

        .E_Instr(E_Instr),
        .E_PC(E_PC), 
        .E_WD2(E_MFRT), 
        .E_ALUResult(E_ALUResult), 
        .E_EXTResult(E_EXTResult), 
        .E_HI(E_HI),
        .E_LO(E_LO),
        .E_BD(E_BD),
        .E_EXC_Code(E_EXC_Code),
        .E_EXC_DM_Ov(E_EXC_DM_Ov),
        .E_check(E_check),
        
        .M_Instr(M_Instr),
        .M_PC(M_PC), 
        .M_WD2(M_WD2), 
        .M_ALUResult(M_ALUResult), 
        .M_EXTResult(M_EXTResult),
        .M_HI(M_HI),
        .M_LO(M_LO),
        .M_BD(M_BD),
        .M_EXC_Code(temp_M_EXC_Code),
        .M_EXC_DM_Ov(M_EXC_DM_Ov),
        .M_check(M_check)
    );
    
/* ============================== EM REG ends ============================== */

/* ============================== M begins ============================== */

    Controller ControllerM (
        .Instr(M_Instr), 
        
        .rs(M_rs), 
        .rt(M_rt), 
        .rd(M_rd), 
        .RegWrite(M_RegWrite),
        .MemWrite(M_MemWrite),
        .Mem2Reg(M_Mem2Reg),
        .RegAddr(M_RegAddr1),
        .store(M_store),
        .load(M_load),
        .BEControl(M_BEControl),
        .DEControl(M_DEControl),
        .newbal(M_newbal),
        .newload(M_newload),
        .mfc0(M_mfc0),
        .mtc0(M_mtc0),
        .eret(M_eret)
    );

    BE MyBE (
        .MemWrite(M_MemWrite & !Req), 

        .Addr(M_ALUResult), 
        .BEControl(M_BEControl), 
        .RTData(M_MFRT), 

        .M_EXC_DM_Ov(M_EXC_DM_Ov), 

        .store(M_store), 


        .m_data_byteen(m_data_byteen), 
        .m_data_wdata(m_data_wdata), 
        .M_EXC_AdES(M_EXC_AdES)
    );

    DE MyDE (
        .Req(Req), 

        .Addr(M_ALUResult),
        .DEControl(M_DEControl),
        .m_data_rdata(m_data_rdata),

        .M_EXC_DM_Ov(M_EXC_DM_Ov),

        .load(M_load),


        .MemReadData(M_MemReadData),
        .M_EXC_AdEL(M_EXC_AdEL)
    );


    CP0 MyCP0(
        .clk(clk),
        .reset(reset),
        .en(M_mtc0),

        .CP0Add(M_rd),
        .CP0In(M_MFRT),
        .CP0Out(M_CP0Result),
        .VPC(M_PC),
        .BDIn(M_BD),
        .ExcCodeIn(M_EXC_Code),
        .HWInt(HWInt),
        .EXLClr(M_eret),

        .EPCOut(EPC),
        .Req(Req),
        .IntResponse(IntResponse),
        .EXL(EXL),
        .CU0(CU0)
    );
    
    assign macroscopic_pc = M_PC;

    // todo branch
    // todo load
    assign M_RegAddr = (M_newbal) ? (M_check ? 5'b11111 : 5'b0) : 
                       (M_newload) ? (M_MemReadData[31:27] >= M_RegAddr1 ? M_MemReadData[31:27] : M_RegAddr1) : 
                       M_RegAddr1;

    // todo privilege
    assign M_EXC_RI = (M_mfc0 | M_mtc0) & !EXL & !CU0;

    assign M_EXC_Code = (temp_M_EXC_Code) ? temp_M_EXC_Code :
                        (M_EXC_AdES) ? `EXC_AdES :
                        (M_EXC_AdEL) ? `EXC_AdEL :
                        // todo privilege
                        (M_EXC_RI)   ? `EXC_RI :
                        `EXC_None;

    assign m_data_addr = M_ALUResult; // todo
    assign m_inst_addr = M_PC;        // todo

/* ============================== M ends ============================== */


    W_REG MyW_REG (
        .clk(clk), 
        .reset(reset), 
        .Req(Req),

        .M_Instr(M_Instr), 
        .M_PC(M_PC), 
        .M_ALUResult(M_ALUResult), 
        .M_EXTResult(M_EXTResult), 
        .M_MemReadData(M_MemReadData), 
        .M_CP0Result(M_CP0Result), 
        .M_HI(M_HI),
        .M_LO(M_LO),
        .M_check(M_check),
        
        .W_Instr(W_Instr), 
        .W_PC(W_PC), 
        .W_ALUResult(W_ALUResult), 
        .W_EXTResult(W_EXTResult), 
        .W_MemReadData(W_MemReadData),
        .W_CP0Result(W_CP0Result),
        .W_HI(W_HI),
        .W_LO(W_LO),
        .W_check(W_check)
    );
    

/* ============================== W begins ============================== */

    Controller ControllerW (
        .Instr(W_Instr), 
        
        .rs(W_rs), 
        .rt(W_rt), 
        .rd(W_rd), 
        .RegWrite(W_RegWrite), 
        .Mem2Reg(W_Mem2Reg), 
        .RegAddr(W_RegAddr1),
        .newbal(W_newbal),
        .newload(W_newload)
    );
    
    // todo branch
    assign W_RegAddr = (W_newbal) ? (W_check ? 5'b11111 : 5'b0) : 
                       (W_newload) ? (W_MemReadData[31:27] >= W_RegAddr1 ? W_MemReadData[31:27] : W_RegAddr1) : 
                       W_RegAddr1;

    assign w_grf_we = W_RegWrite;
    assign w_grf_addr = W_RegAddr;
    assign w_grf_wdata = W_Src;
    assign w_inst_addr = W_PC;

/* ============================== W ends ============================== */

    // todo branch
    assign D_Tuse_RS = (D_beq | D_bne | D_bgtz | D_newbal | D_jr) ? 2'b00 : 
                       (D_calc_r | D_calc_i | D_load | D_store | D_md | D_mt) ? 2'b01 : 
                       2'b11;
    assign D_Tuse_RT = (D_beq | D_bne | D_bgtz | D_newbal | D_slt | D_sltu) ? 2'b00 : 
                       (D_calc_r | D_md) ? 2'b01 : 
                       (D_store | D_mtc0) ? 2'b10 : 
                       2'b11;

    
    assign E_Tnew = (E_calc_r | E_calc_i | E_lui | E_mf) ? 2'b01:
                    (E_load | E_mfc0) ? 2'b10:
                    2'b00;

    assign M_Tnew = (M_load | M_mfc0) ? 2'b01: 2'b00;
    
    // todo load
    // assign E_Stall_RS = (D_Tuse_RS < E_Tnew) & (E_newload ? (D_rs == E_RegAddr | D_rs == 5'b11111) : D_rs == E_RegAddr) & (D_rs != 5'b0) & (E_RegWrite);
    assign E_Stall_RS = (D_Tuse_RS < E_Tnew) & (D_rs == E_RegAddr) & (D_rs != 5'b0) & (E_RegWrite);
    assign M_Stall_RS = (D_Tuse_RS < M_Tnew) & (D_rs == M_RegAddr) & (D_rs != 5'b0) & (M_RegWrite);
    assign Stall_RS = E_Stall_RS | M_Stall_RS;
    
    // todo load
    // assign E_Stall_RT = (D_Tuse_RT < E_Tnew) & (E_newload ? (D_rt == E_RegAddr | D_rt == 5'b11111) : D_rt == E_RegAddr) & (D_rt != 5'b0) & (E_RegWrite);
    assign E_Stall_RT = (D_Tuse_RT < E_Tnew) & (D_rt == E_RegAddr) & (D_rt != 5'b0) & (E_RegWrite);
    assign M_Stall_RT = (D_Tuse_RT < M_Tnew) & (D_rt == M_RegAddr) & (D_rt != 5'b0) & (M_RegWrite);
    assign Stall_RT = E_Stall_RT | M_Stall_RT;
    
    assign E_Start = E_md;
    assign E_Stall_MDU = E_Start | E_Busy & (D_md | D_mf | D_mt);
    assign Stall_MDU = E_Stall_MDU;

    assign M_Stall_eret = (D_eret) & ((E_mtc0 & (E_rd == 5'd14)) | (M_mtc0 & (M_rd == 5'd14)));
    assign Stall_eret = M_Stall_eret;
    
    assign Stall = Stall_RS | Stall_RT | Stall_MDU | Stall_eret;
    
    
    assign en = !Stall;
    assign flush = Stall;
    

    /* ============================== input and output assign ============================== */

    assign E_Src = (E_Mem2Reg == `EXT) ? E_EXTResult : 
                   (E_Mem2Reg == `PC) ? E_PC + 8 : 
                   32'h0000_0000;
    assign M_Src = (M_Mem2Reg == `ALU) ? M_ALUResult : 
                   (M_Mem2Reg == `EXT) ? M_EXTResult : 
                   (M_Mem2Reg == `PC) ? M_PC + 8 : 
                   (M_Mem2Reg == `HI) ? M_HI : 
                   (M_Mem2Reg == `LO) ? M_LO : 
                   32'h0000_0000;
    assign W_Src = (W_Mem2Reg == `ALU) ? W_ALUResult : 
                   (W_Mem2Reg == `DM ) ? W_MemReadData : 
                   (W_Mem2Reg == `EXT) ? W_EXTResult : 
                   (W_Mem2Reg == `PC ) ? W_PC + 8 : 
                   (W_Mem2Reg == `HI ) ? W_HI : 
                   (W_Mem2Reg == `LO ) ? W_LO : 
                   (W_Mem2Reg == `CP0) ? W_CP0Result : 
                   32'h0000_0000;
    
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


endmodule