module D_REG_E (
    input clk,
    input reset,
    input [31: 0] INSTRin,
    input [31: 0] PCin,
    input [31: 0] RsDatain,
    input [31: 0] RtDatain,
    input [31: 0] EXTin,

    output reg [31: 0] INSTRout,
    output reg [31: 0] PCout,
    output reg [31: 0] RsDataout,
    output reg [31: 0] RtDataout,
    output reg [31: 0] EXTout
);

    always @(posedge clk) begin
        if (reset) begin
            INSTRout <= 0;
            PCout <= 0;
            RsDataout <= 0;
            RtDataout <= 0;
            EXTout <= 0;
        end else begin
            INSTRout <= INSTRin;
            PCout <= PCin;
            RsDataout <= RsDatain;
            RtDataout <= RtDatain;
            EXTout <= EXTin;            
        end
    end
    
endmodule