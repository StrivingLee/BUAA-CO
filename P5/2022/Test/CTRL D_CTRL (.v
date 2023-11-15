    CTRL  D_CTRL (
        .Instr                   (Dinstr),

        .rs                      (Drs),
        .rt                      (Drt),
        .imm                     (Dimm),
        .MemWrite                (DMemWrite),
        // .RegDst                  (DRegDst), 
        .useInE                  (DUseInE),
        .instr_index             (Dinstr_index),
        .Branch                  (DBranch),
        .JrFlag                  (DJrFlag),
        .JalFlag                 (DJalFlag),
        .EXTop                   (DEXTop)
    );

    CTRL  E_CTRL (
        .Instr                   (Einstr),

        .MemtoReg                (EMemtoReg),          
        .newInE                  (newInE),  
        .rs                      (Ers),
        .rt                      (Ert),
        .A3                      (EA3),
        .WDsrc                   (EWDsrc),
        .ALUop                   (EALUop),
        .ALUsrc                  (EALUsrc)
    );

    CTRL  M_CTRL (
        .Instr                   (Minstr),

        .MemtoReg                (MMemtoReg), 
        .rt                      (Mrt),
        .A3                      (MA3),
        .MemWrite                (MMemWrite),
        .WDsrc                   (MWDsrc)
    );

    CTRL  W_CTRL (
        .Instr                   (Winstr),

        .A3                      (WA3),
        .RegWrite                (WRegWrite),
        .WDsrc                   (WWDsrc)
    );

    // WDsrc is my Mem2Reg
    // MemtoReg is my 
    // A3 is the actualA3
    // RegDst is the sign of rd
    // MemtoReg is the sign of load