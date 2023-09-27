module E_REG_M (
    input clk,
    input reset,
    input [31: 0] INSTRin,
    input [31: 0] PCin,
    input [31: 0] ALUin,
    input [31: 0] GRFrtIn,
    input [31: 0] EXTin,
    input Checkin,

    output reg [31: 0] INSTRout,
    output reg [31: 0] PCout,
    output reg [31: 0] ALUout,
    output reg [31: 0] GRFrtOut,
    output reg [31: 0] EXTout,
    output reg Checkout
);

    always @(posedge clk) begin
        if (reset) begin
            INSTRout <= 0;
            PCout <= 0;
            ALUout <= 0;
            GRFrtOut <= 0;
            EXTout <= 0;
            Checkout <= 0;
        end else begin
            INSTRout <= INSTRin;
            PCout <= PCin;
            ALUout <= ALUin;
            GRFrtOut <= GRFrtIn;
            EXTout <= EXTin;    
            Checkout <= Checkin;        
        end
    end
    
endmodule