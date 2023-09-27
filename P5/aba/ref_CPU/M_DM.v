module M_DM (
    input clk,
    input reset,
    input WE,
    input [31: 0] WD,
    input [31: 0] Address,

    output [31: 0] DMout,

    input [31: 0] PC
);

    reg [31: 0] RAM [4095: 0];
    integer i;

    initial begin
        for (i = 0; i < 4096; i = i + 1) 
            RAM[i] = 0;
    end

    assign DMout = RAM[Address[13: 2]];

    always @(posedge clk) begin
        if (reset) 
            for (i = 0; i < 4096; i = i + 1) 
                RAM[i] <= 0;    
        else if (WE) begin // write
            RAM[Address[13: 2]] <= WD;
            $display("%d@%h: *%h <= %h", $time, PC, Address, WD);
        end
    end
    
endmodule