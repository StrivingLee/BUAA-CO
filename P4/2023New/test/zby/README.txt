我在这里使用了别人修改版的MARS，源文件来源于网络，其余部分由自己完成

1.0
在src文件夹中放入cpu的所有.v文件，对于嵌套子模块的需要加`include "xxx.v"
`include "ALU.v"
`include "CTRL.v"
`include "DM.v"
`include "GRF.v"
`include "IFU.v"
`include "EXT.v"
例如mips.v中可能会用到这些，需要加在文件的开头

在test文件中修改Mars_prj_add的内容即.asm文件的保存地址，点击getTest.bat即可进行cpu的输出与标准输出的比较
最终的差异可以在生成的diff_result.html中查看

注：
1.由于本次设计的CPU的add和sub都是视作addu和subu实现的，所以对于测试mars文件的编写也需要用addu和subu，不过不用担心，这个程序
对Mars和CPU的导入文件做了处理，对CPU导入的依旧是add，sub的指令。
2.由于iverilog的局限性，可能会出现本应该无差异却出现有差异的情况，如果比较结果是有差异的，还请在ise中测试一次，与std比较是否相同。
确保不是由于环境造成的评测错误。
3.如果遇上向0号寄存器写入，可能std会没有输出，但cpu有输出，这种差异可以忽略。
4.可能由于python的版本不同，请自行修改getTest.bat中的python版本，一般应为python xxxx.py。

2.0
update log：
     1.修复了0号寄存器导致的比较错误
     2.增加了自动生成数据进行测评的效果
注：
1.由于label和数据都是随机生成，可能会导致产生死循环。如果对于使用过程中过长时间没有响应，请退出重新开始。
2.PC的值可能会造成错误invalid counter，请忽略这条，这是一条bug。
3.点击getTest.bat开始测试，每一组测试数据后会产生比较结果，如果没有异常，敲击回车进行下一组数据的生成测试。
4.可能由于python的版本不同，请自行修改getTest.bat中的python版本，一般应为python xxxx.py。