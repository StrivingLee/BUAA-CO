.text
addi 	$t0, $t0, 0xfc01
mtc0 	$t0, $12			#给SR赋初值,IM全置1允许中断，属于初始化部分

#异常的产生构造主体begin
lui 	$t0, 0x8000
lui 	$t1, 0x8000
add  	$t2, $t0, $t1

ori 	$t3, $t3, 1 		#一个检测位，说明回到了异常下一条指令，也可以不要，那么就是异常一条接着一条
#异常的产生构造主体end
end: 
beq 	$0, $0, end     	#这个必须要有，因为CPU会把xxxxxx识别成RI，然后就在异常里出不去了
nop

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