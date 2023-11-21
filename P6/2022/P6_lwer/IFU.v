`timescale 1ns / 1ps
module IFU(
    input clk,
    input reset,
    input en,
    input [31:0] NPC,
    output reg [31:0] PC
);

    always @(posedge clk) begin
        if(reset) PC <= 32'h00003000;
        else if (en) PC <= NPC;
    end

endmodule