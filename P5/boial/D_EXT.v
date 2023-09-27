module D_EXT (
    input [15: 0]imm,
    input [1: 0]EXTop,
    output [31: 0]EXTout
);

    assign EXTout = (EXTop == 2) ? {imm, 16'b0} :
                    (EXTop == 1) ? {{16{imm[15]}}, imm} :
                    (EXTop == 0) ? {16'b0, imm} :
                    0;
    
endmodule