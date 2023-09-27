cd ref_CPU
iverilog -o mips_tb.v.out mips_tb.v alu.v cmp.v controller.v dm.v EX.v ext.v forward_mux.v grf.v hazardUnit.v ID.v im.v MEM.v mux.v npc.v pc.v WB.v
vvp mips_tb.v.out > ref_CPU_tempOut.txt
cd ..
cd test_CPU
iverilog -o mips_tb.v.out mips_tb.v CTRL.v D_EXT.v D_GRF.v D_REG_E.v E_ALU.v E_REG_M.v F_IFU.v F_REG_D.v M_DM.v M_REG_W.v
vvp mips_tb.v.out > test_CPU_tempOut.txt
cd ..
