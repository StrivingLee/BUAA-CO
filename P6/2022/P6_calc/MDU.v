`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:54 12/15/2022 
// Design Name: 
// Module Name:    MDU 
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
module MDU(
    input clk,
    input reset,
    input [3:0] MDUControl,
    input [31:0] SrcA,
    input [31:0] SrcB,
    input Start,
    output reg Busy,
    output reg [31:0] HI,
    output reg [31:0] LO
    );
    
    // reg [31:0] HI, LO;
    reg [31:0] temp_hi, temp_lo;
    reg [3:0] count;
    
    assign mult = (MDUControl == 4'd1);
    assign multu = (MDUControl == 4'd2);
    assign div = (MDUControl == 4'd3);
    assign divu = (MDUControl == 4'd4);
    assign mfhi = (MDUControl == 4'd5);
    assign mflo = (MDUControl == 4'd6);
    assign mthi = (MDUControl == 4'd7);
    assign mtlo = (MDUControl == 4'd8);
    assign fdiv = (MDUControl == 4'd9);
                         
                         
    always @(posedge clk) begin
        if (reset) begin
            count <= 4'b0;
            Busy <= 1'b0;
            HI <= 32'b0;
            LO <= 32'b0;
        end
        else if (count == 4'b0) begin
            case (MDUControl)
                4'd1: begin 
                    Busy <= 1'b1;
                    count <= 4'd5;
                    {temp_hi, temp_lo} <= $signed(SrcA) * $signed(SrcB);
                end
                4'd2: begin
                    Busy <= 1'b1;
                    count <= 4'd5;
                    {temp_hi, temp_lo} <= SrcA * SrcB;
                end
                4'd3: begin
                    Busy <= 1'b1;
                    count <= 4'd10;
                    temp_hi <= $signed(SrcA) % $signed(SrcB);
                    temp_lo <= $signed(SrcA) / $signed(SrcB);
                end
                4'd4: begin
                    Busy <= 1'b1;
                    count <= 4'd10;
                    temp_hi <= SrcA % SrcB;
                    temp_lo <= SrcA / SrcB;
                end
                4'd7: begin
                    HI <= SrcA;
					count <= 4'd0;
                end
                4'd8: begin
                    LO <= SrcA;
					count <= 4'd0;
                end
                4'd9: begin
                    Busy <= 1'b1;
                    count <= 4'd10;
                    temp_hi <= $signed(SrcA) % $signed(SrcB);
                    temp_lo <= $signed(SrcA) / $signed(SrcB);
                end
                default: begin
                end
            endcase
        end
        else if (count == 4'd1) begin
            HI <= temp_hi;
            LO <= temp_lo;
            count <= 4'd0;
            Busy <= 1'b0;
        end
        else count <= count - 4'b1;
    end

endmodule
