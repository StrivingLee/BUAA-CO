module F_PC (
    input clk,
    input reset,
    input WE,
    input [31: 0] PCin,

    output reg [31: 0] PCout
);
    
  always @(posedge clk) begin
    if (reset) begin
        PCout <= 32'h00003000;
    end else if (WE) begin
        PCout <= PCin;
    end
  end

endmodule