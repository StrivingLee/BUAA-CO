module mips (
    input clk,
    input reset
);

    wire [1: 0] TuseRs, TuseRt, TnewE, TnewM;
    wire StallFlag, PCen, DregEn, EregClr, RSstall, RTstall; // other registers enabled unconditionally, never reseted
    wire [31: 0] Finstr, Dinstr, Einstr, Minstr, Winstr; //instr in each state
    wire [31: 0] EForwardFrom, MForwardFrom, WForwardFrom; // data forwarded from E M W

    wire [31: 0] FPC, PCin;

    wire [31: 0] DPC, RD1, RD2, DEXTout, DForwardToRs, DForwardToRt;
    wire [25: 0] Dinstr_index;
    wire [15: 0] Dimm;
    wire [4: 0] Drs, Drt;
    wire [1: 0] DEXTop; 
    wire DBranch, DJalFlag, DJrFlag, DBeqFlag, DMemWrite, DRegDst, DUseInE, Dcheck, DBioalFlag, DBPNAL;
    
    wire [31: 0] EForwardToRs, EForwardToRt, ENUM1, ENUM2, EALUout, EPC, ERsDataout, ERtDataout, EEXTout;
    wire [4: 0] Ers, Ert, EA3, EWDst;
    wire [2: 0] EWDsrc, EALUop;    
    wire [1: 0] EALUsrc;
    wire EMemtoReg, newInE, ECheck, EBioalFlag;

    wire [31: 0] MPC, MALUout, MGRFrtOut, MEXTout, MDMout, MWD;
    wire [4:  0] Mrt, MA3, MWDst;
    wire [2: 0] MWDsrc;
    wire MMemWrite, MMemtoReg, Mcheck, MBioalFlag;

    wire [31: 0] WPC, WALUout, WDMout, WEXTout;
    wire [4: 0] WA3, WWDst;
    wire [2: 0] WWDsrc;
    wire WRegWrite, WBioalFlag, Wcheck;

/*****************************************************************FORWARD and STALL***************************************************************/

/********************data forward from E M W********************/
                                                               //
    assign EForwardFrom = (EWDsrc == 2) ? EEXTout :            //
                          (EWDsrc == 1) ? EPC + 8 :            //
                          0;                                   //
    assign MForwardFrom = (MWDsrc == 3) ? MALUout :            //
                          (MWDsrc == 2) ? MEXTout :            //
                          (MWDsrc == 1) ? MPC + 8 :            //
                          0;                                   //
    assign WForwardFrom = (WWDsrc == 3) ? WALUout :            //
                          (WWDsrc == 2) ? WEXTout :            //
                          (WWDsrc == 1) ? WPC + 8 :            //
                          (WWDsrc == 0) ? WDMout :             //
                          0;                                   //
                                                               //
/////////////////////////////////////////////////////////////////
                          
