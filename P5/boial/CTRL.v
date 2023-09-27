`define opR  6'b000000
`define opOri 6'b001101
`define opSw 6'b101011
`define opLw 6'b100011
`define opBeq 6'b000100
`define opLui 6'b001111
`define opJal 6'b000011

`define funcAdd 6'b100000
`define funcSub 6'b100010
`define funcJr 6'b001000

module CTRL (
    
    input [31: 0] Instr,

    output [4: 0] rs,
    output [4: 0] rt,
    output [4: 0] rd,
    output [15: 0] imm,
    output [25: 0] instr_index,
    output [4: 0] shamt,
    output [4: 0] A3,//write back address

    output MemWrite,
    output Branch,
    output RegWrite,
    output MemtoReg,
    output RegDst, //means need rtdata in E
    output JrFlag,
    output JalFlag,
    output Bioal,

    output [2: 0] ALUop,
    output [1: 0] EXTop,
    output [1: 0] ALUsrc,
    output [2: 0] WDsrc,

    output useInE,
    output newInE
);
    
    wire [5: 0] opcode, funccode;
    wire add, sub, ori, lw, sw, beq, lui, jal, jr, addei, bioal; 
    wire sign;

    assign opcode = Instr[31: 26];
    assign funccode = Instr[5: 0];
    assign rs = Instr[25: 21];
    assign rt = Instr[20: 16];
    assign rd = Instr[15: 11];
    assign imm = Instr[15: 0];
    assign instr_index = Instr[25: 0];
    assign shamt = Instr[10: 6];
    assign A3 = (add | sub) ? rd : 
                (ori | lui | lw | addei) ? rt :
                (jal | bioal) ? 5'd31 :
                5'd0;     

    assign add = (funccode == `funcAdd) & (opcode == `opR);
    assign sub = (funccode == `funcSub) & (opcode == `opR);
    assign jr = (funccode == `funcJr) & (opcode == `opR);
    assign ori = (opcode == `opOri);
    assign lw = (opcode == `opLw);
    assign sw = (opcode == `opSw);
    assign beq = (opcode == `opBeq);
    assign lui = (opcode == `opLui);
    assign jal = (opcode == `opJal);
    assign addei = (opcode == 6'b110011);
    assign bioal = (opcode == 6'b101101);

    assign sign = sw | lw | beq;
    assign MemWrite = sw;
    assign Branch = beq;
    assign RegWrite = sub | add | ori | lw | lui | jal | addei | bioal;
    assign JrFlag = jr;
    assign JalFlag = jal;   
    assign MemtoReg = lw;
    assign RegDst = add | sub;
    assign Bioal = bioal;

    assign useInE = (add | sub | sw | lw | ori | addei);
    assign newInE = (add | sub | ori | addei); //lui out in D_EXT instead of E_ALU

    assign ALUop = (add) ? 3'd0 :
                   (sub) ? 3'd1 :
                   (ori) ? 3'd2 : 
                   (addei) ? 3'd3 :
                   0;
    assign EXTop = lui ? 2'd2 :
                   sign ? 2'd1 : 
                   0;
    assign ALUsrc = (lui | ori | lw | sw || addei) ? 1 : 0;
    assign WDsrc = (lw) ? 3'd0 :
                   (jal | bioal) ? 3'd1 :
                   (lui) ? 3'd2 :
                   3'd3; //alu ans

endmodule