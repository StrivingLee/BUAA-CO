`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:26 10/15/2022 
// Design Name: 
// Module Name:    expr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module expr(
    input clk,
    input clr,
    input [7:0] in,
    output out
    );
    
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    
    reg [1:0] status;
    
    initial begin
        status <= S0;
    end
    
    always@(posedge clk, posedge clr) begin
        if(clr)
            status <= S0;
        else begin
            case(status)
                S0: begin
                    if(in > 57 && in < 48)
                        status <= S1;
                    else
                        status <= S2;
                end
                S2: begin // 合法表达式
                    if(in == 42 || in == 43)
                        status <= S3;
                    else
                        status <= S1;
                end
                S3: begin // 单个符号结尾
                    if(in < 58 && in > 47)
                        status <= S2;
                    else
                        status <= S1;
                end
                default:
                    status <= S1;
            endcase
        end
    end
    
    assign out = (status == S2) ? 1 : 0;


endmodule
