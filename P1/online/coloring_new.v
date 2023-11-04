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

    reg[3:0] state, next_state;
    integer count = 0;

    initial begin
        state <= INIT;
        next_state <= INIT;
    end

    // combinational logic
    always @(*) begin
        case (state)
            INIT: begin
                if (color == 2'b00) next_state = RED;
                else if (color == 2'b01) next_state = GREEN;
                else if (color == 2'b10) next_state = BLUE;
                else next_state = INIT;
            end

            RED: begin
                if (color == 2'b00) begin
                    if (count == 2) next_state = ERROR;
                end
                else if (color == 2'b01) begin // erase
                    next_state = ERROR;
                end
                else if (color == 2'b10) begin
                    next_state = BLUE;
                end
                else begin
                    next_state = INIT;
                end
            end

            GREEN: begin
                if (color == 2'b00) begin
                    next_state = ERROR;
                end
                else if (color == 2'b01) begin
                    if (count == 2) next_state = ERROR;
                end
                else if (color == 2'b10) begin
                    next_state = BLUE;
                end
                else begin
                    next_state = INIT;
                end
            end

            BLUE: begin
                if (color == 2'b00) begin
                    next_state = RED;
                end
                else if (color == 2'b01) begin
                    next_state = GREEN;
                end
                else if (color == 2'b10) begin
                    if (count == 2) next_state = ERROR;
                end
                else begin
                    next_state = INIT;
                end
            end

            ERROR: begin
                if (color == 2'b00) begin
                    next_state = RED;
                end
                else if (color == 2'b01) begin
                    next_state = GREEN;
                end
                else if (color == 2'b10) begin
                    next_state = BLUE;
                end
                else begin
                    next_state = INIT;
                end
            end

        endcase
    end

    // count
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) count = 0;
        else begin
            case (state)
                INIT: begin
                    count = 1;
                end
                RED: begin
                    if (color == 2'b00) count = count + 1;
                    else if (color == 2'b01) count = count;
                    else count = 1;
                end
                GREEN: begin
                    if (color == 2'b00) count = count;
                    else if (color == 2'b01) count = count + 1;
                    else count = 1;
                end
                BLUE: begin
                    if (color == 2'b10) count = count + 1;
                    else count = 1;
                end
                ERROR: begin
                    if (color == 2'b10 && count == 2) count = count;
                    else count = 1;
                end
            endcase
        end
    end

    // sequencial logic
    always @(posedge clk, negedge rst_n) begin
        if (rst_n == 1'b0) begin
            state <= INIT;
            count = 0;
        end
        else begin
            state <= next_state;
        end
    end

    assign check = (state == ERROR);


endmodule
