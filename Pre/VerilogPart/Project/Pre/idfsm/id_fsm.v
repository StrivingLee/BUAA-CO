`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:43 10/26/2022 
// Design Name: 
// Module Name:    id_fsm 
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
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
module id_fsm(
    input [7:0] char,
    input clk,
    output out
    );
    
    reg [1:0] status;
    
    reg islower, isupper, isdigit;
    
    initial begin
        status = S0;
    end
    
    always@(*) begin
        if(char <= "z" && char >= "a") islower = 1;
        else islower = 0;
    end
    
    always@(*) begin
        if(char <= "Z" && char >= "A") isupper = 1;
        else isupper = 0;
    end
    
    always@(*) begin
        if(char <= "9" && char >= "0") isdigit = 1;
        else isdigit = 0;
    end
    
    always @(posedge clk) begin
        case(status)
            S0: begin
                if(islower || isupper) status <= S1;
                else status <= S0;
            end
            S1: begin
                if(isdigit) status <= S2;
                else if(islower || isupper) status <= S1;
                else status <= S0;
            end
            S2: begin
                if(isdigit) status <= S2;
                else if(islower || isupper) status <= S1;
                else status <= S0;
            end
        endcase
    end
    
    assign out = (status == S2) ? 1 : 0;


endmodule
