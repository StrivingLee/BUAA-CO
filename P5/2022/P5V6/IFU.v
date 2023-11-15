`timescale 1ns / 1ps
module IFU(
    input clk,
    input reset,
    input en,
    input [31:0] NPC,
    output reg [31:0] PC,
    output [31:0] Instr
);

    reg[31:0] ROM [0:4095];
    wire [31:0] PC3000;
    integer i;

    initial begin
        for (i = 0; i < 4096; i = i + 1) begin
            ROM[i] = 32'b0;
        end
        PC = 32'h00003000;
		$readmemh("code.txt", ROM);
    end
    
    assign PC3000 = PC - 32'h00003000;

    always @(posedge clk) begin
        if(reset) PC <= 32'h00003000;
        else if (en) PC <= NPC;
    end

    assign Instr = ROM[PC3000[13:2]];

endmodule