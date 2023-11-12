C:/ISE/14.7/ISE_DS/ISE/bin/nt64/fuse -nodebug -prj mips.prj -o mips.exe mips_tb
mips.exe -nolog -tclbatch mips.tcl > output.txt & timeout 15