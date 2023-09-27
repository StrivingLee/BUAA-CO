`timescale 1ns / 1ps

module test(
    input in,
    input clk,
    input reset,
    output out
    );

    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

    reg [1:0] status;

    initial begin
        status <= s0;
    end

    always @(posedge clk, posedge reset) begin
        if (reset) status <= s0;
        else begin
            case (status)
                s0: begin
                    if (in == 1'b1) status <= s1; // 1
                    else status <= s0; // 0
                end
                s1: begin
                    if (in == 1'b0) status <= s2; // 1 + 0
                    else status <= s1; // 1 + 1
                end
                s2: begin
                    if (in == 1'b1) status <= s3; // 10 + 1
                    else status <= s0; // 10 + 0
                end
                s3: begin
                    if (in == 1'b1) status <= s1;
                    else status <= s2;
                end
            endcase
        end
    end

    assign out = (status == s2 && in == 1'b1) ? 1'b1 : 1'b0;

endmodule