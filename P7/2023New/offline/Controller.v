`timescale 1ns / 1ps
`include "Const.v"

module Controller(
    input [31:0] Instr,

    output [4 :0] rs,
    output [4 :0] rt,
    output [4 :0] rd,
    output [4 :0] shamt,
    output [15:0] Imm16,
    output [25:0] Imm26,
    output [2 :0] NPCControl,
    output [2 :0] ALUControl,
    output        ALU_CAL_Ov,
    output        ALU_DM_Ov,
    output        MemWrite,
    output        RegWrite,
    output [2 :0] Mem2Reg,
    output [2 :0] EXTControl,
    output        ALUSrc,
    output [4 :0] RegAddr,
    output [3 :0] MDUControl,
    output [2 :0] BEControl,
    output [2 :0] DEControl,
    
    output        calc_r,
	output        calc_i,
    
    output        beq,
    output        bne,
    output        bgtz,
    // todo branch
    output        newbal,
    
    output        jal, 
    output        jr,
    
    output        slt,
    output        sltu,
	output        load,

    // todo load
    output        newload,

	output        store,
	output        lui,
    output        md,
    output        mf,
    output        mt,
    output        set,
    output        mfc0,
    output        mtc0,

    output        eret,
    output        EXC_RI
);
    
    wire [5:0] opcode, funct;
    assign opcode = Instr[31:26];
    assign rs = Instr[25:21];
    assign rt = Instr[20:16];
    assign rd = Instr[15:11];
    assign shamt = Instr[10:6];
    assign funct = Instr[5:0];
    assign Imm16 = Instr[15:0];
    assign Imm26 = Instr[25:0];


    assign nop = (Instr == 32'b0);
    assign R = (opcode == 6'b000000);
    assign add = R & (funct == 6'b100000);
    assign sub = R & (funct == 6'b100010);
    assign sll = R & (funct == 6'b000000);
    assign mult = R & (funct == 6'b011000);
    assign multu = R & (funct == 6'b011001);
    assign div = R & (funct == 6'b011010);
    assign divu = R & (funct == 6'b011011);
    assign mfhi = R & (funct == 6'b010000);
    assign mflo = R & (funct == 6'b010010);
    assign mthi = R & (funct == 6'b010001);
    assign mtlo = R & (funct == 6'b010011);
    // todo mdu
    assign madd = (opcode == 6'b011100) & (funct == 6'b000000);
    assign maddu = (opcode == 6'b011100) & (funct == 6'b000001);
    assign msub = (opcode == 6'b011100) & (funct == 6'b000100);
    assign msubu = (opcode == 6'b011100) & (funct == 6'b000101);

    assign isAnd = R & (funct == 6'b100100);
    assign isOr = R & (funct == 6'b100101);
    assign isXor = R & (funct == 6'b100110);
    assign jr = R & (funct == 6'b001000);
    assign jalr = R & (funct == 6'b001001);
    assign slt = R & (funct == 6'b101010);
    assign sltu = R & (funct == 6'b101011);
    assign andi = (opcode == 6'b001100);
    assign ori = (opcode == 6'b001101);
    assign xori = (opcode == 6'b001110);
    assign lb = (opcode == 6'b100000);
    assign lh = (opcode == 6'b100001);
    assign lw = (opcode == 6'b100011);
    assign sb = (opcode == 6'b101000);
    assign sh = (opcode == 6'b101001);
    assign sw = (opcode == 6'b101011);
    assign beq = (opcode == 6'b000100);
    assign bne = (opcode == 6'b000101);
    assign bgtz = (opcode == 6'b000111);
    assign lui = (opcode == 6'b001111);
    assign jal = (opcode == 6'b000011);
    assign j = (opcode == 6'b000010);
    assign lb = (opcode == 6'b100000);
    assign addi = (opcode == 6'b001000);

    assign mfc0 = (opcode == 6'b010000) & (rs == 5'b00000);
    assign mtc0 = (opcode == 6'b010000) & (rs == 5'b00100);
    assign syscall = (funct == 6'b001100);
    assign eret = (opcode == 6'b010000) & (rs == 5'b10000) & (funct == 6'b011000); // todo check
    
    // todo branch
    assign newbal = 1'b0;
    // todo load
    assign newload = 1'b0;

    assign NPCControl = (branch) ? `BRANCH : // branch, 16imm
                        (j | jal) ? `JUMP: // j, 26imm
                        (jr | jalr) ? `REGRS: // rs
                        `INCRE;
    
    /* ----- ALU signals begin ----- */
    assign ALUControl = (sub) ? `SUB :
                        (isAnd | andi) ? `AND :
                        (isOr | ori) ? `OR :
                        (isXor | xori) ? `XOR : 
                        (sll) ? `SLL :
                        (slt) ? `SLT :
                        (sltu) ? `SLTU : 
                        `ADD;
    assign ALU_CAL_Ov = add | sub | addi;
    assign ALU_DM_Ov = load | store; // lb | lh | lw | sb | sh | sw;
    /* ----- ALU signals end ----- */
    
    assign MemWrite = store; // sb | sh | sw;
    // todo branch
    assign RegWrite = calc_r | calc_i | load | lui | md | mf | mfc0 | set | link;
    assign Mem2Reg = (load) ? `DM  :
                     (lui)  ? `EXT :
                     // todo branch
                     (link) ? `PC  :
                     (mfhi) ? `HI  :
                     (mflo) ? `LO  :
                     (mfc0) ? `CP0 :
                     `ALU;
    assign EXTControl = (load | store | addi) ? `SIGN :
                        (lui) ? `UPPER :
                        `ZERO;
    assign ALUSrc = (calc_r | md) ? 1'b0 : 1'b1;
    assign RegAddr = (calc_r | mf | jalr) ? rd :
                     (calc_i | sltu | load | lui | mfc0) ? rt : // mfc0 is rt    mfc0 rt, rd  GPR[rt] <- CP0[rd]
                     // todo branch
                     (jal | newbal) ? 5'b11111 :
                     5'b0;
    assign MDUControl = mult  ? `MULT :
	                    multu ? `MULTU :
                        div   ? `DIV :
                        divu  ? `DIVU :
                        mfhi  ? `MFHI :
                        mflo  ? `MFLO :
                        mthi  ? `MTHI :
              			mtlo  ? `MTLO :
                        // todo mdu
                        madd  ? `MADD :
                        maddu ? `MADDU:
                        msub  ? `MSUB:
                        msubu ? `MSUBU:
  						4'd0;
    assign BEControl = (sw) ? `WORD : 
                      (sh) ? `HALF :
                      (sb) ? `BYTE : 
                      4'd0;
    // todo load, no matter word, half or byte, there must be added
    assign DEControl = (lw | newload) ? `WORD : 
                       (lh) ? `HALF :
                       (lb) ? `BYTE : 
                       4'd0;
    assign calc_r = add | sub | isAnd | isOr | isXor | sll | slt | sltu;
	assign calc_i = andi | ori | xori | addi;
    // todo branch
    assign branch = beq | bne | newbal;
    // todo branch
    assign link = jal | jalr | newbal;
    // todo load
	assign load = lb | lh | lw | newload;
	assign store = sb | sh | sw;
    assign set = slt | sltu;
    // todo mdu
    assign md = mult | multu | div | divu | madd | maddu | msub | msubu;
    assign mf = mfhi | mflo;
    assign mt = mthi | mtlo;


    assign EXC_RI = ! (nop | add | sub | isAnd | isOr | slt | sltu | lui |
                       addi | andi | ori | 
                       mult | multu | div | divu | mfhi | mflo | mthi | mtlo |
                       beq | bne |
                       jal | jr |
                       lb | lh | lw | sb | sh | sw |
                       mfc0 | mtc0 | eret | syscall);

endmodule