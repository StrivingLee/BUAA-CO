`timescale 1ns / 1ps
module IFU(
    input clk,
    input reset,
    input Req,
    input en,

    input [31:0] NPC,

    
    output reg [31:0] PC
);
    initial begin
        PC = 32'h0000_3000;
    end

    always @(posedge clk) begin
        if(reset) PC <= 32'h0000_3000;
        else if (en | Req) PC <= NPC; // 如果Req，跳转至4180，故也是写入NPC
    end

endmodule