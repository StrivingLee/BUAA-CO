`timescale 1ns / 1ps
`include "Const.v"

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    17:16:41 11/22/2023 
//////////////////////////////////////////////////////////////////////////////////

module CP0(
    input        clk,
    input        reset,
    input        en,
    
    input [4 :0] CP0Add,    // 寄存器地址
    input [31:0] CP0In,
    input [31:0] VPC,       // 受害 PC
    input        BDIn,      // 是否是延迟槽指令
    input [4 :0] ExcCodeIn, // 记录异常类型
    input [5 :0] HWInt,     // 输入中断信号
    input        EXLClr,    // 用来复位 EXL
	
    
	output [31:0] CP0Out,
    output [31:0] EPCOut,
    output        Req,      // 进入处理程序请求
    output        IntResponse,
    // todo privilege
    output        EXL,
    output        CU0
    );

    // todo privilege
    assign EXL = `EXL;
    assign CU0 = `CU0;

    // wire [31:0] temp_EPC = (Req) ? (BDIn ? (VPC-32'd4) : VPC) : EPC;
    reg [31:0] SR, Cause, EPC;
    // assign EPCOut = temp_EPC;
    assign EPCOut = EPC;

    initial begin
        SR = 32'b0;
        Cause = 32'b0;
        EPC = 32'b0;
    end

    wire IntReq = `IE & !`EXL & (|(HWInt & `IM)); // 中断使能开，不在中断中，允许当前中断
    wire ExcReq = (|ExcCodeIn) & !`EXL; // 存在异常，且不在中断中
    assign Req = IntReq | ExcReq;
    
    assign IntResponse = !`EXL & `IE & (HWInt[2] & SR[12]);

    always@(posedge clk) begin
        if (reset) begin
            // todo privilege, change SR init value
            SR <= 32'b0;
            Cause <= 32'b0;
            EPC <= 32'b0;
        end
        else begin
            `IP <= HWInt; // update HWInt
            if (EXLClr) `EXL <= 1'b0;
            if (Req) begin
                EPC <= (BDIn) ? VPC-32'd4 : VPC;
                // EPC <= temp_EPC;
                `BD <= BDIn; // update BD
                `ExcCode <= (IntReq) ? 5'b0 : ExcCodeIn; // interrupt > exception
                `EXL <= 1'b1; // set EXL
            end
            else if (en) begin
                case (CP0Add)
                    5'd12: SR <= CP0In;
                    5'd14: EPC <= CP0In;
                endcase
            end
        end
    end

    assign CP0Out = ((CP0Add == 5'd12) & ( en)) ? CP0In :
                    ((CP0Add == 5'd13) & ( en)) ? CP0In :
                    ((CP0Add == 5'd14) & ( en)) ? CP0In :
                    ((CP0Add == 5'd12) & (!en)) ? SR :
                    ((CP0Add == 5'd13) & (!en)) ? Cause :
                    ((CP0Add == 5'd14) & (!en)) ? EPC :
                    32'b0; // todo copy check

endmodule
