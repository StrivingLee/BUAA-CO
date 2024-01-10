cd src
iverilog -o mips_tb.v.out mips_tb.v
vvp mips_tb.v.out > out.txt
cd ..
