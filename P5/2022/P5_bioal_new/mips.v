`timescale 1ns / 1ps
module mips(
    input clk,
    input reset
);
    
    // The wire F needs
    wire Nullify;
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
    // wire [4:0] D_RegAddr;
    wire D_RegWrite;
    wire D_MemWrite;
    wire D_calc_r, D_calc_i, D_beq, D_bgtz, D_bioal, D_jal, D_jr, D_load, D_store;
    
    
    // The wire ControllerE needs
    wire [31:0] E_Instr;
    wire [31:0] E_PC;
    wire [4:0] E_rs;
    wire [4:0] E_rt;
    wire [4:0] E_rd;
    wire [4:0] E_shamt;
    wire E_ALUSrc;
    wire [2:0] E_ALUControl;
    wire E_RegWrite;
    wire [2:0] E_Mem2Reg;
    wire [4:0] E_RegAddr1;
    wire [4:0] E_RegAddr;
    wire E_calc_r, E_calc_i, E_bioal, E_load, E_lui;
    
    
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
    wire M_bioal, M_load;
    
    
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
    wire W_bioal;
    
    
    // The wire NPC needs
    wire [31:0] NPC;
    
    
    // The wire CMP needs
    wire [31:0] CMPSrcA;
    wire [31:0] CMPSrcB;
    wire Zero;
    wire GreaterZero;
    wire LessZero;
    wire D_flag;


    // The wire GRF needs
    wire [31:0] D_RD1;
    wire [31:0] D_RD2;
    
    
    // The wire E_REG needs
    wire D_check;
    wire [31:0] D_WD1;
    wire [31:0] D_WD2;
    wire [31:0] D_EXTResult;
    wire E_check;
    wire [31:0] E_WD1;
    wire [31:0] E_WD2;
    wire [31:0] E_EXTResult;


    // The wire ALU needs
    wire [31:0] ALUSrcA;
    wire [31:0] ALUSrcB;
    wire [31:0] E_ALUResult;
    
    
    // The wire M_REG needs
    wire M_check;
    wire [31:0] M_WD2;
    wire [31:0] M_ALUResult;
    wire [31:0] M_EXTResult;
    
    
    // The wire DM needs
    wire [31:0] M_MemReadData;
    wire [31:0] M_ReadByteData;
    
    
    // The wire W_REG needs
    wire W_check;
    wire [31:0] W_ALUResult;
    wire [31:0] W_EXTResult;
    wire [31:0] W_MemReadData;
    wire [31:0] W_ReadByteData;
    
    
    // The wire Forward and Stall needs
    wire [31:0] E_Src, M_Src, W_Src;
    wire [31:0] D_MFRS;
    wire [31:0] D_MFRT;
    wire [31:0] E_MFRS;
    wire [31:0] E_MFRT;
    wire [31:0] M_MFRT;
    

    IFU MyIFU (
    .clk(clk), 
    .reset(reset), 
    .en(en),
    .Nullify(Nullify),
    .NPC(NPC), 
    
    .PC(F_PC), 
    .Instr(F_Instr)
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
    // .RegAddr(D_RegAddr),
    
    
    .calc_r(D_calc_r), 
    .calc_i(D_calc_i), 
    .beq(D_beq),
    .bgtz(D_bgtz),
    .bioal(D_bioal), 
    .jal(D_jal),
    .jr(D_jr),
    .load(D_load), 
    .store(D_store)
    );
    
    
    CMP MyCMP (
    .SrcA(D_MFRS), 
    .SrcB(D_MFRT), 
    .Zero(Zero), 
    .GreaterZero(GreaterZero), 
    .LessZero(LessZero),
    .check(D_flag)
    );
    
    assign D_check = D_flag & D_bioal;
    assign Nullify = ~D_flag & D_bioal;
    
    
    NPC MyNPC (
    .Zero(Zero), 
    .GreaterZero(GreaterZero), 
    .check(D_check),
    .beq(D_beq), 
    .bgtz(D_bgtz),
    .bioal(D_bioal), 
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
    .D_check(D_check),
    .D_WD1(D_MFRS), 
    .D_WD2(D_MFRT), 
    .D_EXTResult(D_EXTResult), 
    
    .E_Instr(E_Instr), 
    .E_PC(E_PC), 
    .E_check(E_check), 
    .E_WD1(E_WD1), 
    .E_WD2(E_WD2), 
    .E_EXTResult(E_EXTResult)
    );
    
    
    Controller ControllerE (
    .Instr(E_Instr), 
    
    .rs(E_rs), 
    .rt(E_rt), 
    .rd(E_rd), 
    .shamt(E_shamt), 
    .Mem2Reg(E_Mem2Reg),
    .ALUControl(E_ALUControl), 
    .ALUSrc(E_ALUSrc), 
    .RegWrite(E_RegWrite),  
    .RegAddr(E_RegAddr1), 
    .bioal(E_bioal), 
    .calc_r(E_calc_r), 
    .calc_i(E_calc_i), 
    .load(E_load), 
    .lui(E_lui)
    );
    
    assign E_RegAddr = (E_bioal) ? (E_check ? 5'b11111 : 5'b0) : E_RegAddr1;
    
    
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
    .E_check(E_check), 
    .E_WD2(E_MFRT), 
    .E_ALUResult(E_ALUResult), 
    .E_EXTResult(E_EXTResult), 
    .M_Instr(M_Instr),
    .M_PC(M_PC), 
    .M_check(M_check), 
    .M_WD2(M_WD2), 
    .M_ALUResult(M_ALUResult), 
    .M_EXTResult(M_EXTResult)
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
    .bioal(M_bioal), 
    .load(M_load)
    );
    
    assign M_RegAddr = (M_bioal) ? (M_check ? 5'b11111 : 5'b0) : M_RegAddr1;
    
    
    DM MyDM (
    .clk(clk), 
    .reset(reset), 
    .MemWrite(M_MemWrite), 
    .PC(M_PC), 
    .MemAddr(M_ALUResult), 
    .MemData(M_MFRT), 
    .MemReadData(M_MemReadData), 
    .ReadByteData(M_ReadByteData)
    );
    
    
    W_REG MyW_REG (
    .clk(clk), 
    .reset(reset), 
    .M_Instr(M_Instr), 
    .M_PC(M_PC), 
    .M_check(M_check), 
    .M_ALUResult(M_ALUResult), 
    .M_EXTResult(M_EXTResult), 
    .M_MemReadData(M_MemReadData), 
    .M_ReadByteData(M_ReadByteData), 
    
    .W_Instr(W_Instr), 
    .W_PC(W_PC), 
    .W_check(W_check), 
    .W_ALUResult(W_ALUResult), 
    .W_EXTResult(W_EXTResult), 
    .W_MemReadData(W_MemReadData),
    .W_ReadByteData(W_ReadByteData)
    );
    
    
    Controller ControllerW (
    .Instr(W_Instr), 
    
    .rs(W_rs), 
    .rt(W_rt), 
    .rd(W_rd), 
    .RegWrite(W_RegWrite), 
    .Mem2Reg(W_Mem2Reg), 
    .RegAddr(W_RegAddr1),
    .bioal(W_bioal)
    );
    
    assign W_RegAddr = (W_bioal) ? (W_check ? 5'b11111 : 5'b0) : W_RegAddr1;
    
    
    wire [1:0] Tuse_RS, Tuse_RT;
    assign Tuse_RS = (D_beq | D_jr | D_bgtz) ? 2'b00 : 
                     (D_calc_r | D_calc_i | D_load | D_store) ? 2'b01 : 
                     2'b11;
    assign Tuse_RT = (D_beq | D_bgtz) ? 2'b00 : 
                     (D_calc_r) ? 2'b01 : 
                     (D_store) ? 2'b10 : 
                     2'b11;


	wire [1:0] E_Tnew;
    assign E_Tnew = (E_calc_r | E_calc_i | E_lui) ? 2'b01:
                    (E_load) ? 2'b10:
                    2'b00;
                    

    wire [1:0] M_Tnew;
    assign M_Tnew = M_load ? 2'b01: 2'b00;
    
    
    wire Stall_RS_E, Stall_RS_M, Stall_RS;
    assign Stall_RS_E = (Tuse_RS < E_Tnew) & (D_rs == E_RegAddr) & (D_rs != 5'b0) & (E_RegWrite);
    assign Stall_RS_M = (Tuse_RS < M_Tnew) & (D_rs == M_RegAddr) & (D_rs != 5'b0) & (M_RegWrite);
    assign Stall_RS = Stall_RS_E | Stall_RS_M;
    
    wire Stall_RT_E, Stall_RT_M, Stall_RT;
    assign Stall_RT_E = (Tuse_RT < E_Tnew) & (D_rt == E_RegAddr) & (D_rt != 5'b0) & (E_RegWrite);
    assign Stall_RT_M = (Tuse_RT < M_Tnew) & (D_rt == M_RegAddr) & (D_rt != 5'b0) & (M_RegWrite);
    assign Stall_RT = Stall_RT_E | Stall_RT_M;
    
    wire Stall;
    assign Stall = Stall_RS | Stall_RT;
    
    wire en, clr;
    assign en = !Stall;
    assign clr = Stall;
    
    
    
    assign E_Src = (E_Mem2Reg == 3'b010) ? E_EXTResult : 
                   (E_Mem2Reg == 3'b011) ? E_PC + 8 : 
                   32'h00114514;
    assign M_Src = (M_Mem2Reg == 3'b000) ? M_ALUResult : 
                   (M_Mem2Reg == 3'b010) ? M_EXTResult : 
                   (M_Mem2Reg == 3'b011) ? M_PC + 8 : 
                   32'h01919810;
    assign W_Src = (W_Mem2Reg == 3'b000) ? W_ALUResult : 
                   (W_Mem2Reg == 3'b001) ? W_MemReadData : 
                   (W_Mem2Reg == 3'b010) ? W_EXTResult : 
                   (W_Mem2Reg == 3'b011) ? W_PC + 8 : 
                   32'h19260817;
    
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