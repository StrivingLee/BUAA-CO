`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    18:32:27 12/02/2022 
//////////////////////////////////////////////////////////////////////////////////

module E_REG(
    input clk,
    input reset,
    input flush,
    input Req,

    input [31:0] D_Instr,
    input [31:0] D_PC,
    input [31:0] D_WD1,
    input [31:0] D_WD2,
    input [31:0] D_EXTResult,
    input        D_BD,
    input [4 :0] D_EXC_Code,
    input        D_check,
    
    output reg [31:0] E_Instr,
    output reg [31:0] E_PC,
    output reg [31:0] E_WD1,
    output reg [31:0] E_WD2,
    output reg [31:0] E_EXTResult,
    output reg        E_BD,
    output reg [4 :0] E_EXC_Code,
    output reg        E_check
    );
    
    initial begin
        E_Instr     = 32'b0;
        E_PC        = 32'h0000_3000;
        E_WD1       = 32'b0;
        E_WD2       = 32'b0;
        E_EXTResult = 32'b0;
        E_BD        = 1'b0;
        E_EXC_Code  = 5'b0;
        E_check     = 1'b0;
    end
    
    always @(posedge clk) begin
        if (reset | flush | Req) begin
            E_Instr     <= 32'b0;
            E_PC        <= (reset) ? 32'h0000_3000 :
                           (Req) ? 32'h0000_4180 : 
                           (flush) ? D_PC :
                           32'h0000_3000; // priority!!!!
            E_WD1       <= 32'b0;
            E_WD2       <= 32'b0;
            E_EXTResult <= 32'b0;
            E_BD        <= (flush) ? D_BD : 1'b0;
            E_EXC_Code  <= 5'b0;
            E_check     <= 1'b0;
        end
        else begin
            E_Instr     <= D_Instr;
            E_PC        <= D_PC;
            E_WD1       <= D_WD1;
            E_WD2       <= D_WD2;
            E_EXTResult <= D_EXTResult;
            E_BD        <= D_BD;
            E_EXC_Code  <= D_EXC_Code;
            E_check     <= D_check;
        end
    end

endmodule
