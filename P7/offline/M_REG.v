`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    18:50:05 12/02/2022 
//////////////////////////////////////////////////////////////////////////////////

module M_REG(
    input        clk,
    input        reset,
    input        Req,

    input [31:0] E_Instr,
    input [31:0] E_PC,
    input [31:0] E_WD2,
    input [31:0] E_ALUResult,
    input [31:0] E_EXTResult,
    input [31:0] E_HI,
    input [31:0] E_LO,
    input        E_BD,
    input [4 :0] E_EXC_Code,
    input        E_EXC_DM_Ov,
    input        E_check,
    
    output reg [31:0] M_Instr,
    output reg [31:0] M_PC,
    output reg [31:0] M_WD2,
    output reg [31:0] M_ALUResult,
    output reg [31:0] M_EXTResult,
    output reg [31:0] M_HI,
    output reg [31:0] M_LO,
    output reg        M_BD,
    output reg [4 :0] M_EXC_Code,
    output reg        M_EXC_DM_Ov,
    output reg        M_check
    );
    

    initial begin
        M_Instr     = 32'b0;
        M_PC        = 32'h0000_3000;
        M_WD2       = 32'b0;
        M_ALUResult = 32'b0;
        M_EXTResult = 32'b0;
        M_HI        = 32'b0;
        M_LO        = 32'b0;
        M_BD        = 1'b0;
        M_EXC_Code  = 5'b0;
        M_EXC_DM_Ov = 1'b0;
        M_check     = 1'b0;
    end


    always @(posedge clk) begin
        if (reset | Req) begin
            M_Instr     <= 32'b0;
            M_PC        <= (Req) ? 32'h0000_4180 : 32'h0000_3000;
            M_WD2       <= 32'b0;
            M_ALUResult <= 32'b0;
            M_EXTResult <= 32'b0;
            M_HI        <= 32'b0;
            M_LO        <= 32'b0;
            M_BD        <= 1'b0;
            M_EXC_Code  <= 5'b0;
            M_EXC_DM_Ov <= 1'b0;
            M_check     <= 1'b0;
        end
        else begin
            M_Instr     <= E_Instr;
            M_PC        <= E_PC;
            M_WD2       <= E_WD2;
            M_ALUResult <= E_ALUResult;
            M_EXTResult <= E_EXTResult;
            M_HI        <= E_HI;
            M_LO        <= E_LO;
            M_BD        <= E_BD;
            M_EXC_Code  <= E_EXC_Code;
            M_EXC_DM_Ov <= E_EXC_DM_Ov;
            M_check     <= E_check;
        end
    end
    


endmodule
