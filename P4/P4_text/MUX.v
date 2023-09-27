`timescale 1ns / 1ps
module MUX_2_32(
	input [31:0] in0,
	input [31:0] in1,
	input sel,
	output [31:0] out
    );

    reg [31:0] outreg;
    assign out = outreg;

	always@(*) begin
		case(sel)
			1'b0: outreg = in0;
			1'b1: outreg = in1;
			default: outreg = 32'b0;
		endcase
	end
endmodule

module MUX_4_5(
	input [4:0] in0,
	input [4:0] in1,
	input [4:0] in2,
	input [4:0] in3,
	input [1:0] sel,
	output [4:0] out
    );

    reg [4:0] outreg;
    assign out = outreg;

	always@(*) begin
		case(sel)
			2'b00: outreg = in0;
			2'b01: outreg = in1;
			2'b10: outreg = in2;
			2'b11: outreg = in3;
			default: outreg = 5'b0;
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
	output [31:0] out
    );

    reg [31:0] outreg;
    assign out = outreg;

	always@(*) begin
		case(sel)
			3'b000: outreg = in0;
			3'b001: outreg = in1;
			3'b010: outreg = in2;
			3'b011: outreg = in3;
            3'b100: outreg = in4;
            3'b101: outreg = in5;
            3'b110: outreg = in6;
            3'b111: outreg = in7;
			default: outreg = 32'b0;
		endcase
	end
endmodule