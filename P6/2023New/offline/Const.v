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

/* Extend types, used for EXTControl */
`define ZERO  3'b000
`define SIGN  3'b001
`define UPPER 3'b010

/* Store and Load types */
`define WORD  4'd1
`define HALF  4'd2
`define BYTE  4'd3

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

// MDU.v
