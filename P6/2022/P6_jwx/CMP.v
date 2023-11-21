module CMP(
    input [31: 0] rsData,
    input [31: 0] rtData,
    output reg check
);

    integer i;
    reg [7: 0] cnt1, cnt2;
    reg flag1, flag2;

    always @* begin
        for (i = 31; i >= 0; i = i - 1) begin
            if (rsData[i] == 1 && rtData[i] == 1) begin
                i = -1;
                check = 1;
            end else if (rsData[i] != rtData[i]) begin
                check = 0;
                i = -1;
            end
        end
        if (rsData == 0 || rtData == 0) check = 0;
    end
    
endmodule