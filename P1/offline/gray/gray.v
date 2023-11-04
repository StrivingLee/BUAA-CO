`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:26 10/09/2022 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output [2:0] Output,
    output Overflow
    );
    
    reg [2:0] Out;
    reg Over;
    
    assign Output = Out;
    assign Overflow = Over;
    
    initial begin
        Out <= 0;
        Over <= 0;
    end
    
	always @(posedge Clk) begin
        if(Reset) begin
            Out <= 0;
            Over <= 0;
        end
        else begin
            if(En) begin
                case(Out)
                    3'b000: Out <= 3'b001;
                    3'b001: Out <= 3'b011;
                    3'b011: Out <= 3'b010;
                    3'b010: Out <= 3'b110;
                    3'b110: Out <= 3'b111;
                    3'b111: Out <= 3'b101;
                    3'b101: Out <= 3'b100;
                    3'b100: begin // Overflow
                        Out <= 3'b000;
                        Over <= 1;
                    end
                endcase
            end
        end
	end    


endmodule
