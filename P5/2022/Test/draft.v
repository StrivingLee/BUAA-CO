    /*assign Tuse_RS0 = beq | jr;
    assign Tuse_RS1 = add | sub | addi | isXor | ori | lw | lb | sw;
    assign Tuse_RT0 = beq;
    assign Tuse_RT1 = add | sub | sll | isXor;*/
    
    /*assign E_Tnew_E1 = add | sub | ori; 
    assign Tnew_E2 = lw | lb;
    assign Tnew_M1 = Tnew_E2;*/
    
    /*wire [1:0] Tuse_RS, Tuse_RT;
    assign Tuse_RS = (beq | jr) ? 2'b00 : 
                     (add | sub | addi | isXor | ori | lw | lb | sw) ? 2'b01 : 
                     2'b11;
    assign Tuse_RT = (beq) ? 2'b00 : 
                     (add | sub | sll | isXor) ? 2'b01 : 
                     (lw | lb) ? 2'b10 : 
                     2'b11;*/
    
    /*reg [1:0] E_Tnew, M_Tnew;
    always@(posedge clk) begin
		if (reset | Stall) begin
			E_Tnew <= 2'b00;
		end
		else if (lui | jr) begin
			E_Tnew <= 2'b00;
		end
		else if (add | sub | ori) begin
			E_Tnew <= 2'b01;
		end
		else if (lw | lb) begin
			E_Tnew <= 2'b10;
		end
	end
    
    always @(posedge clk) begin
        if (reset) M_Tnew <= 2'b00;
        else if (E_Tnew > 0) M_Tnew <= E_Tnew - 1;
        else M_Tnew <= 2'b00;
    end*/
    
    /*assign Stall_RS0_E1 = Tuse_RS0 & Tnew_E1 & (rs == RegAddr);
    assign Stall_RS0_E2 = Tuse_RS0 & Tnew_E2 & (rs == RegAddr);
    assign Stall_RS0_M1 = Tuse_RS0 & Tnew_M1 & (rs == RegAddr);
    assign Stall_RS1_E2 = Tuse_RS1 & Tnew_E2 & (rs == RegAddr);
    assign Stall_RS = Stall_RS0_E1 | Stall_RS0_E2 | Stall_RS0_M1 | Stall_RS1_E2;
    
    assign Stall_RT0_E1 = Tuse_RT0 & Tnew_E1 & (rt == RegAddr);
    assign Stall_RT0_E2 = Tuse_RT0 & Tnew_E2 & (rt == RegAddr);
    assign Stall_RT0_M1 = Tuse_RT0 & Tnew_M1 & (rt == RegAddr);
    assign Stall_RT1_E2 = Tuse_RT1 & Tnew_E2 & (rt == RegAddr);
    assign Stall_RT = Stall_RT0_E1 | Stall_RT0_E2 | Stall_RT0_M1 | Stall_RT1_E2;*/

    
    // MUX_8_32 RegDataMUX(.in0(Result), .in1(MemReadData), .in2(EXTImm32), .in3(PC4), .in4(ReadByteData), .sel(Mem2Reg), .out(RegData));
    // MUX_4_5 D_RegAddrMUX(.in0(D_rt), .in1(D_rd), .in2(5'b11111), .sel(D_RegDst), .out(D_RegAddr));
    // MUX_4_5 E_RegAddrMUX(.in0(E_rt), .in1(E_rd), .in2(5'b11111), .sel(E_RegDst), .out(E_RegAddr));
    // MUX_4_5 M_RegAddrMUX(.in0(M_rt), .in1(M_rd), .in2(5'b11111), .sel(M_RegDst), .out(M_RegAddr));
    // MUX_4_5 W_RegAddrMUX(.in0(W_rt), .in1(W_rd), .in2(5'b11111), .sel(W_RegDst), .out(W_RegAddr));
    // MUX_2_32 SrcBMUX(.in0(RD2), .in1(EXTImm32), .sel(ALUSrc), .out(SrcB));