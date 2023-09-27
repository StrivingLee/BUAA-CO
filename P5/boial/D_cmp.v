module D_cmp(
    input [31: 0] Rsdata,
    input [31: 0] Rtdata,

    output reg check
);
    reg [32: 0] temp, t1, t2;
	 
	 always @* begin
	    t1 = {Rsdata[31], Rsdata};
		t2 = {Rtdata[31], Rtdata};
		temp = t1 + t2;

		check = (temp[31] != temp[32]); 
	 end


endmodule