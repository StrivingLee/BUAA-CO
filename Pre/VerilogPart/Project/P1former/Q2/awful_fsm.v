`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:44 10/17/2022 
// Design Name: 
// Module Name:    awful_fsm 
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
parameter ASLEEP = 'd0;
parameter BUSY = 'd1;
parameter WORRIED = 'd2;
parameter STUPID = 'd3;
parameter HAPPY = 'd4;
parameter RING = 2'b00;
parameter IDEA = 2'b01;
parameter FAIL = 2'b10;
parameter SUCCESS = 2'b11;

module awful_fsm(
    input [1:0] in,
    input clr,
    input clk,
    output [2:0] out
    );
    
    reg [2:0] state;
    reg [2:0] next_state;
    reg [1:0] asleepCount;
    reg [1:0] stupidCount;
    reg [1:0] worriedCount;
    
    initial begin
        state = ASLEEP;
        next_state = ASLEEP;
        busyCount = 0;
        stupidCount = 0;
        worriedCount = 0;
    end
    
    always @(*) begin
        if(state == ASLEEP) begin
            if(in == RING) next_state = BUSY;
        end
        else if(state == STUPID) begin
            if(in == IDEA) next_state = BUSY;
            else if(stupidCount == 3) begin
                next_state = ASLEEP;
                stupidCount = 0;
            end
            else stupidCount = stupidCount + 1;
        end
        else if(state == BUSY) begin
            if(in == FAIL) next_state = WORRIED;
            else if(in == SUCCESS) next_state = HAPPY;
            else if(busyCount == 3) begin
                next_state = ASLEEP;
                busyCount = 0;
            end
            else busyCount = busyCount + 1;
        end
        else if(state == WORRIED) begin
            if(worriedCount == 2) next_state = STUPID;
            else worriedCount = worriedCount + 1;
        end
    end
    
    always @(posedge clk, posedge clr) begin
        if(clr) begin
            state = ASLEEP;
            next_state = ASLEEP;
            busyCount = 0;
            stupidCount = 0;
            worriedCount = 0;
        end
        else state = next_state;
    end
    
    assign out = state;

endmodule
