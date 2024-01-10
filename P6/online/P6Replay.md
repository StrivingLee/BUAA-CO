# 2023第2次P6课上

## fdiv

就按div的数据通路加一下就好



## bslt

branch if sum lower than

主要的改动就是 NPC 中加了 GFRrt 端口，用于跳转，其他就是流水 check 信号，比较简单



## lsas

load sum of alternate series

课上wa一个点，注意 rs 和 rt 都要加暂停，但是这一个点是卡无脑阻塞的，因为有的寄存器是不会写到的，具体来说应该是高16个寄存器都不会写，所以仅当低16寄存器时才阻塞