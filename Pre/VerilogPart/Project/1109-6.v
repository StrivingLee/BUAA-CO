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
module id_fsm(
    input [7:0] char,
    input clk,
    output out
    );

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    
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

// `timescale 1ns / 1ps

// module test(
//     input [7:0] char,
//     input clk,
//     output out
//     );

//     parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

//     reg [1:0] status;
//     reg isdigit, isalpha;

//     initial begin
//         status <= s0;
//     end

//     always @(*) begin
//         if (char <= "9" && char >= "0") isdigit = 1;
//         else isdigit = 0;
//     end

//     always @(*) begin
//         if ((char <= "z" && char >= "a") || (char <= "Z" && char >= "A")) isalpha = 1;
//         else isalpha = 0;
//     end

//     always @(posedge clk) begin
//         case (status)
//             s0: begin
//                 if (isalpha) status <= s1;
//                 else status <= s0;
//             end
//             s1: begin
//                 if (isdigit) status <= s2;
//                 else if (isalpha) status <= s1;
//                 else status <= s0;
//             end
//             s2: begin
//                 if (isdigit) status <= s2;
//                 else if (isalpha) status <= s1;
//                 else status <= s0;
//             end
//         endcase
//     end

//     assign out = (status == s2) ? 1'b1 : 1'b0;

// endmodule
