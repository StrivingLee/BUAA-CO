.ktext 0x4180
mfc0	$k0, $12 			#取出SR的值到k0，看看对不对
mfc0	$k0, $13 			#取出Cause的值到k0，看看对不对
mfc0	$k0, $14 			#取出EPC的值到k0，看看对不对

mfc0 	$k0, $13
ori 	$k1, $0, 0x007c
and		$k0, $k1, $k0 		#这里取出了ExcCode
beq 	$0, $k0, ERET 		#如果是中断，那么就退出handler了，处理中断的方式就是接着执行这条指令
addi 	$k0, $k0, 0xffff 	#稍带手测一下beq的延迟槽
mfc0	$k0, $14 			#取出EPC的值到k0
lui 	$1, 0xffff
ori 	$1, $1, 0xfffc
and 	$k1, $k1, $1		#给EPC对齐了
addu	$k0, $k0, 4 		#给EPC+4
mtc0	$k0, $14 			#重新赋给EPC
j		ERET				#异常处理完成，处理异常的方式就是跳过这条指令
nop

ERET:
eret