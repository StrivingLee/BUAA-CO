`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    18:23:11 12/02/2022 
//////////////////////////////////////////////////////////////////////////////////

module D_REG(
    input        clk,
    input        reset,
    input        en,
    input        Req,

    input [31:0] F_PC,
    input [31:0] F_Instr,
    input        F_BD,
    input [4 :0] F_EXC_Code,

    output reg [31:0] D_PC,
    output reg [31:0] D_Instr,
    output reg        D_BD,
    output reg [4 :0] D_EXC_Code
    );
    
    initial begin
        D_PC       = 32'h0000_3000;
		D_Instr    = 32'h0000_0000;
        D_BD       = 1'b0;
        D_EXC_Code = 5'b0;
    end
    
    always @(posedge clk) begin
        if (reset | Req) begin
            D_PC       <= (Req) ? 32'h0000_4180 : 32'h0000_3000;
            D_Instr    <= 32'h0000_0000;
            D_BD       <= 1'b0;
            D_EXC_Code <= 5'b0;
        end
        else if (en) begin
            D_PC       <= F_PC;
            D_Instr    <= F_Instr;
            D_BD       <= F_BD;
            D_EXC_Code <= F_EXC_Code;
        end
    end

endmodule
