`timescale 1ns / 1ps
`include "Const.v"
`include "MulDivUnit.v"

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    18:58:54 12/15/2022 
//////////////////////////////////////////////////////////////////////////////////

module MDU(
    input        clk,
    input        reset,
    input        Req,

    input [3 :0] MDUControl,
    input [31:0] SrcA,
    input [31:0] SrcB,


    output reg Busy,
    output reg [31:0] HI,
    output reg [31:0] LO
    );
    
    // reg [31:0] HI, LO;
    reg [31:0] temp_hi, temp_lo;
    reg [3 :0] count;

    always @(posedge clk) begin
        if (reset) begin
            count <= 4'b0;
            Busy <= 1'b0;
            HI <= 32'b0;
            LO <= 32'b0;
        end
        else if (!Req) begin
            if (count == 5'b0) begin
                case (MDUControl)
                    `MULT: begin 
                        Busy <= 1'b1;
                        count <= 4'd5;
                        {temp_hi, temp_lo} <= $signed(SrcA) * $signed(SrcB);
                    end
                    `MULTU: begin
                        Busy <= 1'b1;
                        count <= 4'd5;
                        {temp_hi, temp_lo} <= SrcA * SrcB;
                    end
                    `DIV: begin
                        Busy <= 1'b1;
                        count <= 4'd10;
                        temp_hi <= $signed(SrcA) % $signed(SrcB);
                        temp_lo <= $signed(SrcA) / $signed(SrcB);
                    end
                    `DIVU: begin
                        Busy <= 1'b1;
                        count <= 4'd10;
                        temp_hi <= SrcA % SrcB;
                        temp_lo <= SrcA / SrcB;
                    end
                    `MTHI: begin
                        HI <= SrcA;
                        count <= 4'd0;
                    end
                    `MTLO: begin
                        LO <= SrcA;
                        count <= 4'd0;
                    end
                    // todo mdu
                    `MADD: begin
                        Busy <= 1'b1;
                        count <= 4'd5;
                        {temp_hi, temp_lo} <= {HI, LO} + $signed($signed(64'd0) + $signed(SrcA) * $signed(SrcB));
                        // {temp_hi, temp_lo} <= $sigend({HI, LO}) + $signed(SrcA) * $signed(SrcB);
                    end
                    `MADDU: begin
                        Busy <= 1'b1;
                        count <= 4'd5;
                        {temp_hi, temp_lo} <= {HI, LO} + SrcA * SrcB;
                    end
                    `MSUB: begin
                        Busy <= 1'b1;
                        count <= 4'd5;
                        {temp_hi, temp_lo} <= {HI, LO} - $signed($signed(64'd0) + $signed(SrcA) * $signed(SrcB));
                        // {temp_hi, temp_lo} <= $sigend({HI, LO}) - $signed(SrcA) * $signed(SrcB);
                    end
                    `MSUBU: begin
                        Busy <= 1'b1;
                        count <= 4'd5;
                        {temp_hi, temp_lo} <= {HI, LO} - SrcA * SrcB;
                    end
                endcase
            end
            else if (count == 4'b1) begin
                HI <= temp_hi;
                LO <= temp_lo;
                count <= 4'b0;
                Busy <= 1'b0;
            end
            else count <= count - 4'b1;
        end
    end

endmodule
