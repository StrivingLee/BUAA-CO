`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:45 10/27/2022 
// Design Name: 
// Module Name:    cpu_checker 
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
module cpu_checker(
    input clk,
    input reset,
    input [7:0] char,
    output [1:0] format_type
    );
    
    parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011;
    parameter S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111;
    parameter S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011;
    parameter S12 = 4'b1100, S13 = 4'b1101;
    
    reg [2:0] decCnt;
    reg [3:0] hexCnt;
    // reg isDec, isHex;
    reg [1:0] type;
    reg [3:0] status;
    
    initial begin
        status <= S0;
        decCnt <= 3'b0;
        hexCnt <= 4'b0;
        /*isDec <= 0;
        isHex <= 0;*/
        type <= 2'b0;
    end
    
    /*always @(*) begin
        if(char <= "9" && char >= "0") isDec = 1;
        else isDec = 0;
    end
    
    always @(*) begin
        if((char <= "9" && char >= "0") || (char <= "f" && char >= "a")) isHex = 1;
        else isHex = 0;
    end*/
    wire isDec, isHex;
    assign isDec = char <= "9" & char >= "0";
    assign isDec = (char <= "9" & char >= "0") | (char <= "f" & char >= "a");
    
    always @(posedge clk) begin
        if(reset) begin
            status <= S0;
            decCnt <= 3'b0;
            hexCnt <= 4'b0;
            /*isDec <= 0;
            isHex <= 0;*/
            type <= 2'b0;
        end
        else begin
            case(status)
                S0: begin
                    if(char == "^") status <= S1;
                end
                S1: begin
                    if(isDec) begin
                        decCnt <= decCnt + 1;
                        status <= S2;
                    end
                    // current char isnot dec
                    else if(char == "^") status <= S1;
                    else status <= S0;
                end
                S2: begin
                    if(isDec) decCnt <= decCnt + 1;
                    // count first
                    else begin
                    // current char isnot dec
                        if(decCnt > 4) begin
                            status <= S0;
                            decCnt <= 0; // clear the decCnt reg
                        end
                        // here decCnt is between 1 and 4
                        else if(char == "@") begin
                            status <= S3;
                            decCnt <= 0;
                        end
                        else if(char == "^") begin
                            status <= S1;
                            decCnt <= 0;
                        end
                        else begin
                            status <= S0;
                            decCnt <= 0;
                        end
                    end
                end
                S3: begin
                    if(isHex) begin
                        hexCnt <= hexCnt + 1;
                        status <= S4;
                    end
                    else if(char == "^") status <= S1;
                    else status <= S0;
                end
                S4: begin
                    if(isHex) hexCnt <= hexCnt + 1;
                    else begin
                        if(hexCnt == 8) begin
                            if(char == ":") begin
                                status <= S5;
                                hexCnt <= 0;
                                // clear the hexCnt reg
                            end
                        end
                        else begin
                            // teiminate early
                            hexCnt <= 0;
                            if(char == "^") status <= S1;
                            else status <= S0;
                        end
                    end
                end
                S5: begin
                    if(char == "$") begin
                        status <= S6;
                        type <= 2'b01;
                    end
                    else if(char == "*") begin
                        status <= S8;
                        type <= 2'b10;
                    end
                    else if(char == " ") status <= S5;
                    else if(char == "^") status <= S1;
                    else status <= S0;
                end
                S6: begin
                    if(isDec) begin
                        decCnt <= decCnt + 1;
                        status <= S7;
                    end
                    else if(char == "^") begin
                        status <= S1;
                        type <= 2'b00;
                    end
                    else begin
                        status <= S0;
                        type <= 2'b00;
                    end
                end
                S7: begin
                    if(isDec) decCnt <= decCnt + 1;
                    else begin
                        if(decCnt > 4) begin
                            // terminate late
                            status <= S0;
                            decCnt <= 0; // clear the decCnt reg
                            type <= 2'b00;
                        end
                        // here decCnt is between 1 and 4
                        else if(char == " ") status <= S7;
                        else if(char == "<") begin
                            status <= S10;
                            decCnt <= 0; // clear the decCnt reg
                        end
                    end
                end
                S8: begin
                    if(isHex) begin
                        hexCnt <= hexCnt + 1;
                        status <= S9;
                    end
                    else if(char == "^") begin
                        status <= S1;
                        type <= 2'b00;
                    end
                    else begin
                        status <= S0;
                        type <= 2'b00;
                    end
                end
                S9: begin
                    if(isHex) hexCnt <= hexCnt + 1;
                    else begin
                        if(hexCnt == 8) begin
                            if(char == " ") status <= S9;
                            else if(char == "<") begin
                                status <= S10;
                                hexCnt <= 0;
                                // clear the hexCnt reg
                            end
                        end
                        else begin
                            hexCnt <= 0;
                            type <= 2'b00;
                            if(char == "^") status <= S1;
                            else status <= S0;
                        end
                    end
                end
                S10: begin
                    if(char == "=") status <= S11;
                    else if(char == "^") begin
                        status <= S1;
                        type <= 2'b00;
                    end
                    else begin
                        status <= S0;
                        type <= 2'b00;
                    end
                end
                S11: begin
                    if(isHex) begin
                        hexCnt <= hexCnt + 1;
                        status <= S12;
                    end
                    else if(char == " ") status <= S11;
                    else if(char == "^") begin
                        status <= S1;
                        type <= 2'b00;
                    end
                    else begin
                        status <= S0;
                        type <= 2'b00;
                    end
                end
                S12: begin
                    if(isHex) hexCnt <= hexCnt + 1;
                    else begin
                        if(hexCnt == 8) begin
                            hexCnt <= 0;
                            if(char == "#") status <= S13;
                            else status <= S0;
                        end
                        else begin
                            // teiminate early
                            hexCnt <= 0;
                            if(char == "^")  begin
                                status <= S1;
                                type <= 2'b00;
                            end
                            else begin
                                status <= S0;
                                type <= 2'b00;
                            end
                        end
                    end
                end
                S13: begin
                    if(char == "^")  begin
                        status <= S1;
                        type <= 2'b00;
                    end
                    else begin
                        status <= S0;
                        type <= 2'b00;
                    end
                end
            endcase
        end
    end
    
    assign format_type = (status == S13) ? type : 2'b00;
    

endmodule
