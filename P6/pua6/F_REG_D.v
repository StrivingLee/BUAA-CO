module F_REG_D (
    input clk,
    input reset,
    input WE,
    input [31: 0] INSTRin,
    input [31: 0] PCin,
    output reg[31: 0] INSTRout,
    output reg[31: 0] PCout
);

    always @(posedge clk) begin
        if (reset) begin
            INSTRout <= 0;
            PCout <= 0;
        end else if (WE) begin
            INSTRout <= INSTRin;
            PCout <= PCin;    
        end
    end
    
endmodule