/*******************************************************Stall controling******************************************************/
                                                                                                                             //
    assign TuseRs = (DBranch | DJrFlag | DBioalFlag) ? 2'd0 : /*beq & jr, need grfData in D*/                                    //        //
                    (DUseInE) ? 2'd1 : /*op with ALU, need grfData in E*/                                                    //
                    /* RSdatd need not be written in DM */                                                                   //
                     2'd3; //bieji                                                                                           //
    assign TuseRt = (DBranch | DBioalFlag) ? 2'd0 : /* jr only need RSdata */                                                             //
                    (DRegDst) ? 2'd1 : /* only Rtype cal need the second grfData in ALU  */                                  //
                    (DMemWrite) ? 2'd2 : /* DM works in M */                                                                 //
                     2'd3;                                                                                                   //
                                                                                                                             //
    /*time needed to write in reg*/                                                                                          //
    assign TnewE = /* impossible to be 3 in stage E */                                                                       //
                  (EMemtoReg) ? 2'd2 : /*load from DM -> M_REG_W*/                                                           //
                  (newInE) ? 2'd1 : /*alu put out in E -> E_REG_M */                                                         //
                  0;/*no data output means no need to wait for output*/                                                      //
                                                                                                                             //
    assign TnewM = MMemtoReg ? 2'd1 : 0;                                                                                     //
                                                                                                                             //
    assign RSstall = ((TuseRs < TnewE && Drs != 0 && Drs == EWDst) || (TuseRs < TnewM && Drs != 0 && Drs == MWDst));         //    //
    assign RTstall = ((TuseRt < TnewE && Drt != 0 && Drt == EWDst) || (TuseRt < TnewM && Drt != 0 && Drt == MWDst));         //    //
                                                                                                                             //
    assign StallFlag = RSstall | RTstall;                                                                                    //
                                                                                                                             //
    assign PCen = ~StallFlag;                                                                                                //
    assign DregEn = ~StallFlag;                                                                                              // 
    assign EregClr = StallFlag;                                                                                              //
                                                                                                                             //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/**************************************************************************FETCH******************************************************************/

    F_IFU  F_IFU (
        .clk                     (clk),
        .reset                   (reset),
        .WE                      (PCen),
        .PCin                    (PCin),

        .PC                      (FPC),
        .Instr                   (Finstr)
    );

    F_REG_D  F_REG_D (
        .clk                     (clk),
        .reset                   (reset), //stall dose not reset Dreg
        .WE                      (DregEn),//stall disables Dreg
        .INSTRin                 (Finstr),
        .PCin                    (FPC),

        .INSTRout     (Dinstr),
        .PCout        (DPC) //F to D
    );

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*************************************************************************DECODE******************************************************************/

    CTRL  D_CTRL (
        .Instr                   (Dinstr),

        .rs                      (Drs),
        .rt                      (Drt),
        .imm                     (Dimm),
        .MemWrite                (DMemWrite),
        .RegDst                  (DRegDst), 
        .useInE                  (DUseInE),
        .instr_index             (Dinstr_index),
        .Branch                  (DBranch),
        .Bioal                   (DBioalFlag),
        .JrFlag                  (DJrFlag),
        .JalFlag                 (DJalFlag),
        .EXTop                   (DEXTop)
    );

    D_EXT  D_EXT (
        .imm                     (Dimm),
        .EXTop                   (DEXTop),

        .EXTout                  (DEXTout)
    );

    D_cmp  D_cmp (
        .Rsdata                  (DForwardToRs),
        .Rtdata                  (DForwardToRt),
        .check                   (Dcheck)
    );

    D_GRF  D_GRF (
        .clk                     (clk),
        .reset                   (reset),
        .WE                      (WRegWrite), //got from write back
        .A1                      (Drs),
        .A2                      (Drt),
        .A3                      (WWDst), //got from write back
        .WD                      (WForwardFrom),//got from write back
        .PC                      (WPC),
        .Instr(Winstr),

        .RD1                     (RD1),
        .RD2                     (RD2)
    );

    assign WWDst = (WBioalFlag) ? (Wcheck ? 5'd31 : 5'd0) : WA3;

/***********************D forward receiving*********************/
                                                               //
    assign DForwardToRs = (Drs == 0) ? 0 :                     //
                          (Drs == EWDst) ? EForwardFrom :      //
                          (Drs == MWDst) ? MForwardFrom :      //
                          RD1;                                 //
    assign DForwardToRt = (Drt == 0) ? 0 :                     //
                          (Drt == EWDst) ? EForwardFrom :      //
                          (Drt == MWDst) ? MForwardFrom :      //
                          RD2;                                 //
                                                               //                
