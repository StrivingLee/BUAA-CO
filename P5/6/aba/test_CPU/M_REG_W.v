module M_REG_W (
    input clk,
    input reset,
    input [31: 0] InstrIn,
    input [31: 0] PCin,
    input [31: 0] ALUin,
    input [31: 0] DMin,
    input [31: 0] EXTin,

    output reg [31: 0] InstrOut,
    output reg [31: 0] PCout,
    output reg [31: 0] ALUout,
    output reg [31: 0] DMout,
    output reg [31: 0] EXTout
);

    always @(posedge clk ) begin
        if (reset) begin
            InstrOut <= 0;
            PCout <= 0;
            ALUout <= 0;
            DMout <= 0;
            EXTout <= 0;
        end else begin
            InstrOut <= InstrIn;
            PCout <= PCin;
            ALUout <= ALUin;
            DMout <= DMin;
            EXTout <= EXTin;
        end       
    end
    
endmodule