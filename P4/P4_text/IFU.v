`timescale 1ns / 1ps
module IFU(
    input clk,
    input reset,
    input [2:0] NPCControl,
    input [31:0] NPC,
    output reg [31:0] PC,
    output [31:0] Instr
);
    reg[31:0] ROM [0:1023];
    integer i;

    initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            ROM[i] = 32'b0;
        end
        PC = 32'h00003000;
		$readmemh("code.txt", ROM);
    end

    always @(posedge clk) begin
        if(reset) PC <= 32'h00003000;
        else PC <= NPC;
    end

    assign Instr = ROM[PC[11:2]];

endmodule