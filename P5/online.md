# 第二次P5课上

## 第一题

r类型计算，没记题



## 第二题

jalrr

当 $rs \neq rd$ 时跳转并链接寄存器，否则不进行任何操作

这个题的结果貌似是D级直接出的（？），我复用的branch and link的数据通路，不知道直接做能不能做



## 第三题

lwtkr

load word to kernel register

读出数据 $< 0x80000000$ 时写 $k_0$，即 26 号；

否则写 $k_1$，即 27 号

没过，绷