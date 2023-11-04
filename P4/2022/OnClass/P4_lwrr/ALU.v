`timescale 1ns / 1ps
module ALU(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [2:0] ALUControl,
    input [4:0] shamt,
    output Zero,
    output GreaterZero,
    output LessZero,
    output BalSign,
    output reg[31:0] ALUResult
);

    assign Zero = (SrcA == SrcB);
    assign GreaterZero = ($signed(SrcA) > 0) ? 1'b1 : 1'b0; // the f**king $signed
    assign LessZero = ($signed(SrcA) < 0) ? 1'b1 : 1'b0;
    
    reg Bal;
    assign BalSign = Bal;
    
    integer cnt1;
    integer cnt0;
    integer cnt_rs;
    integer cnt_rt;
    integer i = 0;
    integer j = 0;
    
    always @(*) begin
        Bal = 0;
        cnt1 = 0;
        cnt0 = 0;
        for (i = 0; i < 32; i = i + 1) begin
            if (SrcA[i] == 1'b1) cnt1 = cnt1 + 1;
        end
        cnt0 = 32 - cnt1;
        if (cnt0 % cnt1 == 0) Bal = 1;
        else Bal = 0;
    end

    always @(*) begin
        case (ALUControl)
        3'b000:
            ALUResult = SrcA + SrcB;
        3'b001:
            ALUResult = SrcA - SrcB;
        3'b010:
            ALUResult = SrcA ^ SrcB;
        3'b011:
            ALUResult = SrcA | SrcB;
        3'b100:
            ALUResult = SrcB << shamt;
        3'b101: begin
            cnt_rs = 0;
            cnt_rt = 0;
            for (j = 0; j < 32 && SrcA[j] == 1'b0; j = j + 1) begin
                cnt_rs = cnt_rs + 1;
            end
            for (i = 0; j < 32 && SrcB[j] == 1'b0; j = j + 1) begin
                cnt_rt = cnt_rt + 1;
            end
            if (cnt_rs == cnt_rt) ALUResult = 32'b1;
            else ALUResult = 32'b0;
        end
        default:
            ALUResult = 32'b0;
        endcase
    end

endmodule