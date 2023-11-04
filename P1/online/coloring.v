`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:08:08 10/16/2023 
// Design Name: 
// Module Name:    coloring 
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
module coloring(
    input clk,
    input rst_n,
    input [1:0] color,
    output check
    );

    parameter INIT = 4'b0000, RED = 4'b0001, GREEN = 4'b0010, BLUE = 4'b0100, ERROR = 4'b1000;

    reg[3:0] status;
    reg illegal;
    reg[2:0] cnt;

    initial begin
        status <= INIT;
        illegal <= 1'b0;
        cnt <= 3'b0;
        illegal <= 1'b0;
    end

    // cnt
    /*always @(posedge clk, negedge rst_n) begin
        if (~rst_n) cnt = 0;
        else if (cnt == 3) cnt = 0;
        else begin
            case (status)
                INIT: begin
                    cnt = 1;
                end
                RED: begin
                    if (color == 2'b00) cnt = cnt + 1;
                    else if (color == 2'b01) cnt = cnt;
                    else cnt = 1;
                end
                GREEN: begin
                    if (color == 2'b00) cnt = cnt;
                    else if (color == 2'b01) cnt = cnt + 1;
                    else cnt = 1;
                end
                BLUE: begin
                    if (color == 2'b00) cnt = cnt + 1;
                    else cnt = 1;
                end
            endcase
        end
    end*/

    // illegal
    /*always @(*) begin
        if (cnt == 3) illegal = 1'b1;
        if (illegal == 1) illegal = 1'b1;
    end*/

    always @(posedge clk, negedge rst_n) begin
        if (rst_n == 1'b0) begin
            cnt <= 0;
            status <= INIT;
            illegal <= 0;
        end
        else begin
            case (status)
            INIT: begin
                if (color == 2'b00) begin
                    status <= RED;
                    cnt <= 1;
                    illegal <= 0;
                end
                else if (color == 2'b01) begin
                    status <= GREEN;
                    cnt <= 1;
                    illegal <= 0;
                end
                else if (color == 2'b10) begin
                    status <= BLUE;
                    cnt <= 1;
                    illegal <= 0;
                end
                else begin
                    status <= INIT;
                    cnt <= 0;
                    illegal <= 0;
                end
            end

            RED: begin
                if (color == 2'b00) begin
                    status <= RED;
                    if (cnt == 2) illegal <= 1;
                    else begin
                        cnt <= cnt + 1;
                        illegal <= 0;
                    end
                end
                else if (color == 2'b01) begin // erase
                    status <= RED;
                    illegal <= 1;
                end
                else if (color == 2'b10) begin
                    status <= BLUE;
                    illegal <= 0;
                    cnt <= 1;
                end
                else begin
                    status <= INIT;
                    illegal <= 0;
                    cnt <= 0;
                end
            end

            GREEN: begin
                if (color == 2'b00) begin
                    status <= GREEN;
                    illegal <= 1;
                end
                else if (color == 2'b01) begin
                    status <= GREEN;
                    if (cnt == 2) illegal <= 1;
                    else begin
                        cnt <= cnt + 1;
                        illegal <= 0;
                    end
                end
                else if (color == 2'b10) begin
                    status <= BLUE;
                    illegal <= 0;
                    cnt <= 1;
                end
                else begin
                    status <= INIT;
                    illegal <= 0;
                    cnt <= 0;
                end
            end

            BLUE: begin
                if (color == 2'b00) begin
                    status <= RED;
                    illegal <= 0;
                    cnt <= 1;
                end
                else if (color == 2'b01) begin
                    status <= GREEN;
                    illegal <= 0;
                    cnt <= 1;
                end
                else if (color == 2'b10) begin
                    status <= BLUE;
                    if (cnt == 2) illegal <= 1;
                    else begin
                        cnt <= cnt + 1;
                        illegal <= 0;
                    end
                end
                else begin
                    status <= INIT;
                    illegal <= 0;
                    cnt <= 0;
                end
            end
        endcase
        end
    end

    assign check = illegal;


endmodule
