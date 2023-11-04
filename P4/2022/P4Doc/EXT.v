`timescale 1ns / 1ps
module EXT(
    input [15:0] Imm16,
    input [1:0] EXTControl,
    output [31:0] EXTResult
);
    assign EXTResult = (EXTControl == 2'b00) ? {16'b0, Imm16} :
                       (EXTControl == 2'b01) ? {{16{Imm16[15]}}, Imm16} :
                       (EXTControl == 2'b10) ? {Imm16, 16'b0} :
                       32'b0;

endmodule