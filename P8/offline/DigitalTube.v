`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    22:30:34 12/06/2023 
//////////////////////////////////////////////////////////////////////////////////

module DigitalTube(
    input wire clk,
    input wire rstn,
    input wire en,
    input wire [15:0] data_in,
    output wire [3:0] sel,
    output wire [7:0] seg
);
    
    reg [15:0] data;
    always @(posedge clk) begin
        if (~rstn) begin
            data <= 0;
        end
        else begin
            if (en) begin
                data <= data_in;
            end
        end
    end


    function [7:0] hex2dig;   // dp = 1
        input [3:0] hex;
        begin
            case (hex)
            4'h0    : hex2dig = 8'b1000_0001;   // not G
            4'h1    : hex2dig = 8'b1100_1111;   // B, C
            4'h2    : hex2dig = 8'b1001_0010;   // not C, F
            4'h3    : hex2dig = 8'b1000_0110;   // not E, F
            4'h4    : hex2dig = 8'b1100_1100;   // not A, D, E
            4'h5    : hex2dig = 8'b1010_0100;   // not B, E
            4'h6    : hex2dig = 8'b1010_0000;   // not B
            4'h7    : hex2dig = 8'b1000_1111;   // A, B, C
            4'h8    : hex2dig = 8'b1000_0000;   // All
            4'h9    : hex2dig = 8'b1000_0100;   // not E
            4'hA    : hex2dig = 8'b1000_1000;   // not D
            4'hB    : hex2dig = 8'b1110_0000;   // not A, B
            4'hC    : hex2dig = 8'b1011_0001;   // A, D, E, F
            4'hD    : hex2dig = 8'b1100_0010;   // not A, F
            4'hE    : hex2dig = 8'b1011_0000;   // not B, C
            4'hF    : hex2dig = 8'b1011_1000;   // A, E, F, G
            default : hex2dig = 8'b1111_1111;
            endcase
        end
    endfunction


    localparam PERIOD = 32'd25_000;
    reg [31:0] counter;
    reg [1:0] select;
    always @(posedge clk) begin
        if (~rstn) begin
            counter <= 0;
            select <= 0;
        end
        else begin
            if (counter + 1 == PERIOD) begin
                counter <= 0;
                select <= select + 1'b1;
            end 
            else begin
                counter <= counter + 1;
            end
        end
    end

    assign sel = (4'b1 << select);

    assign seg = hex2dig(data[select * 4 +: 4]);


endmodule
