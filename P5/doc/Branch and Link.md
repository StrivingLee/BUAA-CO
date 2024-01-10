Branch and Link 应该改RegWrite、RegAddr、Mem2Reg

其中的 Branch 仿照 beq 即可，Link 需要在后面加入判断写 31 还是 0 

NPC 要改一下，要流水 check 信号

每一级的 RegAddr 都要改一下
