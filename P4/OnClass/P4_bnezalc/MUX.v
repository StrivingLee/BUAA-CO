`timescale 1ns / 1ps
module MUX_2_32(
	input [31:0] in0,
	input [31:0] in1,
	input sel,
	output reg [31:0] out
    );

	always@(*) begin
		case(sel)
			1'b0: out = in0;
			1'b1: out = in1;
		endcase
	end
endmodule

module MUX_4_5(
	input [4:0] in0,
	input [4:0] in1,
	input [4:0] in2,
	input [4:0] in3,
	input [1:0] sel,
    input Bnezalc,
    input Zero,
	output reg [4:0] out
    );
    
	always@(*) begin
		case(sel)
			2'b00: out = in0;
			2'b01: out = in1;
			2'b10: begin
                if (Bnezalc & Zero) out = 5'b0;
                else out = in2;
            end
			2'b11: out = in3;
		endcase
	end
endmodule

module MUX_8_32(
	input [31:0] in0,
	input [31:0] in1,
	input [31:0] in2,
	input [31:0] in3,
    input [31:0] in4,
    input [31:0] in5,
    input [31:0] in6,
    input [31:0] in7,
	input [2:0] sel,
	output reg [31:0] out
    );
    
	always@(*) begin
		case(sel)
			3'b000: out = in0;
			3'b001: out = in1;
			3'b010: out = in2;
			3'b011: out = in3;
            3'b100: out = in4;
            3'b101: out = in5;
            3'b110: out = in6;
            3'b111: out = in7;
		endcase
	end
endmodule