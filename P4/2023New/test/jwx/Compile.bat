cd ref_CPU
iverilog -o mips_tb.v.out mips_tb.v ALU.v Controller.v DM.v EXT.v GRF.v IFU.v MUX.v NPC.v
vvp mips_tb.v.out > ref_CPU_tempOut.txt
cd ..
cd test_CPU
iverilog -o mips_tb.v.out mips_tb.v ALU.v Controller.v DM.v EXT.v GRF.v IFU.v MUX.v NPC.v
vvp mips_tb.v.out > test_CPU_tempOut.txt
cd ..
