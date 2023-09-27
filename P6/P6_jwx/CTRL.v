`define opR  6'b000000 //√
`define opOri 6'b001101 //√
`define opSw 6'b101011 //√
`define opLw 6'b100011 //√
`define opBeq 6'b000100 //√
`define opLui 6'b001111 //√
`define opJal 6'b000011 //√
`define opAddi 6'b001000 //√
`define opAndi 6'b001100 //√
`define opBne 6'b000101 //√
`define opLb 6'b100000
`define opLh 6'b100001
`define opSb 6'b101000
`define opSh 6'b101001 

`define funcAdd 6'b100000 //√
`define funcSub 6'b100010 //√
`define funcJr 6'b001000 //√
`define funcAnd 6'b100100 //√
`define funcOr 6'b100101 //√
`define funcSlt 6'b101010 //√
`define funcSltu 6'b101011 //√
`define funcMult 6'b011000
`define funcMultu 6'b011001
`define funcDiv 6'b011010
`define funcDivu 6'b011011
`define funcMfhi 6'b010000
`define funcMflo 6'b010010
`define funcMthi 6'b010001
`define funcMtlo 6'b010011
`define opBtheq 6'b101111

module CTRL (
    
    input [31: 0] Instr,

    output [4: 0] rs,
    output [4: 0] rt,
    output [4: 0] rd,
    output [15: 0] imm,
    output [25: 0] instr_index,
    output [4: 0] A3,//write back address

    output [1: 0] Branch,
    output RegWrite,
    output MemtoReg,
    output CALR,
    output JrFlag,
    output JalFlag,

    output [3: 0] Memsrc,
    output [2: 0] ALUop,
    output [1: 0] EXTop,
    output [1: 0] ALUsrc,
    output [2: 0] WDsrc,
    output [3: 0] Loadsrc,
    output [3: 0] mdop,

    output useInE, // for rs only
    output newInE
);
    
    wire [5: 0] opcode, funccode;
    wire add, sub, ori, lw, sw, beq, lui, jal, jr, lb, lh, sb, sh, addi, andi, bne, And, Or, slt, sltu, btheq; 
    wire mult, multu, div, divu, mfhi, mflo, mthi, mtlo;
    wire sign, load, store, calr, cali;

    assign opcode = Instr[31: 26];
    assign funccode = Instr[5: 0];
    assign rs = Instr[25: 21];
    assign rt = Instr[20: 16];
    assign rd = Instr[15: 11];
    assign imm = Instr[15: 0];
    assign instr_index = Instr[25: 0];  

    assign add = (funccode == `funcAdd) & (opcode == `opR);
    assign sub = (funccode == `funcSub) & (opcode == `opR);
    assign jr = (funccode == `funcJr) & (opcode == `opR);
    assign And = (opcode == `opR) & (funccode == `funcAnd); 
    assign Or = (opcode == `opR) & (funccode == `funcOr);
    assign slt = (opcode == `opR) & (funccode == `funcSlt);
    assign sltu = (opcode == `opR) & (funccode == `funcSltu);
    assign mult = (opcode == `opR) & (funccode == `funcMult);
    assign multu = (opcode == `opR) & (funccode == `funcMultu);
    assign div = (opcode == `opR) & (funccode == `funcDiv);
    assign divu = (opcode == `opR) & (funccode == `funcDivu);
    assign mfhi = (opcode == `opR) & (funccode == `funcMfhi);
    assign mflo = (opcode == `opR) & (funccode == `funcMflo);
    assign mthi = (opcode == `opR) & (funccode == `funcMthi);
    assign mtlo = (opcode == `opR) & (funccode == `funcMtlo);

    assign ori = (opcode == `opOri);
    assign lw = (opcode == `opLw);
    assign sw = (opcode == `opSw);
    assign beq = (opcode == `opBeq);
    assign lui = (opcode == `opLui);
    assign jal = (opcode == `opJal);
    assign lb = (opcode == `opLb);
    assign lh = (opcode == `opLh);
    assign sb = (opcode == `opSb);
    assign sh = (opcode == `opSh);
    assign addi = (opcode == `opAddi);
    assign andi = (opcode == `opAndi);
    assign bne = (opcode == `opBne);
    assign btheq = (opcode == `opBtheq);

    assign sign = store | load | beq | addi;
    assign load = lb | lh | lw;
    assign store = sb | sh | sw;
    assign calr = add | And | Or | sub | slt | sltu;
    assign cali = addi | andi | ori;

    assign RegWrite = cali | calr | load | lui | jal | mfhi | mflo;
    assign JrFlag = jr;
    assign JalFlag = jal;   
    assign MemtoReg = load;
    assign CALR = calr;

    assign useInE = (calr | store | load | cali | mult | multu | div | divu | mthi | mtlo);
    assign newInE = (cali | calr | mfhi | mflo); //lui out in D_EXT instead of E_ALU

    assign A3 = (calr | mfhi | mflo) ? rd : 
                (cali | load | lui) ? rt :
                (jal) ? 5'd31 :
                5'd0;   

    assign Branch = beq ? 2'd1 :
                    bne ? 2'd2 :
                    btheq ? 2'd3 :
                    2'd0;

    assign ALUop = (sub) ? 3'd1 :
                   (ori | Or) ? 3'd2 : 
                   (And | andi) ? 3'd3 : 
                   slt ? 3'd4 : 
                   sltu ? 3'd5 :
                   3'd0;
                   
    assign EXTop = lui ? 2'd2 :
                   sign ? 2'd1 : 
                   0;

    assign ALUsrc = (calr | mult | multu | div | divu) ? 0 : 1;

    assign WDsrc = (load) ? 3'd0 :
                   (jal) ? 3'd1 :
                   (lui) ? 3'd2 :
                   mfhi ? 3'd4 :
                   mflo ? 3'd5 :
                   3'd3; //alu ans

    assign Memsrc = sw ? 4'd1 :
                    sh ? 4'd2 :
                    sb ? 4'd3 :
                    0;             

    assign Loadsrc = lw ? 4'b1 :
                     lh ? 4'd2 :
                     lb ? 4'd3 :
                     0; 
    
    assign mdop = mult ? 4'd1 :
                  div ? 4'd2 :
                  multu ? 4'd3 :
                  divu ? 4'd4 :
                  mfhi ? 4'd5 :
                  mflo ? 4'd6 :
                  mthi ? 4'd7 :
                  mtlo ? 4'd8 :
                  0;

endmodule