/////////////////////////////////////////////////////////////////

    assign DBeqFlag = (DForwardToRs == DForwardToRt) & DBranch; //CMP gou dou bu xie

    assign DBPNAL = DBioalFlag & Dcheck;

    assign PCin = (DBeqFlag | DBPNAL) ? {{14{Dimm[15]}}, Dimm, 2'b0} + DPC + 4 :
                  (DJalFlag) ? {DPC[31: 28], Dinstr_index, 2'b0} :
                  (DJrFlag) ? DForwardToRs : 
                  FPC + 4; //NPC gou dou bu xie

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*************************************************************************EXECUTE******************************************************************/

    D_REG_E  D_REG_E (
        .clk                     (clk),
        .reset                   (reset || EregClr),
        .INSTRin                 (Dinstr),
        .PCin                    (DPC),
        .RsDatain                (DForwardToRs),
        .RtDatain                (DForwardToRt),
        .EXTin                   (DEXTout),
        .Checkin                 (Dcheck),

        .INSTRout                (Einstr),
        .PCout                   (EPC),
        .RsDataout               (ERsDataout),
        .RtDataout               (ERtDataout),
        .EXTout                  (EEXTout),
        .Checkout                (ECheck)
    );

    CTRL  E_CTRL (
        .Instr                   (Einstr),

        .MemtoReg                (EMemtoReg),  
        .Bioal                      (EBioalFlag),
        .newInE                  (newInE),  
        .rs                      (Ers),
        .rt                      (Ert),
        .A3                      (EA3),
        .WDsrc                   (EWDsrc),
        .ALUop                   (EALUop),
        .ALUsrc                  (EALUsrc)
    );

    E_ALU  E_ALU (
        .NUM1                    (ENUM1),
        .NUM2                    (ENUM2),
        .ALUop                   (EALUop),

        .ALUout                  (EALUout)
    );

/**********************E forward receiving**********************/
                                                               //
    assign EForwardToRs = (Ers == 0) ? 0 :                     //
                          (Ers == MWDst) ? MForwardFrom :      //
                          (Ers == WWDst) ? WForwardFrom :      //
                          ERsDataout;                          //
    assign EForwardToRt = (Ert == 0) ? 0 :                     //
                          (Ert == MWDst) ? MForwardFrom :      //
                          (Ert == WWDst) ? WForwardFrom :      //
                          ERtDataout;                          // 
                                                               //
    assign ENUM1 = EForwardToRs;                               //
                                                               // 
    assign ENUM2 = (EALUsrc == 0) ? EForwardToRt : EEXTout;    //
                                                               //
/////////////////////////////////////////////////////////////////

    assign EWDst = (EBioalFlag) ? (ECheck ? 5'd31 : 5'd0) : EA3;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*************************************************************************MEMORY******************************************************************/

    E_REG_M  E_REG_M (
        .clk                     (clk),
        .reset                   (reset),
        .INSTRin                 (Einstr),
        .PCin                    (EPC),
        .ALUin                   (EALUout),
        .GRFrtIn                 (EForwardToRt),
        .EXTin                   (EEXTout),
        .Checkin                 (ECheck),

        .INSTRout                (Minstr),
        .PCout                   (MPC),
        .ALUout                  (MALUout),
        .GRFrtOut                (MGRFrtOut),
        .EXTout                  (MEXTout),
        .Checkout(Mcheck)
    );

    CTRL  M_CTRL (
        .Instr                   (Minstr),

        .MemtoReg                (MMemtoReg),
        .Bioal                      (MBioalFlag), 
        .rt                      (Mrt),
        .A3                      (MA3),
        .MemWrite                (MMemWrite),
        .WDsrc                   (MWDsrc)
    );

    M_DM  M_DM (
        .clk                     (clk),
        .reset                   (reset),
        .WE                      (MMemWrite),
        .WD                      (MWD),
        .Address                 (MALUout),
        .PC                      (MPC),

        .DMout                   (MDMout)
    );

/**********************M forward controling*********************/
                                                               //
    assign MWD = (Mrt == 0) ? 0 :                              //
                 (Mrt == WWDst) ? WForwardFrom :               //
                 MGRFrtOut;                                    // 
                                                               //
/////////////////////////////////////////////////////////////////

assign MWDst = (MBioalFlag) ? (Mcheck ? 5'd31 : 5'd0) : MA3;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/***********************************************************************WRITE BACK****************************************************************/

    M_REG_W  M_REG_W (
        .clk                     (clk),
        .reset                   (reset),
        .InstrIn                 (Minstr),
        .PCin                    (MPC),
        .ALUin                   (MALUout),
        .DMin                    (MDMout),
        .EXTin                   (MEXTout),
        .Checkin                 (Mcheck),

        .InstrOut                (Winstr),
        .PCout                   (WPC),
        .ALUout                  (WALUout),
        .DMout                   (WDMout),
        .EXTout                  (WEXTout),
        .Checkout                (Wcheck)
    );

    CTRL  W_CTRL (
        .Instr                   (Winstr),

        .A3                      (WA3),
        .RegWrite                (WRegWrite),
        .WDsrc                   (WWDsrc),
        .Bioal                      (WBioalFlag)
    );

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

endmodule