`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:22:13 12/05/2022 
// Design Name: 
// Module Name:    HazardUnit 
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
module HazardUnit(
    input [31:0] D_Instr,
    input [31:0] E_Instr,
    input [31:0] M_Instr,
    input [31:0] W_Instr,
    output en,
    output clr
    );
    
    wire [4:0] D_rs, D_rt;
    wire D_calc_r, D_calc_i, D_beq, D_bgtz, D_jr, D_load, D_store;
   
    Controller D_C (
    .Instr(D_Instr), 
    .rs(D_rs), 
    .rt(D_rt),  
    .calc_r(D_calc_r), 
    .calc_i(D_calc_i), 
    .beq(D_beq),
    .bgtz(D_bgtz),
    .jr(D_jr),
    .load(D_load), 
    .store(D_store)
    );
    
    wire [1:0] Tuse_RS, Tuse_RT;
    assign Tuse_RS = (D_beq | D_jr | D_bgtz) ? 2'b00 : 
                     (D_calc_r | D_calc_i | D_load | D_store) ? 2'b01 : 
                     2'b11;
    assign Tuse_RT = (D_beq | D_bgtz) ? 2'b00 : 
                     (D_calc_r) ? 2'b01 : 
                     (D_store) ? 2'b10 : 
                     2'b11;
                     
					
	wire [4:0] E_RegAddr;		
    wire E_calc_r, E_calc_i, E_load, E_lui, E_lwtbi, E_RegWrite;
	wire [1:0] E_Tnew;
    
	Controller E_C (
    .Instr(E_Instr), 
    .RegWrite(E_RegWrite),  
    .RegAddr(E_RegAddr1), 
    .rt(E_rt),
    .calc_r(E_calc_r), 
    .calc_i(E_calc_i), 
    .load(E_load), 
    .lui(E_lui),
    .lwtbi(E_lwtbi)
    );						

    assign E_Tnew = (E_calc_r | E_calc_i | E_lui) ? 2'b01:
                    (E_load) ? 2'b10:
                    2'b00;
                    
                    
	wire [4:0] M_RegAddr;
    wire M_RegWrite, M_load;	
    wire [1:0] M_Tnew;
    
    Controller M_C(
    .Instr(M_Instr), 
    .RegWrite(M_WE), 
    .RegAddr(M_RegAddr1), 
    .lwtbi(M_lwtbi),
    .rt(M_rt),
    .load(M_load)
    );	

 assign E_RegAddr  = E_RegAddr1; 
    assign M_RegAddr = M_RegAddr1; 
    assign W_RegAddr = W_lwtbi ? ((W_MemReadData[0] === 1'b1) ? 5'b11111 : W_RegAddr1) : W_RegAddr1; 

    assign M_Tnew = M_load ? 2'b01: 2'b00;
    
    
    assign Stall_RS_E = (Tuse_RS < E_Tnew) & (D_rs != 5'b0) & (E_RegWrite) & (E_lwtbi ? (D_rs == 5'b11111| D_rs == E_rt) : D_rs == E_RegAddr);
    assign Stall_RS_M = (Tuse_RS < M_Tnew) & (D_rs != 5'b0) & (M_RegWrite) & (M_lwtbi ? (D_rs == 5'b11111| D_rs == M_rt) : D_rs == M_RegAddr);
    assign Stall_RS = Stall_RS_E | Stall_RS_M;
    
    assign Stall_RT_E = (Tuse_RT < E_Tnew) & (D_rt != 5'b0) & (E_RegWrite) & (E_lwtbi ? (D_rt == 5'b11111| D_rt == E_rt) : D_rt == E_RegAddr);
    assign Stall_RT_M = (Tuse_RT < M_Tnew) & (D_rt != 5'b0) & (M_RegWrite) & (M_lwtbi ? (D_rt == 5'b11111| D_rt == M_rt) : D_rt == M_RegAddr);
    assign Stall_RT = Stall_RT_E | Stall_RT_M;
    
    assign Stall = Stall_RS | Stall_RT;
    
    assign en = !Stall;
    assign clr = Stall;
    
    ////////////////////////////////////////////////////////////////////////////Hazard Unit////////////////////////////////////////////////////////////////////////////
    // Tuse is static, Tnew is dynamic
    // Tuse is the time when the instruction enters the D_REG
    // Tnew is the time when the instruction enters the E_REG generate the result.
    // Compare the Tuse with Tnew in E\M\W
    // When Tnew decrements to 0, it maintains 0
    
    // Describe Tnew and Tuse firstly, then describe Stall_RS_E1

endmodule
