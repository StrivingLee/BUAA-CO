module D_GRF (
    input clk,
    input reset,
    input WE,
    input [4: 0] A1,
    input [4: 0] A3,
    input [4: 0] A2,
    input [31: 0] WD,

    output [31: 0] RD1,
    output [31: 0] RD2,
    
    input [31: 0] PC
);

    reg [31: 0] GRF [31: 0];
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
            GRF[i] = 0;
    end

    assign RD1 = (A3 == A1 && A3 && WE) ? WD : GRF[A1];
    assign RD2 = (A3 == A2 && A3 && WE) ? WD : GRF[A2];

    always @ (posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1)
                GRF[i] <= 0;
        end else if (WE && A3) begin
            GRF[A3] <= WD;
            $display("%d@%h: $%d <= %h", $time, PC, A3, WD);
        end
    end

endmodule