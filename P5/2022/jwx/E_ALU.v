module E_ALU (
    input [31: 0] NUM1,
    input [31: 0] NUM2,
    input [2: 0] ALUop,
    output [31: 0] ALUout
);
    
    assign ALUout = (ALUop == 3'd0) ? (NUM1 + NUM2) :
                    (ALUop == 3'd1) ? (NUM1 - NUM2) :
                    (ALUop == 3'd2) ? (NUM1 | NUM2) : 3'd3;

endmodule