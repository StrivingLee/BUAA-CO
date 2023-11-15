//~ `New testbench
`timescale  1ns / 1ps
`include "mips.v"

module tb_mips;

// mips Inputs
reg   clk                                  = 0 ;
reg   reset                                = 0 ;

// mips Outputs


mips  u_mips (
    .clk                     ( clk     ),
    .reset                   ( reset   )
);

initial
begin
    $dumpfile("mips_wave.vcd");
    $dumpvars;

    clk = 0;
    reset = 1;
    #20
    reset = 0;
    
    // simulation time
    #13000;
    
    $finish;
end

always #2 clk = ~clk;

endmodule