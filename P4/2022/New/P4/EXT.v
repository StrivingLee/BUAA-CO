`timescale 1ns / 1ps
module EXT(
    input [15:0] Imm16,
    input [2:0] EXTControl,
    output [31:0] EXTResult
);
    assign EXTResult = (EXTControl == 3'b000) ? {16'b0, Imm16} :
                       (EXTControl == 3'b001) ? {{16{Imm16[15]}}, Imm16} :
                       (EXTControl == 3'b010) ? {Imm16, 16'b0} :
                       32'b0;

endmodule