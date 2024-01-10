`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:25:37 10/18/2022 
// Design Name: 
// Module Name:    expr 
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
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;

module expr(
    input [7:0] in,
    output out
    );
    
    reg [2:0] state;
    reg [2:0] next_state;
    
    always@(*) begin
        case(state)
            S0: begin
                if((in >= "0" && in <= "9") || (in >= "a" && in <= "z") || (in >= "A" && in <= "Z")
                    next_state = S1;
                else if(in == "+" || in == "-" || in == "*" || in == "/" || in == "=")
                    next_state = S0;
            end
            S1: begin
                if((in >= "0" && in <= "9") || (in >= "a" && in <= "z") || (in >= "A" && in <= "Z") || in == " ")
                    next_state = S1;
                else if(in == "+" || in == "-" || in == "*" || in == "/")
                    next_state = S2;
                else if(in == "=")
                    next_state = S3;
                else next_state = S0;
            end
            S2: begin
                if((in >= "0" && in <= "9") || (in >= "a" && in <= "z") || (in >= "A" && in <= "Z"))
                    next_state = S1;
                else if(in == " ") next_state = S2;
                else next_state = S0;
            end
            S3: begin
                if(in == " ")
                    next_state = S3;
                else if((in >= "0" && in <= "9") || (in >= "a" && in <= "z") || (in >= "A" && in <= "Z"))
                    next_state = S4;
                else next_state = S0;
            S4: begin
                if((in >= "0" && in <= "9") || (in >= "a" && in <= "z") || (in >= "A" && in <= "Z"))
                    next_state = S1;
                else if(in == "=")
                    next_state = S3;
                else if(in == " ")
                    next_state = S4;
                else if(in == ·ûºÅ)
                    next_state = S5;
                else next_state = S0;
            end
            S5: begin
                if((in >= "0" && in <= "9") || (in >= "a" && in <= "z") || (in >= "A" && in <= "Z") || in == " ")
                    next_state = S4;
                else if(in == " ") next_state = S5;
                else next_state = S0;
                else
            end
        endcase
    end
    
    always@(posedge clk, posedge clr) begin
        if(clr) begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end
    
    assign out = (state == S4)? 1'b1 : 1'b0;

endmodule
