`timescale 1ns / 1ps
module GRF(
    input clk,
    input reset,
    input RegWrite,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] RegAddr,
    input [31:0] RegData,
    input [31:0] PC,
    output [4:0] RD1,
    output [4:0] RD2
);
    reg [31:0] GPR[0:31];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            GPR[i] <= 32'b0;
        end
    end

    assign RD1 = GPR[A1];
    assign RD2 = GPR[A2];

    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                GPR[i] <= 32'b0;
            end
        end
        else if (RegWrite && RegAddr != 5'b0) begin
            GPR[RegAddr] <= RegData;
            $display("@%h: $%d <= %h", PC, RegAddr, RegData);
        end
    end

endmodule