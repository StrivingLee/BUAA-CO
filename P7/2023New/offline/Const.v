/* NPC types, used for NPCControl */
`define BRANCH 3'b001
`define JUMP   3'b010
`define REGRS  3'b011
`define INCRE  3'b000

/* ALU types, used for ALUControl */
`define ADD   3'b000
`define SUB   3'b001
`define AND   3'b010
`define OR    3'b011
`define XOR   3'b100
`define SLL   3'b101
`define SLT   3'b110
`define SLTU  3'b111

/* Module types, used for Mem2Reg */
`define ALU   3'b000
`define DM    3'b001
`define EXT   3'b010
`define PC    3'b011
`define HI    3'b100
`define LO    3'b101
`define CP0   3'b110

/* Extend types, used for EXTControl */
`define ZERO  3'b000
`define SIGN  3'b001
`define UPPER 3'b010

/* Store and Load Instruction types */
`define LW    2'b00
`define LH    2'b01
`define LB    2'b10
`define SW    2'b00
`define SH    2'b01
`define SB    2'b10

/* Store and Load types */
`define WORD  3'd1
`define HALF  3'd2
`define BYTE  3'd3

/* Multiply and Division types */
`define MULT  4'd1
`define MULTU 4'd2
`define DIV   4'd3
`define DIVU  4'd4
`define MFHI  4'd5
`define MFLO  4'd6
`define MTHI  4'd7
`define MTLO  4'd8
// new
`define MADD  4'd9
`define MADDU 4'd10
`define MSUB  4'd11
`define MSUBU 4'd12

/* Exception code */
`define EXC_Int  5'd0
`define EXC_AdEL 5'd4
`define EXC_AdES 5'd5
`define EXC_Sys  5'd8
`define EXC_RI   5'd10
`define EXC_Ov   5'd12
`define EXC_None 5'd0 

/* CP0 wires */
`define  IM       SR[15:10]    // Interrupt Mask
`define  EXL      SR[1]        // Exception Level
`define  IE       SR[0]        // Interrupt Enable
`define  BD       Cause[31]    // Branch Delay
`define  IP       Cause[15:10] // Interrupt Pending
`define  ExcCode  Cause[6:2]

/* Address of Devices */
`define DMStartAddr       32'h0000_0000
`define DMEndAddr         32'h0000_2fff
`define TC0StartAddr      32'h0000_7f00
`define TC0CountStartAddr 32'h0000_7f08
`define TC0EndAddr        32'h0000_7f0b
`define TC1StartAddr      32'h0000_7f10
`define TC1CountStartAddr 32'h0000_7f18
`define TC1EndAddr        32'h0000_7f1b
`define IntStartAddr      32'h0000_7f20
`define IntEndAddr        32'h0000_7f23

// Controller.v
/* parameter ADD = 3'b000, SUB = 3'b001, AND = 3'b010, OR = 3'b011, XOR = 3'b100, SLL = 3'b101, SLT = 3'b110, SLTU = 3'b111;
parameter ALU = 3'b000, DM = 3'b001, EXT = 3'b010, PC = 3'b011, HI = 3'b100, LO = 3'b101;
parameter SW = 4'd1, SH = 4'd2, SB = 4'd3;
parameter LW = 4'd1, LH = 4'd2, LB = 4'd3; */

// mips.v
/* parameter SW = 4'd1, SH = 4'd2, SB = 4'd3;
    parameter LW = 4'd1, LH = 4'd2, LB = 4'd3; */

// ALU.v
// parameter ADD = 3'b000, SUB = 3'b001, AND = 3'b010, OR = 3'b011, XOR = 3'b100, SLL = 3'b101, SLT = 3'b110, SLTU = 3'b111;
