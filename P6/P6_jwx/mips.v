`include "CMP.v"
`include "CTRL.v"
`include "D_EXT.v"
`include "D_REG_E.v"
`include "D_GRF.v"
`include "E_ALU.v"
`include "E_MandD.v"
`include "E_REG_M.v"
`include "F_PC.v"
`include "F_REG_D.v"
`include "M_REG_W.v"
module mips (
    input clk,
    input reset,

    input [31:0] i_inst_rdata,
    output [31:0] i_inst_addr,

    input [31:0] m_data_rdata,
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3 :0] m_data_byteen,
    output [31:0] m_inst_addr,
    output w_grf_we,
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr

);
    wire [1: 0] TuseRs, TuseRt, TnewE, TnewM;
    wire StallFlag, PCen, DregEn, EregClr, RSstall, RTstall, MDstall, RSget, RTget; // other registers enabled unconditionally, never reseted
    wire [31: 0] Finstr, Dinstr, Einstr, Minstr, Winstr; //instr in each state
    wire [31: 0] EForwardFrom, MForwardFrom, WForwardFrom; // data forwarded from E M W

    wire [31: 0] FPC, PCin;

    wire [31: 0] DPC, RD1, RD2, DEXTout, DForwardToRs, DForwardToRt;
    wire [25: 0] Dinstr_index;
    wire [15: 0] Dimm;
    wire [4: 0] Drs, Drt;
    wire [3: 0] DMemsrc, Dmdop;
    wire [1: 0] DEXTop, DBranch; 
    wire DJalFlag, DJrFlag, DBeqFlag, DBneFlag, DCALR, DUseInE, Dcheck;
    
    wire [31: 0] EForwardToRs, EForwardToRt, ENUM1, ENUM2, EALUout, EPC, ERsDataout, ERtDataout, EEXTout, EMDhi, EMDlo;
    wire [4: 0] Ers, Ert, EA3;
    wire [3: 0] Emdop;
    wire [2: 0] EWDsrc, EALUop;    
    wire [1: 0] EALUsrc;
    wire EMemtoReg, EnewInE, Estart, Ebusy;

    wire [31: 0] MPC, MALUout, MGRFrtOut, MEXTout, MDMout, MWD, MHIout, MLOout;
    wire [15: 0] MReadHalf;
    wire [7: 0] MReadByte;
    wire [4:  0] Mrt, MA3;
    wire [2: 0] MWDsrc;
    wire [3: 0] MMemsrc, MLoadsrc;
    wire MMemtoReg;

    wire [31: 0] WPC, WALUout, WDMout, WEXTout, WHIout, WLOout;
    wire [4: 0] WA3;
    wire [2: 0] WWDsrc;
    wire  WRegWrite;

    assign i_inst_addr = FPC;
    assign m_data_addr = MALUout;
    assign m_data_wdata = (MMemsrc == 1) ? MWD :
                          (MMemsrc == 2) ? {2{MWD[15: 0]}} :
                          (MMemsrc == 3) ? {4{MWD[7: 0]}} :
                          0;
    assign m_data_byteen = (MMemsrc == 1) ? 4'b1111 :
                           (MMemsrc == 2 && m_data_addr[1]) ? 4'b1100 : 
                           (MMemsrc == 2) ? 4'b0011 :
                           (MMemsrc == 3 & m_data_addr[1: 0] == 3) ? 4'b1000 :
                           (MMemsrc == 3 & m_data_addr[1: 0] == 2) ? 4'b0100 :
                           (MMemsrc == 3 & m_data_addr[1: 0] == 1) ? 4'b0010 :
                           (MMemsrc == 3) ? 4'b0001 :
                           0;
    assign m_inst_addr = MPC;
    assign w_grf_we = WRegWrite;
    assign w_grf_addr = WA3;
    assign w_grf_wdata = WForwardFrom;
    assign w_inst_addr = WPC;

    assign Finstr = i_inst_rdata;
    assign MReadHalf = m_data_rdata[m_data_addr[1] * 16 + 15 -: 16];
    assign MReadByte = m_data_rdata[m_data_addr[1: 0] * 8 + 7 -: 8];
    assign MDMout = (MLoadsrc == 4'd1) ?  m_data_rdata :
                    (MLoadsrc == 4'd2) ? {{16{MReadHalf[15]}}, MReadHalf} :
                    (MLoadsrc == 4'd3) ? {{24{MReadByte[7]}}, MReadByte} :
                    0;

/*****************************************************************FORWARD and STALL***************************************************************/

/********************data forward from E M W********************/
                                                               //
    assign EForwardFrom = (EWDsrc == 2) ? EEXTout :            //
                          (EWDsrc == 1) ? EPC + 8 :            //
                          0;                                   //
    assign MForwardFrom = (MWDsrc == 5) ? MLOout :             //
                          (MWDsrc == 4) ? MHIout :             //
                          (MWDsrc == 3) ? MALUout :            //
                          (MWDsrc == 2) ? MEXTout :            //
                          (MWDsrc == 1) ? MPC + 8 :            //
                          0;                                   //
    assign WForwardFrom = (WWDsrc == 5) ? WLOout :             //
                          (WWDsrc == 4) ? WHIout :             //
                          (WWDsrc == 3) ? WALUout :            //
                          (WWDsrc == 2) ? WEXTout :            //
                          (WWDsrc == 1) ? WPC + 8 :            //
                          (WWDsrc == 0) ? WDMout :             //
                          0;                                   //
                                                               //
/////////////////////////////////////////////////////////////////
                          
/*******************************************************Stall controling******************************************************/
                                                                                                                             //
    assign TuseRs = (DBranch != 0 || DJrFlag) ? 2'd0 : /*beq & bne & jr, need grfData in D*/                                 //
                    (DUseInE) ? 2'd1 : /*op with ALU, need grfData in E*/                                                    //
                    /* RSdatd need not be written in DM */                                                                   //
                     2'd3; //bieji                                                                                           //
    assign TuseRt = (DBranch != 0) ? 2'd0 : /* jr only need RSdata */                                                        //
                    (DCALR | (Dmdop > 0 & Dmdop < 5)) ? 2'd1 : /* only Rtype cal need the second grfData in ALU  */          //
                    (DMemsrc) ? 2'd2 : /* DM works in M */                                                                   //
                     2'd3;                                                                                                   //
                                                                                                                             //
    /*time needed to write in reg*/                                                                                          //
    assign TnewE = /* impossible to be 3 in stage E */                                                                       //
                  (EMemtoReg) ? 2'd2 : /*load from DM -> M_REG_W*/                                                           //
                  (EnewInE) ? 2'd1 : /*alu put out in E -> E_REG_M */                                                        //
                  0;/*no data output means no need to wait for output*/                                                      //
                                                                                                                             //
    assign TnewM = MMemtoReg ? 2'd1 : 0;                                                                                     //
                                                                                                                             //
    assign RSstall = ((TuseRs < TnewE && Drs != 0 && Drs == EA3) || (~RSget && TuseRs < TnewM && Drs != 0 && Drs == MA3));   //
    assign RTstall = ((TuseRt < TnewE && Drt != 0 && Drt == EA3) || (~RTget && TuseRt < TnewM && Drt != 0 && Drt == MA3));   //
    assign RSget = TuseRs >= TnewE && Drs == EA3;                                                                            //
    assign RTget = TuseRt >= TnewE && Drt == EA3;                                                                            //
    assign MDstall = Ebusy & (Dmdop != 0);                                                                                   //
                                                                                                                             //
    assign StallFlag = RSstall | RTstall | MDstall;                                                                          //
                                                                                                                             //
    assign PCen = ~StallFlag;                                                                                                //
    assign DregEn = ~StallFlag;                                                                                              // 
    assign EregClr = StallFlag;                                                                                              //
                                                                                                                             //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/**************************************************************************FETCH******************************************************************/

    F_PC  F_PC (
        .clk                     (clk),
        .reset                   (reset),
        .WE                      (PCen),
        .PCin                    (PCin),

        .PCout                   (FPC)
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
        .Memsrc                  (DMemsrc),
        .CALR                    (DCALR), 
        .useInE                  (DUseInE),
        .instr_index             (Dinstr_index),
        .Branch                  (DBranch),
        .JrFlag                  (DJrFlag),
        .JalFlag                 (DJalFlag),
        .EXTop                   (DEXTop),
        .mdop                    (Dmdop)
    );

    D_EXT  D_EXT (
        .imm                     (Dimm),
        .EXTop                   (DEXTop),

        .EXTout                  (DEXTout)
    );

    D_GRF  D_GRF (
        .clk                     (clk),
        .reset                   (reset),
        .WE                      (WRegWrite), //got from write back
        .A1                      (Drs),
        .A2                      (Drt),
        .A3                      (WA3), //got from write back
        .WD                      (WForwardFrom),//got from write back
        .PC                      (WPC),

        .RD1                     (RD1),
        .RD2                     (RD2)
    );

/***********************D forward receiving*********************/
                                                               //
    assign DForwardToRs = (Drs == 0) ? 0 :                     //
                          (Drs == EA3) ? EForwardFrom :        //
                          (Drs == MA3) ? MForwardFrom :        //
                          RD1;                                 //
    assign DForwardToRt = (Drt == 0) ? 0 :                     //
                          (Drt == EA3) ? EForwardFrom :        //
                          (Drt == MA3) ? MForwardFrom :        //
                          RD2;                                 //
                                                               //                
/////////////////////////////////////////////////////////////////

    CMP CMP (
        .rsData(DForwardToRs),
        .rtData(DForwardToRt),
        .check(Dcheck)
    );

    assign DBeqFlag = (DForwardToRs == DForwardToRt) & (DBranch == 1); //CMP gou dou bu xie
    assign DBneFlag = (DForwardToRs != DForwardToRt) & (DBranch == 2);

    assign PCin = (DBeqFlag | DBneFlag | (Dcheck == 1 && DBranch == 3)) ? {{14{Dimm[15]}}, Dimm, 2'b0} + DPC + 4 :
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

        .INSTRout                (Einstr),
        .PCout                   (EPC),
        .RsDataout               (ERsDataout),
        .RtDataout               (ERtDataout),
        .EXTout                  (EEXTout)
    );

    CTRL  E_CTRL (
        .Instr                   (Einstr),

        .MemtoReg                (EMemtoReg),          
        .newInE                  (EnewInE),  
        .rs                      (Ers),
        .rt                      (Ert),
        .A3                      (EA3),
        .WDsrc                   (EWDsrc),
        .ALUop                   (EALUop),
        .ALUsrc                  (EALUsrc),
        .mdop                    (Emdop)
    );

    E_ALU  E_ALU (
        .NUM1                    (ENUM1),
        .NUM2                    (ENUM2),
        .ALUop                   (EALUop),

        .ALUout                  (EALUout)
    );

    assign Estart = (Emdop > 0 && Emdop < 5) ? 1 : 0;

    E_MandD  E_MandD (
        .clk                     (clk),
        .reset                   (reset),
        .NUM1                    (ENUM1),
        .NUM2                    (ENUM2),
        .mdop                    (Emdop),
        .start                   (Estart),

        .busy                    (Ebusy),
        .MDhi                    (EMDhi),
        .MDlo                    (EMDlo)
    );
/**********************E forward receiving**********************/
                                                               //
    assign EForwardToRs = (Ers == 0) ? 0 :                     //
                          (Ers == MA3) ? MForwardFrom :        //
                          (Ers == WA3) ? WForwardFrom :        //
                          ERsDataout;                          //
    assign EForwardToRt = (Ert == 0) ? 0 :                     //
                          (Ert == MA3) ? MForwardFrom :        //
                          (Ert == WA3) ? WForwardFrom :        //
                          ERtDataout;                          // 
                                                               //
    assign ENUM1 = EForwardToRs;                               //
                                                               // 
    assign ENUM2 = (EALUsrc == 0) ? EForwardToRt : EEXTout;    //
                                                               //
/////////////////////////////////////////////////////////////////

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
        .HIin                    (EMDhi),
        .LOin                    (EMDlo),

        .INSTRout                (Minstr),
        .PCout                   (MPC),
        .ALUout                  (MALUout),
        .GRFrtOut                (MGRFrtOut),
        .EXTout                  (MEXTout),
        .HIout                   (MHIout),
        .LOout                   (MLOout)

    );

    CTRL  M_CTRL (
        .Instr                   (Minstr),

        .MemtoReg                (MMemtoReg), 
        .rt                      (Mrt),
        .A3                      (MA3),
        .Memsrc                  (MMemsrc),
        .WDsrc                   (MWDsrc),
        .Loadsrc                 (MLoadsrc)
    );


/**********************M forward controling*********************/
                                                               //
    assign MWD = (Mrt == 0) ? 0 :                              //
                 (Mrt == WA3) ? WForwardFrom :                 //
                 MGRFrtOut;                                    // 
                                                               //
/////////////////////////////////////////////////////////////////

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
        .HIin                    (MHIout),
        .LOin                    (MLOout),

        .InstrOut                (Winstr),
        .PCout                   (WPC),
        .ALUout                  (WALUout),
        .DMout                   (WDMout),
        .EXTout                  (WEXTout),
        .HIout                   (WHIout),
        .LOout                   (WLOout)

    );

    CTRL  W_CTRL (
        .Instr                   (Winstr),

        .A3                      (WA3),
        .RegWrite                (WRegWrite),
        .WDsrc                   (WWDsrc)
    );

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

endmodule