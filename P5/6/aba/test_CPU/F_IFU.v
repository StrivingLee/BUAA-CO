module F_IFU (
    input clk,
    input reset,
    input WE,
    input [31: 0] PCin,

    output reg [31: 0] PC,
    output [31: 0] Instr
);

    reg [31: 0] ROM [4095: 0];
    integer i;

    assign Instr = ROM[PC[15: 2] - 'hC00];

    initial begin
        PC <= 32'h00003000;
        for (i = 0; i < 4096; i = i + 1)
            ROM[i] = 0;
        $readmemh("code.txt", ROM, 0, 4095);
    end

    always @(posedge clk) begin
        if (reset)
            PC <= 32'h00003000;
        else if (WE)
            PC <= PCin;
    end
    
endmodule