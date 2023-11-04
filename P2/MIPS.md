# MIPS

> *Updated: 2023-10-22*

[TOC]

# 入门简介

## MIPS 汇编

### 汇编语言

由于硬件方面的原因，计算机中的数据都是以**二进制**的形式表示的，这也代表着，CPU 所直接处理的都是一条条二进制**机器码**指令。而这些单纯的机器码是很难以阅读和理解的，因此人们发明了比机器语言稍微高级的一种程序语言——**汇编语言**（Assembly Language）。事实上，与其说汇编语言是一种语言，不如说它是一种**助记符**——用一些易于理解的符号代表特定含义的机器码，用**标签**（Label）来替代地址。

相比于 C、Java 这些高级语言，汇编语言要低级的多，它和机器码几乎是一一对应的，一般用于**贴近于硬件**的编程，正如我们的计组实验。我们在这里学习汇编语言，一方面是为了让同学们通过学习汇编语言来理解计算机底层硬件的**运行过程**，另一方面是使用汇编语言来编写**测试程序**验证我们设计的 CPU 的正确性。

**由于汇编语言涉及到的知识点众多，部分知识点十分琐碎，建议在第一遍学习时不要陷入细节问题之中，快速阅览整章，对汇编语言有一个大概认识之后再回过头来将第一遍学习中不理解的点逐个攻克。**

### MIPS 汇编

不同架构的 CPU 都有各自独特的汇编语言，例如我们将会使用的 MIPS 汇编语言就是专门用于 **MIPS 体系结构** CPU 的汇编语言。MIPS 汇编的最大特点就是指令的**结构比较单一**，所有的指令都可以翻译成 **32 位二进制的机器码**，指令的组成也大都只有 **R、I、J** 这三类（依照格式进行的分类，后面会详细讲解）。

这一特点让他看起来有些“死板“，因为大多数指令并不需要使用 32 位机器码才能表示，一般 10 位、20 位就已经足够了。从这点来看 MIPS 汇编确实比较**浪费存储空间**，这也是 MIPS 架构 CPU 不被主流所喜的重要原因。不过，有弊就有利，MIPS 汇编这种固定的指令格式非常具有**规律性。**可想而知，相对于其它架构的 CPU，MIPS 架构 CPU 的设计难度相对较低，很适合我们这些初学者。而它的这些规律性，会使我们在设计 MIPS 体系结构的 CPU 的过程中，更充分地体会到**工程化设计**给我们带来的便利，更容易理解 CPU 的整体构造。

### MARS（MIPS ASSEMBLER AND RUNTIME SIMULATOR)

MARS 是一个轻量级的、用于教学的 MIPS 汇编语言**集成开发环境**（IDE）。它由密苏里州立大学开发，基于 **Java 环境**运行，完全绿色且免费。我们的课程即使用此软件来进行 MIPS 汇编语言的学习、编写和运行。

在我们的实验中，选择 Mars 的原因主要有以下几点：

- Mars 是用于 MIPS 汇编语言的 IDE，和我们的设计的 CPU 相同。
- Mars 的 Help 文档中，对指令、伪指令、系统调用等各种功能都有详细的介绍与使用样例，便于查阅使用。
- 无论是正常程序还是异常处理程序，Mars 上都能很好的运行，同时还能够按需求导出程序代码运行于我们的 CPU 程序中。
- 最重要的是，Mars 中的指令都是在他内部的 CPU 模型上运行的，无论单周期还是流水线，它内部的 CPU 模型都是我们实验设计的黄金校验模型，对我们的 CPU 设计有很大的指导作用。

## 基础知识

### 存储单位

字（Word）、字节（Byte）、半字（Half-Word）、位（Bit）

1Word = 2Half-Word = 4Byte = 32Bit

### 存储方式

大端存储和小端存储。我们的实验中使用的就是小端存储。

采取小端存储的方式，将32位的数据0x12345678存储到内存中，首地址是0x00。那么，内存地址为0x02的这一字节中存储的数据是多少？

0x34

## **寄存器简介**

### **什么是寄存器？**

寄存器是 CPU 的组成部分之一，是一种**高速存储器**（甚至是 CPU 可以使用的最高速的一种存储器），可以用来暂存指令，数据，地址等。由于寄存器的成本较高，一般的 CPU 中只有数量很有限的寄存器可供使用。

在 MIPS 体系结构中，CPU 对数据的操作均是基于寄存器的。内存中的数据需要先使用读取（load）类指令保存到寄存器才可使用。操作完成的数据也不能直接保存到内存中，需要使用装载（store）类指令保存至内存中。

在我们实验中的 CPU 是 32 位 CPU，一次能处理的最大位数即为 32 位，绝大部分寄存器也均是 1 字大小的（即 4 字节，也就是 32 位）。

### **MIPS 中的 32 个通用寄存器**

在一般的（至少是本课程所需要用的）MIPS 汇编程序中，比较常用的是 **32 个通用寄存器**。所谓通用寄存器，代表它没有明确规定的用途，程序员可以随意对他们赋值、取值，同时他们的值也可以直接参与到各种指令之中。然而，虽然冠有通用的头衔，程序员们还是会以一定的规则来使用它们，这是为了便于程序员之间的交流，同时也是为编译器等工具定下了一定的标准。

这 32 个通用寄存器有两种命名方式，一种是按序号命名 `$0~$31`（注意前面有个美元的符号），一种就是按功能命名，如下表：

| registers | Name     | usage                      |
| :-------- | :------- | :------------------------- |
| $0        | $zero    | 常量0                      |
| $1        | $at      | 保留给汇编器使用的临时变量 |
| \$2-$3    | \$v0-$v1 | 函数调用返回值             |
| \$4-$7    | \$a0-$a3 | 函数调用参数               |
| \$8-$15   | \$t0-$t7 | 临时变量                   |
| \$16-$23  | \$s0-$s7 | 需要保存的变量             |
| \$24-$25  | \$t8-$t9 | 临时变量                   |
| \$26-$27  | \$k0-$k1 | 留给操作系统使用           |
| $28       | $gp      | 全局指针                   |
| $29       | $sp      | 堆栈指针                   |
| $30       | $fp      | 帧指针                     |
| $31       | $ra      | 返回地址                   |

特别地，对于 `$0` 和 `$1` 两个寄存器：

- `$0` 一般不能用于赋值，但这不代表你对它赋值就是错的。在实际中，你可以对 `$0` 进行赋值，但它的值会始终保持为 0。也就是说对 `$0` 赋值并不违反语法，但没有实际效果。
- `$1` 保留给汇编器，一般不使用此寄存器(使用该寄存器可能会导致难以发现的 bug，具体原因请在编写 MIPS 汇编时注意扩展指令是如何翻译成普通指令的)

### **三个特殊寄存器**

- **PC（Program Counter）**：这个寄存器想必已经在理论课上讲解过了。它用于存储当前 CPU 正在执行的指令在内存中的地址。需要注意的是，这个寄存器的值不能用常规的指令进行取值和赋值，但这并不意味着不能做到，只是麻烦一些。那么，怎样对其取值、赋值呢？这可以作为一个思考的题目，在之后的学习中自行探索。（提示：跳转）
- **HI**：这个寄存器用于乘除法。它被用来存放每次乘法结果的**高 32 位**，也被用来存放除法结果的**余数**。
- **LO**：HI 的孪生兄弟。它被用来存放每次乘法结果的**低 32 位**，也被用来存放除法结果的**商**。

> 正好有道题目考过了，记忆方式：乘法很显然，除法的话，rem 是伸出来的，商是放到后面的，大概记一下

### **CP0 寄存器**

当我们的 CPU 设计推进到比较深入的阶段时，我们就需要对**异常和中断**进行处理，届时我们就会使用到 CP0 寄存器。

CP0 是一个系统控制**协处理器**，而 CP0 寄存器则是该协处理器工作时需要用到的一些寄存器。在我们的实验中，只会用到其中的 4 个寄存器：SR、Cause、EPC 和 PRId。

这里先介绍一下这几个寄存器的职能，具体细节在 P7 时会详细讲解。

- **SR：**用于系统控制，决定是否允许异常和中断
- **Cause：**记录异常和中断的类型
- **EPC：**保存异常或中断发生时的 PC 值，也就是发送异常或中断时 CPU 正在执行的那条指令的地址。当处理完成之后，CPU 会根据这个地址返回到正常程序中继续往下执行。
- **PRId：**处理器 ID，用于实现个性的寄存器。

上面所述的那些寄存器是 MIPS 体系结构和我们的课程中常用的重要的寄存器，他们都是 32 位的。但寄存器的范围很广，上述的寄存器只是他们的一部分。除他们以外，还有许多寄存器被用于临时之用，或许都没有名字，而他们的真正应用，需要同学们在自己设计 CPU 时自行合理安排。

# MIPS指令集架构

主要是汇编语言、机器码、扩展指令、伪指令

> 总的方法是看高老板的指令集，多看多查就会了

指令可以不使用寄存器，如无条件跳转j指令

MIPS指令手册解读

通过实例来理解sw、lw、sb、lb等存取指令的作用

要注意sw是把rt存进去，不是存到rt

几个跳转范围



## 认识 MIPS 汇编指令

### 初识指令

在真正开始掌握 MIPS 汇编指令之前，我们需要先知道，什么是「指令」。指令，即是由处理器指令集架构（Instruction Set Architecture，可以理解为计算机体系结构中对程序相关的部分所做的定义）定义的处理器的独立操作，这个操作一般是运算、存储、读取等。一个指令在 CPU 中真正的存在形式是高低电平，也可以理解为由 01 序列组成的机器码。但因为机器码人类难以阅读和理解，所以指令一般由汇编语言来表示，也就是我们俗称的汇编指令。从这个角度上来说，汇编指令只是指令的一种表示形式而已，其实质是一样的。

一条指令的功能较为单一，一般不具有复杂的逻辑。例如「将某两个寄存器的值相加并存入另一个寄存器」，或者是「如果某个寄存器的值满足某个条件则跳转至某条指令」。不过，虽然这些指令很简单，但最终，我们可以用它们组合出丰富多彩、功能强大的程序。

那么，指令究竟长什么样呢？让我们来一起看一小段汇编程序：

```mips
.data
.text
.global main
main:
addi $t0,$0,100 # tag
ori $t1,$0,200
add $t2,$t1,$t2
sub $t3,$t2,$t1
lui $t4,233
ori $v0,1
ori $a0,2333
mthi $t1
ori $a0,2333
mthi $t1
syscall
nop
loop:
j loop
nop
```

其中tag标记的 `addi $t0, $0, 100` 就是一条指令，它的含义为“将 `$0` 寄存器的值加上 100，并将结果存入 `$t0` 寄存器”。

需要注意的是，虽然其主要由指令构成，但汇编语言并非全部由指令组成。上面的代码中，第 5-14、16-17 行为严格意义上的指令，其余有标签、伪指令等。相信看了上面一段代码样例，你已经找出了指令的规律，下面我们就来详细地进行解读。

### 指令的格式

在 MIPS 汇编语言中，指令一般由一个指令名作为开头，后跟该指令的操作数，中间由空格或逗号隔开。指令的操作数的个数一般为 0-3 个，每一个指令都有其固定操作数个数。一般来说，指令的格式如下：

*指令名* *操作数 1*, *操作数 2*, *操作数 3*

不过，也有如下的指令格式，一般用于存取类指令：

*指令名* *操作数 1*, *操作数 3(操作数 2)*

所谓操作数，即指令操作所作用的实体，可以是寄存器、立即数或标签，每个指令都有其固定的对操作数形式的要求。而标签最终会由汇编器转换为立即数。所谓立即数，即在指令中设定好的常数，可以直接参与运算，一般长度为 16 位二进制。而标签，用于使程序更简单清晰。标签用于表示一个地址，以供指令来引用。一般用于表示一个数据存取的地址（类似于数组名）、或者一个程序跳转的地址（类似于函数名，或者 C 语言中 `goto` 的跳转目标）。在 MIPS 汇编中（以及其他大部分汇编语言中），标签用如下的方式写出：

**`name:`**

其中的「name」代表这个标签的名称，可以自行取名。

常见的指令格式样例：

```mipsasm
add $s0,$a0,$a1
addi $s0,$a0,12
mult $s1,$s2
beq $a1,$a2,-2
blez $s1,-2
jr $ra
j 0x00003014
```

当然，前面说过，可以使用标签来代替某个地址，因此也可以以如下方式书写：

```mipsasm
beq $a1,$a2,loop
j loop
```

这里的 `loop` 就是一个标签，他所代表的是一段代码的起始地址。在进行汇编时，汇编器会自动把标签转换成我们所需要的立即数，这样就不用我们自己去计算这些地址偏移量，简化了编程难度。

注意：在 MARS 中，跳转指令只能使用标签来进行跳转，不能使用立即数！

> 标签最终会由汇编器转化为立即数

由此可以看出，在 MIPS 汇编语言中，操作数的形式并非绝对严格固定的，而是具有一定的灵活度。虽然在 MIPS 标准指令集中，一条机器码指令的格式是固定的，但汇编器可以将多种形式的汇编指令转换为同样意思的机器码指令。因此，许多指令有比标准写法简单的写法。这部分内容会在后面进行讲解（详见「扩展指令」），或者也可以自行查阅 MARS 的帮助文档。

为了更好的理解汇编指令，下一小节将详细讲解 MIPS 机器码指令，这一汇编指令转换后的形式。

**PS**：在本教程中，没有特殊说明的情况下都不需要考虑到延迟槽的存在。



### 后面摆烂了



# MARS的获取与使用

## MARS 简介

浪费时间

## 下载与配置

浪费时间，虚拟机都有

## 界面介绍

浪费时间

## 按钮功能测试

> 导出机器码的图标示意是0101，很好理解
>
> F1：帮助
>
> F7：单步运行

## 编写、运行与调试

### 运行配置

在运行之前，我们需要让汇编器编译我们的程序。我们的程序的内存中的数据和代码都存储在内存中，各个部分的存储位置（在内存中的地址）需要我们来指定。点击菜单栏中的「Settings」→「Memory Configuration」，弹出如图 5 的窗口，其中有三种设置可供我们选择。左侧的选择框即用来选择使用何种配置，右侧写明了具体的各个关键位置在此种配置下的具体位置。选中想使用的配置后，即可点击「Apply and Close」来应用配置并关闭窗口。

在程序运行之前，一定要检查配置是否与预想的相同。在我们的实验中，使用 Compact，Data at Address 0 这个配置。

### 运行程序

1. 点击编译按钮 ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\MIPS_button5.png) ，就会进入运行界面
2. 如果代码有语法问题误会高亮显示错误行，并在 MARS 信息区输出提示信息
   ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\mips_3_6_1.png)
3. 代码语法无误将会进入运行调试界面。如下图，其中代码段窗口中黄色高亮的那一行代表将要运行（还未运行）的指令。
   ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\mips_3_6_2.png)
4. 在工具栏的中右侧有 6 个运行按钮，他们的功能为：
   * 摆了
5. 除此之外，MARS 还可以控制程序运行的速度，控制的滑动条就在工具栏的最右侧。如图，通过左右滑动其来调整每秒运行的指令数。
6. 由于软件方面的原因，在运行时可能会遇到些 bug，这时**重新编译运行**即可。



### 查看数据

前文已经讲了寄存器和内存窗口的位置，在程序运行的过程中，我们可以从这些窗口看到寄存器和内存的相应变化。

当程序运行至影响到相应寄存器或内存的指令时，MARS 会令响应的寄存器或内存地址高亮，以方便我们查看。如下图：

![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\mips_3_6_3.png)



好多图片，摆了





## 编写运行测试

一些运行时的数据变化的题目



## 代码与数据的导出

### 导出方式

在计组实验中，我们使用 MARS 编写汇编程序的目的是让汇编程序运行在我们的 CPU 中，同时用MARS 来验证程序运行结果的正确与否。因此，我们需要从 MARS 中将代码（机器码）导出，以导入我们的 CPU 中。

导出的步骤如下：

1. 点击工具栏中的导出按钮 ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\2.6.3.3.png)

2. 选择想要导出的数据范围（代码段 `.text` 或数据段 `.data`），和导出格式（对于代码段一般我们选择 **Hexadecimal Text**），点击 Dump To File，选择保存文件名和地址即可导出，如下图。

   ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\mips_3_7_1.png)

   > 导出代码可以直接操作，导出数据需要运行一次才能产生数据

### 使用命令行操作

#### 命令行操作的功能

上文所述的导出功能，只能对 .text(0x00003000-0x00003024) 和 .data(0x00000000-0x00000ffc) 这两部分内存进行导出。而在我们的实验中，还需对其他部分进行导出，例如异常处理程序，位于 .ktext(0x00004180-0x00004ffc)。

为了解决这个问题，MARS 提供了一个解决方案——命令行操作。使用命令行可以让你自己设定你所需要的导出内容。

> 注意：需要在 Mars 的安装目录下运行命令行

#### 官方使用指南

MARS 提供了详细的文档来指导如何使用命令行。

1. 打开 MARS，点击工具栏右侧的 Help ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\MIPS_button9.png)

2. 按下图圈注的选项来选择即可看到命令行的官方使用方法

   ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\mips_3_7_2.png)

#### 使用样例

导出中断处理程序，命令如下：

```
java -jar E:\Mars4_5.jar a db mc CompactDataAtZero dump 0x00004180-0x00004ffc HexText E:\code_handler.txt E:\source.txt
```

解析：

- `E:\Mars4_5.jar` 是 MARS 的文件路径

- `a db mc CompactDataAtZero dump` 这些参数的功能请自行查阅帮助文档

- `0x00004180-0x00004ffc` 是需要导出的地址范围

- `HexText` 表示导出的是 16 进制码

- `E:\code_handler.txt` 是 16 进制码输出文件路径

- `E:\source.txt` 是源文件路径

同学们请根据自己文件路径和需要将上述部分根据自己的情况进行更改，如果想进一步了解 Mars 的命令行操作，请参考 MARS 官方文档中 MARS -> Command 部分。如果同学们有兴趣可以尝试编写 bat 脚本文件，免去每次导出都要敲一串命令行指令的痛苦，这部分留作自学内容，请大家自行上网搜集资料进行学习。



## 导出测试

按照我们要求设置好各数据段的初始地址，即选择Compact,Data at Address 0这个选择后，正常代码导出时的导出范围是？

0x00003000 - 0x00003000 + (n - 1) * 4 n为指令的个数

![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\2.6.7.1.png)

导出的是Code列数据





# MIPS汇编程序解析

## 第一个汇编程序

现在，我们通过几个简单的汇编程序，理解汇编语言的形式和各个指令的用途。同学们可以把这些代码复制到自己的 MARS 编辑器中，并在自己的电脑上运行一遍，注意 MARS 调试功能的使用，使得同学们可以更清楚地看到寄存器中数值的变化，明白各个指令的意义。有关循环的一些内容，在后文中会有详细的解释。

下面以一个经典的题目为例，编写我们的第一个汇编程序。

题目内容：输出 “Hello World”

**文本代码**：

```mips
.data
str: .asciiz    "Hello World"

.text
la  $a0, str
li  $v0, 4
syscall

li  $v0, 10
syscall             
```

这是最简单的一个 MIPS 汇编程序，同学们可以把这段代码复制到 MARS 中，在运行之前确保（Mars->Settings->Memory Configuration）为 Compact,Data at Address 0。这个选项，代表数据（.data）段的地址是从 0x0 开始，程序（.text）段的地址是从 0x3000 开始。

下面我们一行一行地分析这段代码。

第 1 行 `.data`，代表变量的声明和分配从这里开始

第 2 行 `str: .asciiz “Hello World”`，代表分配了一定的内存空间，用来存储这个字符串，字符串最后有一个 ’\0’，str 是这个字符串的标签 (label)

第 4 行的 `.text` 代表程序从这里开始

第 5 行的 `la`，是一个扩展指令，在按 F3 快捷键之后进入 Execute 页面，可以看到这一个指令被转换成了 `addi $4, $0, 0`；同理，第 6 行和第 8 行的 `li`，也是一个扩展指令，这一个指令被转换成了 `addiu $2, $0, 4` 和 `addiu $2, $0, 10`

第 7 行和第 9 行的 `syscall`，会根据当前的 `$v0` 寄存器的值，进行相应的操作，比如执行第 7 行 `syscall` 的时候，`$v0=4`，此时就会输出 `$a0` 寄存器指向的字符串，执行第 10 行 `syscall` 的时候，`$v0=10`，此时程序结束运行。有关 `syscall` 的说明，可以按快捷键 F1，在 MIPS -> Syscalls 页面中查到相应的用法。

这个 MIPS 汇编程序在运行的时候，先把 str 的地址 (0x0) 赋值给 `$a0`，然后令 `$v0=4`，执行`syscall`，输出 `$a0` 寄存器指向的字符串 ”Hello World”，直到遇到 ’\0’ 为止，最后令 `$v0=10`，执行 `syscall`，结束程序。

汇编语言与我们之前所学习的 C 语言还是有很大的区别，由于汇编语言的主体代码中并没有变量名、函数名、各种运算符号和语句块。我们仅能通过有限的 32 个寄存器以及众多的汇编指令和标签来实现我们之前所学的 C 语言所能够实现的功能。实际上 C 语言代码在经过编译后也会转换成汇编程序代码再进一步翻译成机器码，有兴趣的同学可以自行搜索相关资料进行学习，将来在操作系统和编译这两门课程中你们还将继续与这些汇编程序打交道。

如果认真阅读了上面的代码，想必已经体会到了汇编指令在可读性方面的巨大缺陷，所以请务必为自己编写的汇编程序代码加上注释，防止代码写完之后自己都看不懂。



## 一个简单的循环例子

下面以一个简单题目为例，说明在 MIPS 中如何使用循环。

题目内容：输入一个数 *n*，输出$1+2+3+...+n$（保证 *n* 和输出结果都在 int 的范围之内）

**文本代码**：

```mips
.text
li  $v0,5
syscall                 # 输入一个整数，输入的数存到 $v0 中
move $s0, $v0           # 赋值，$s0 = $v0
li  $s1, 0              # $s1 用于存储累加的值，$s1 = 0
li  $t0, 1              # $t0 是循环变量

loop:
bgt $t0, $s0, loop_end  # 这里用了一个扩展指令 bgt,当 $t0 > $s0 的时候跳转到 loop_end
add $s1, $s1, $t0       # $s1 = $s1 + $t0
addi $t0, $t0, 1        # $t0 = $t0 + 1
j   loop                # 无条件跳转到 loop 标签

loop_end:
move $a0, $s1           # 赋值，$a0 = $s1
li  $v0, 1              # $v0 = 1，在 syscall 中会输出 $a0 的值
syscall         
li  $v0,10              # $v0 = 10
syscall                 # 结束程序          
```

> bgt的使用避免了复杂的sub和bne判断，有效节约了时间
>
> 伪指令的学习暂时不着急，随学随记
>
> bgt：前 > 后时跳转
>
> move：后面的寄存器赋值给前面的寄存器

在运行之前确保（Mars -> Settings -> Delayed branching）前面不要打钩，即不考虑延迟槽，遇到跳转指令立刻跳转，不执行跳转指令之后的指令。（在 MIPS 教程和 P2 部分，如果不对延迟槽加以说明，我们都不用考虑延迟槽）

相比于”第一个汇编程序“小节中的输出 ”Hello world“ 的程序，这里多了 `syscall` 输入和输出整数的用法，以及 `move`、`bgt` 扩展指令，在 Execute 页面中对照 Basic 列和 Source 列的不同，就可以明白那条扩展指令是什么意思。利用这些扩展指令，可以简化我们编写汇编代码的工作量，并使得我们的汇编代码更加清晰。

![image](D:\Programing\ComputerOrganization\CscorePicture\MIPS\mips_4_2_1.png)



## 在 MIPS 中使用数组

下面以一个简单题目为例，说明在 MIPS 中如何使用数组。

题目内容：输入一个整数 *n*$（2 \leq n \leq 10）$，接下来 *n* 行，每行一个整数（在 int 范围内），在输出的时候先输出 `The numbers are:`，然后把这 *n* 个整数按照输入顺序输出，两个数字中间一个空格，行末可以有空格。

**样例输入**：

```mips
4
2
3
1
4
```

**样例输出**：

```mips
The numbers are: 2 3 1 4
```

**文本代码**：

```mips
.data
array: .space 40           # 存储这些数需要用到数组，数组需要使用 10 * 4 = 40 字节
                           # 一个 int 整数需要占用 4 个字节，需要存储 10 个 int 整数
                           # 因此，array[0] 的地址为 0x00，array[1] 的地址为 0x04
                           # array[2] 的地址为 0x08，以此类推。

str:   .asciiz "The numbers are:\n"
space: .asciiz " "

.text
li $v0, 5
syscall                    # 输入一个整数
move $s0, $v0              # $s0 is n
li $t0, 0                  # $t0 循环变量

loop_in:
beq $t0, $s0, loop_in_end  # $t0 == $s0 的时候跳出循环
li $v0, 5
syscall                    # 输入一个整数
sll $t1, $t0, 2            # $t1 = $t0 << 2，即 $t1 = $t0 * 4
sw $v0, array($t1)         # 把输入的数存入地址为 array + $t1 的内存中
addi $t0, $t0, 1           # $t0 = $t0 + 1
j loop_in                  # 跳转到 loop_in

loop_in_end:
la $a0, str
li $v0, 4
syscall                    # 输出提示信息
li $t0, 0
loop_out:
beq $t0, $s0, loop_out_end
sll $t1, $t0, 2            # $t1 = $t0 << 2，即 $t1 = $t0 * 4
lw $a0, array($t1)         # 把内存中地址为 array + $t1 的数取出到 $a0 中
li $v0, 1
syscall                    # 输出 $a0
la $a0, space
li $v0, 4
syscall                    # 输出一个空格
addi $t0, $t0, 1
j loop_out

loop_out_end:
li $v0, 10
syscall                    # 结束程序
```

这里使用了 `lw` 和 `sw` 指令，对内存进行读写操作。`lw` 和 `sw` 要求地址**对齐到字**（即地址必须为 4 的倍数），否则会产生异常。由于字符串的长度不确定，并且打印字符串（`$v0` 为 4）的 `syscall` 对 `$a0` 的值没有对齐要求，因此在一般情况下，会把字符串的声明放在最后。同学们可以尝试把 str 的声明挪到 array 声明的前面，如果运行程序时产生了异常，则可以尝试让 str 字符串增加或减少一些字符，直到内存指令不再出现异常。

> .space申请的是**字节空间**，不是位空间，也不是字空间，注意下



## 在 MIPS 中使用二维数组

下面再以一个简单题目为例，说明在 MIPS 中如何使用二维数组。

题目内容：输入两个数 *m* 和 *n*$（1 \leq m \leq 8，1 \leq n \leq 8）$，代表有一个 *m* 行 *n* 列的矩阵，接下来 $m*n$ 行每行一个 int 范围内的整数，依次输入矩阵的元素，最后输出这个矩阵（每两个数字中间一个空格，行末可以有多余空格，最后可以有多余回车）

**样例输入**：

```mips
2
3
1
2
3
4
5
6
```

**样例输出**：

```mips
1 2 3 
4 5 6 
```

**文本代码**：

```mips
.data
matrix: .space  256             # int matrix[8][8]   8*8*4 字节
                                # matrix[0][0] 的地址为 0x00，matrix[0][1] 的地址为 0x04，……
                                # matrix[1][0] 的地址为 0x20，matrix[1][1] 的地址为 0x24，……
                                # ……
str_enter:  .asciiz "\n"
str_space:  .asciiz " "

# 这里使用了宏，%i 为存储当前行数的寄存器，%j 为存储当前列数的寄存器
# 把 (%i * 8 + %j) * 4 存入 %ans 寄存器中
.macro  getindex(%ans, %i, %j)
    sll %ans, %i, 3             # %ans = %i * 8
    add %ans, %ans, %j          # %ans = %ans + %j
    sll %ans, %ans, 2           # %ans = %ans * 4
.end_macro

.text
li  $v0, 5
syscall
move $s0, $v0                   # 行数
li  $v0, 5
syscall
move $s1, $v0                   # 列数
# 这里使用了循环嵌套
li  $t0, 0                      # $t0 是一个循环变量

in_i:                           # 这是外层循环
beq $t0, $s0, in_i_end
li  $t1, 0                      # $t1 是另一个循环变量
in_j:                           # 这是内层循环
beq $t1, $s1, in_j_end
li  $v0, 5
syscall                         # 注意一下下面几行，在 Execute 页面中 Basic 列变成了什么
getindex($t2, $t0, $t1)         # 这里使用了宏，就不用写那么多行来算 ($t0 * 8 + $t1) * 4 了
sw  $v0, matrix($t2)            # matrix[$t0][$t1] = $v0
addi $t1, $t1, 1
j   in_j
in_j_end:
addi $t0, $t0, 1
j   in_i
in_i_end:
# 这里使用了循环嵌套，和输入的时候同理
li  $t0, 0

out_i:
beq $t0, $s0, out_i_end
li  $t1, 0
out_j:
beq $t1, $s1, out_j_end
getindex($t2, $t0, $t1)
lw  $a0, matrix($t2)            # $a0 = matrix[$t0][$t1]
li  $v0, 1
syscall
la  $a0, str_space
li  $v0, 4
syscall                         # 输出一个空格
addi $t1, $t1, 1
j   out_j
out_j_end:
la  $a0, str_enter
li  $v0, 4
syscall                         # 输出一个回车
addi $t0, $t0, 1
j   out_i

out_i_end:
li  $v0, 10
syscall
```

注意这里使用了宏，使得程序代码更为简洁，同学们可以在 Execute 页面中比较 Basic 和 Source 这两列的不同。

除此之外，同学们可以在 MARS 编辑器中按 F1 快捷键，阅读 MARS 的帮助文档，也可以在写程序的时候阅读一下代码补全的提示信息，从中也可以找到指令集文档中没有说明的指令，阅读这些帮助文档对同学们编写汇编程序有较大的帮助。MIPS 教程中只介绍了有限的几个指令，更多教程中没有介绍的指令还等待同学们的探索。



## 求 Fibonacci 数的程序

下面给出的是求前 12 个 Fibonacci 数的汇编程序。后面将以此为例，进行程序解析。

**文本代码**：

```mips
.data
fibs: .space   48           # "array" of 12 words to contain fib values
size: .word  12             # size of "array"
space:.asciiz  " "          # space to insert between numbers
head: .asciiz  "The Fibonacci numbers are:\n"

.text
la   $t0, fibs              # load address of array
la   $t5, size              # load address of size variable
lw   $t5, 0($t5)            # load array size
li   $t2, 1                 # 1 is first and second Fib. number
sw   $t2, 0($t0)            # F[0] = 1
sw   $t2, 4($t0)            # F[1] = F[0] = 1
addi $t1, $t5, -2           # Counter for loop, will execute (size-2) times

loop:
lw   $t3, 0($t0)            # Get value from array F[n]
lw   $t4, 4($t0)            # Get value from array F[n+1]
add  $t2, $t3, $t4          # $t2 = F[n] + F[n+1]
sw   $t2, 8($t0)            # Store F[n+2] = F[n] + F[n+1] in array
addi $t0, $t0, 4            # increment address of Fib. number source
addi $t1, $t1, -1           # decrement loop counter
bgtz $t1, loop              # repeat if not finished yet.
la   $a0, fibs              # first argument for print (array)
add  $a1, $zero, $t5        # second argument for print (size)
jal  print                  # call print routine.
li   $v0, 10                # system call for exit
syscall                     # we are out of here.

print:
add  $t0, $zero, $a0        # starting address of array
add  $t1, $zero, $a1        # initialize loop counter to array size
la   $a0, head              # load address of print heading
li   $v0, 4                 # specify Print String service
syscall                     # print heading

out:
lw   $a0, 0($t0)            # load fibonacci number for syscall
li   $v0, 1                 # specify Print Integer service
syscall                     # print fibonacci number
la   $a0, space             # load address of space for syscall
li   $v0, 4                 # specify Print String service
syscall                     # output string
addi $t0, $t0, 4            # increment address
addi $t1, $t1, -1           # decrement loop counter
bgtz $t1, out               # repeat if not finished
jr   $ra                    # return
```

1~7 行：变量声明与分配(伪指令)

8~14 行：初始化与寄存器分配

16~28 行：循环计算并保存 Fibonacci 数

30~47 行：输出提示语句和 Fibonacci 数

> MIPS 汇编的风格：先定义变量，有早期C语言的美，记得要把空格也当作变量声明了
>
> 这里的print负责初始化和输出提示语句
>
> out负责输出计算好的数字和空格

运行结果为：

The Fibonacci numbers are:
1 1 2 3 5 8 13 21 34 55 89 144 



## 变量声明与定义

这部分使用到的就是在 MIPS 架构指令集一节中初步接触到的伪指令，在该程序中这些伪指令主要用途是标识数据段和代码段的位置，并为声明的数据分配空间。

```mips
.data
fibs: .space   48           # "array" of 12 words to contain fib values
size: .word  12             # size of "array"
space:.asciiz  " "          # space to insert between numbers
head: .asciiz  "The Fibonacci numbers are:\n"

.text
```

在 MARS 中的 Help 文档 MIPS -> Directives 一栏，对所有的伪指令都做了简要的介绍，如果大家想要进一步了解各个伪指令的具体用法，请自行上网搜索。接下来仅具体介绍程序中出现的这几条伪指令。(格式中 [XXX] 请用对应的数据替换)

1） `.data`

格式：.data [address]

说明：

- 定义程序的数据段，初始地址为 address，若无 address 参数，初始地址为设置的默认地址。
- 需要用伪指令声明的程序变量需要紧跟着该指令。比如该程序中的 fibs, size, space, head 这四个变量。

\2) `.text`

格式：.text [address]

说明：

- 定义程序的代码段，初始地址为 address，若无 address 参数，初始地址为设置的默认地址。
- 该指令后面就是程序代码。
- 在 MARS 中如果前面没有使用 `.data` 伪指令，可以不使用 `.text` 直接编写程序代码，代码将放置在前面设置的代码段默认地址中，但如果前面使用了 `.data` 伪指令，务必在代码段开始前使用 `.text` 进行标注。

\3) `.space`

格式：[name]: .space [n]

说明：

- 申请 n 个**字节未初始化**的内存空间，类似于其他语言中的**数组声明**。
- 这段数据的初始地址保存在标签 `name` 中。
- name 的地址是由 `.data` 段的初始地址加上前面所申请的数据大小计算得出的。由于前面申请的空间大小不定，有可能会出现后来申请的空间没有字对齐的情况，从而在使用 `sw`,`lw` 一类指令时出现错误，所以在申请空间时尽可能让 n 为 4 的倍数，防止在数据存取过程中出现问题。
- 在本例中，事先申请了 48 个字节也就是 12 个字的内存空间，用来保存我们之后计算出来的 12 个 Fibonacci 数，地址标签为 fibs。

\4) `.word`

格式：[name]: .word [data1],[data2] ….

说明：

- 在内存数据段中以**字**为单位连续存储数据 data1, data2,… (也就是将 datax 写入对应的 1 个字的空间，注意 .word 和 .space 的区别)
- 这段数据的初始地址保存在标签 name 中。计算方式与上面相同。
- 在本例中，把需要计算的 Fibonacci 数的个数保存在了内存数据段，地址标签为 size。

\5) `.asciiz`

格式：[name]: . asciiz “[content]”

说明：

- 以字节为单位存储字符串，末尾以 NULL 结尾。
- 这个字符串在内存数据区的初始地址保存在标签 name 中。
- 注意 `.asciiz` 与 `.ascii` 这两条伪指令的区别。
- 由于 `.asciiz` 是**按字节存储**，可能会导致之后分配的空间首地址**无法字对齐**的情况发生，请大家自行思考解决方法。
  - 取整字节倍数
  - 放在最后声明
  
- 本例中，声明了两个字符串，一个是输出时需要用到的空格符，一个是输出语句，地址标签分别为 space 和 head。



## 宏的使用



### 什么时候要用到宏？

在我们的汇编代码中，可能会出现很多需要停止程序运行的地方，我们可以使用如下代码：

```mips
li  $v0, 10
syscall
```

并把这段代码复制粘贴到许多地方。但是这样的代码多了，会导致代码过于冗长，复用性差，不利于阅读。

同学们在编写汇编程序时，尤其时有关矩阵的程序，可能会频繁地使用具有较高相似度的代码段，尤其是在通过行数和列数获取矩阵中的元素的时候，需要频繁地计算(行数 * 最大列数 + 列数) * 4这样的数，代码如下（假设矩阵的最大列数为 8，行数存在 `$t0` 中，列数存在 `$t1` 中，最终结果计算到 `$t2` 中）：

```mips
sll $t2, $t0, 3
add $t2, $t2, $t1
sll $t2, $t2, 2
```

在编写程序的时候，我们可能会把这一小段代码复制多次并粘贴到不同的地方，对于矩阵乘法而言可能还要改一下寄存器的编号，稍微一个不注意就会产生难以发现的 bug。因此，我们应当想办法杜绝这种问题的发生，提高代码的复用性。

宏 (macro) 就是用来解决这个问题的方案，我们可以使用宏来提高代码的复用性，让这种问题得以解决。



### 宏的用法

宏分为两种，不带参数的宏和带参数的宏。

不带参数的宏，定义的方式如下：

```mips
.macro macro_name
# 代码段
.end_macro
```

第一个例子适合用不带参数的宏解决，我们可以定义这样一个宏：

```mips
.macro done
li  $v0, 10
syscall
.end_macro
```

此时，在需要程序停止运行的地方，使用 done 语句，就可以让程序在那里退出。汇编器会把所有的 macro_name 语句替换成代码段；在第一个例子中，汇编器把所有的 done 语句替换成

```mips
li  $v0, 10
syscall
```

这样就实现了代码复用。

带参数的宏，定义的方式如下：

```mips
.macro macro_name(%parameter1, %parameter2, ...)
# 代码段
.end_macro
```

和不带参数的宏不同的是，带参数的宏在 macro_name 后面有若干个用括号括起来的形式参数，每两个形式参数中间用逗号隔开，参数名前面有一个百分号。

第二个例子适合用带参数的宏解决，我们可以定义这样一个宏：

```mips
.macro  getindex(%ans, %i, %j)
    sll %ans, %i, 3
    add %ans, %ans, %j
    sll %ans, %ans, 2
.end_macro
```

其中 %i 代表行数，%j 代表列数，%ans 就是计算出来的结果 $ ((\%i * 8 + \%j ) * 4)$ 。使用 `getindex($t2, $t0, $t1)` 来调用这个宏，汇编器会用这段代码替换它，同时 %ans 被替换成 `$t2`，%i 被替换成 `$t0`，%j 被替换成 `$t1`，因此最终会被替换成

```mips
sll $t2, $t0, 3
add $t2, $t2, $t1
sll $t2, $t2, 2
```

在矩阵乘法中，只需要替换调用宏的语句，问题就会被轻松解决，同时代码的复用性得到了提高，代码也更容易被人读懂。

在汇编程序中，还有一种和C语言中 #define 类似的宏定义，一般用于常量的定义上，那就是 `.eqv`。`.eqv` 用法如下：

```
.eqv EQV_NAME string
```

汇编器会把所有 EQV_NAME 的地方替换成 string，这可以用来定义一些常量。

在 P8 中，可能需要用汇编语言对数码管进行一些控制，控制数码管显示数字，每一个数字都有自己的编码，因此可以用 `.eqv` 对这些编码进行定义，例如：

```mips
.eqv    TUBECHAR_0  0x7E
.eqv    TUBECHAR_1  0x30
.eqv    TUBECHAR_2  0x6D
```

使得代码更加清晰，并且避免了代码中出现各种意义不明的数字。



## 伪指令测试

### 分配寄存器

这部分对应着代码中的 8~14 行，主要是做一些初始化工作，并为寄存器分配功能。

```mips
la   $t0, fibs        # load address of array
la   $t5, size        # load address of size variable
lw   $t5, 0($t5)      # load array size
li   $t2, 1           # 1 is first and second Fib. number
sw   $t2, 0($t0)      # F[0] = 1
sw   $t2, 4($t0)      # F[1] = F[0] = 1
addi $t1, $t5, -2     # Counter for loop, will execute (size-2) times
```

联想 MIPS 汇编中常用的 32 个通用寄存器的功能。

- 前两行所使用的 `la` 指令是 Mars 在标准指令集基础上扩充的一条指令，用于获取**标签**所指向的地址。比如 `la $t0, fibs` 就将 fibs 这个标签对应的地址 0x00000000 存入了 `$t0` 寄存器，用于之后向里面存入 Fibonacci 数。
- `la $t5, size` 和 `lw $t5, 0($t5)` 两行使用 `$t5` 寄存器保存所需要计算的 Fibonacci 数的总个数。首先用 `la` 将 size 的地址载入 `$t5` 中，再用 `lw` 指令从内存中的 `$t5` 所保存的地址 (因为偏移量为 0) 开始读取一个字 (也就是 12) 写入 `$t5` 中。
- `li` 指令也是一条扩展指令，可以直接往寄存器中写入一个 32 位的**立即数**，在这里向 `$t2` 这个寄存器中写入了 1，也就是斐波拉契数列的前两个元素的值，11、12 行是把前两个已知的 Fibonacci 数存入到 fibs 数组空间中，也就是 `$t0` 寄存器中所保存的地址对应的空间。
- 最后一行是使用 `$t1` 寄存器保存剩余需要计算的 Fibonacci 数的个数，之后每计算出一个 Fibonacci 数，`$t1` 就会自减。当 `$t1` 减为 0 时，代表计算任务已经完成。



### 循环运算

这部分功能比较单一，就是循环计算出 Fibonacci 数并将其保存至 fibs 数组中，对应着 loop 标签下的 16~28 行。

```mips
loop:
lw   $t3, 0($t0)      # Get value from array F[n]
lw   $t4, 4($t0)      # Get value from array F[n+1]
add  $t2, $t3, $t4    # $t2 = F[n] + F[n+1]
sw   $t2, 8($t0)      # Store F[n+2] = F[n] + F[n+1] in array
addi $t0, $t0, 4      # increment address of Fib. number source
addi $t1, $t1, -1     # decrement loop counter
bgtz $t1, loop        # repeat if not finished yet.
la   $a0, fibs        # first argument for print (array)
add  $a1, $zero, $t5  # second argument for print (size)
jal  print            # call print routine.
li   $v0, 10          # system call for exit
syscall               # we are out of here.
```

- 前两个 `sw` 指令是从 fibs 数组中提取前两个 Fibonacci 数 $F(n−1) 和 F(n−2)$ ，`add $t2, $t3, $t4` 根据公式 $F(n)=F(n-1)+F(n-2)$ 计算出新的 Fibonacci 数，然后通过 `sw $t2, 8($t0)` 存入到数组空间中 (注意这三条 `lw` 指令的偏移量，可以联想 C 语言中**数组指针**的用法)
- 接下来两行 `addi $t0, $t0, 4` 和 `addi $t1, $t1, -1` 是修改 `$t0` 和 `$t1` 的值用于下次循环计算。(对 `$t0` 的操作可以联想 C 语言中指针的自增操作)
- `bgtz` 指令的含义是当寄存器中的值大于 0 时跳转到标签所在的位置，也就是说当 $\$t1>0 $ 也就是运算还没有结束时，每次运行到`bgtz` 指令都会跳转到 `loop` 标签处计算下个 Fibonacci 数。
- `jal print` 表示跳转到 `print` 处开始输出，并将下一行的地址保存在 `$ra` 寄存器中，使得在调用完成 print 函数后还可以返回到下一行执行结束程序的部分代码。
- 这里的最后两行是 MARS 中结束程序的标准流程，更多的 `syscall` 用法请自行阅读 MARS 帮助文档，下一小节将更详细地介绍系统调用的相关注意事项。



### 系统调用

本部分的功能就是输出提示语句和 12 个 Fibonacci 数，为了实现这些功能，这里使用了 MIPS 汇编中的**系统调用**。这些系统调用是专门用来实现输入 / 输出，文件读取和终止运行等功能的一些指令，在 Mars 的 Help 文档中同样有详尽的介绍与使用说明。

这些系统调用的模式大都相同，一般都是**为 `$a0` 和 `$v0` 寄存器赋值**，执行 **`syscall`** 指令，然后汇编器就会根据 `$v0` 寄存器中的值进行不同的操作。下面会对程序中出现的进行解析。

```mips
print:
add  $t0, $zero, $a0  # starting address of array
add  $t1, $zero, $a1  # initialize loop counter to array size
la   $a0, head        # load address of print heading
li   $v0, 4           # specify Print String service
syscall               # print heading

out:  
lw   $a0, 0($t0)      # load fibonacci number for syscall
li   $v0, 1           # specify Print Integer service
syscall               # print fibonacci number
la   $a0, space       # load address of spacer for syscall
li   $v0, 4           # specify Print String service
syscall               # output string
addi $t0, $t0, 4      # increment address
addi $t1, $t1, -1     # decrement loop counter
bgtz $t1, out         # repeat if not finished
jr   $ra              # return
```

1. 字符串输出 代码：

   ```mips
   la $a0, addr
   li $v0, 4
   syscall
   ```

   说明：

   - 首先把要输出的字符串在内存中的**首地址**赋给 **`$a0`** 寄存器，然后汇编器就会根据 `$a0` 中的地址将字符串输出。
   - 在内存中存储的字符串是以 **NULL('\0')** 作为结束符，输出时遇到这个结束符就会停止。

   > 即，先把串存给 \$a0，再用后两行输出 $a0 的值
   >
   > 以$a0寄存器中存储的地址作为要输出字符串在内存中的首地址，根据这个首地址从内存中以字节为单位读取数据，一直读到null也就是“\0”结束，这些读取的数据就是要输出的字符串。

2. 整数输出

   代码：

   ```mips
   li $v0, 1
   syscall
   ```

   说明：

   - 这个系统调用的功能就是把 **`$a0`** 寄存器中的数据以**整数**的形式输出。

   > 也是操作 \$a0 啊

3. 结束程序

   格式：

   ```mips
   li $v0, 10
   syscall
   ```

   说明：

   - 结束程序

#### 指令解析：

- 前两个 `add` 指令表示从 `$a0`, `$a1` 计算出需要输出的数组的首地址和大小。

- `la $a0, head` 表示获取需要输出的提示信息字符串的首地址。

  ```mips
  la   $a0, head        # load address of print heading
  li   $v0, 4           # specify Print String service
  syscall               # print heading
  ```

  这三行使用字符串输出系统调用将字符串输出。

- `lw $a0, 0($t0)` 表示从内存中获取一个斐波拉契数，接下来的两行为使用系统调用将其输出。

- `mips la $a0, space # load address of spacer for syscall li $v0, 4 # specify Print String service syscall # output string`

  这三行表示输出一个空格字符。

- 接下来两行 `addi` 指令是为下次循环做准备，利用 `bgtz` 指令判断是否输出已经结束，如果没有结束跳回到 `out` 标签处进行下次输出。

- `jr $ra` 表示完成输出返回到原代码 27 行处结束程序，即

  ```mips
  li    $v0, 10
  syscall
  ```



# MIPS 汇编程序设计



## 条件语句

汇编语言本身是十分灵活的，但是这种灵活性可能会造成理解和编写上的困难，而模式化可以降低理解上的难度也可以让大家编写汇编语言代码时更加得心应手。这里将以程序中两种极其普遍的语句——条件语句与循环语句为例，做简单分析。首先来看条件语句：

```mips
.text
li $t1, 100             #t1 = 100
li $t2, 200             #t2 = 200
slt $t3, $t1, $t2       #if(t1 < t2) t3 = 1 
beq $t3, $0, if_1_else
nop
#do something
j if_1_end              #jump to end
nop
if_1_else:
#do something else

if_1_end:
li $v0, 10
syscall
```

这里展示了一个最简单的 if/else 语句，这段代码实现的功能非常简单，就是判断 `$t1` 和 `$t2` 两个寄存器中所储存的值的大小。如果 `$t1 < $t2` 则 do something 否则 do something else。

这段代码的核心实际上在第 5 行，第 5 行判断是否跳转决定了到底是执行 do something 还是执行 do something else。如果判断条件 `$t1 < $t2` 为真，即 `t3 == 1`，则不会跳转，继续执行 do something ，否则 `t3==0`，会跳转到 if_1_else 继续执行 do something else, 从而实现了 `if($t1 < $t2) {do something} else {do something else}` 的功能

同学们可以进一步思考 if/else if/else 语句以及switch语句该如何编写？如果条件变得更加复杂又该如何编写？

> 请见 黑书 MIPS.md 文档



## 循环语句

```mips
.text
li $t1, 100             #n = 100
li $t2, 0               #i

for_begin1:             #for (int i = 0; i < n; i++)
slt $t3, $t2, $t1       #{
beq $t3, $0, for_end1  
nop        
#do something
addi $t2, $t2, 1        #i++
j for_begin1
nop                     #}    

for_end1:
li $v0, 10
syscall
```

上面的代码给出了一个标准 C 语言中 for 循环语句的汇编语言写法。

- 2，3 行初始化了 n 和 i.
- 6 行判断 `i < n` 是否为真，如果为真则第 7 行的 `beq` 不会跳转，否则跳转到 15 行结束程序。
- 9 行可以替换为需要在循环体内执行的代码。
- 10 行自增循环变量。
- 11 行跳回 5 行进行判断。

同学们请在此基础上进行扩充，并结合上一小节条件语句的写法，尝试一下如何编写多重循环语句，以及 while 循环和 do while 循环，并比较这几个循环之间的区别。

接下来我们将开始学习编写较为复杂的汇编程序。



## 需求分析

为了帮助大家更快的掌握汇编语言编程，在这里我们将带着大家一起设计一个简单的排序程序：对输入的 n 个整数进行排序后输出。相信在大一学习 C 语言时，同学们都已经学习过了相关的算法和 C 语言程序编写方法。那么使用汇编语言后，程序的行数势必会变长，但其原理是完全相同的。

事实上，为了实现功能，我们有两种实现思路：

- 只要求最终程序结果相同
- 在程序运行结果相同的情况下，使用汇编语言满足 C 语言程序的结构，模仿 C 语言程序的控制流、数据结构等。

简单想一想，前一种实现方法的行数势必会比后一种实现方法的代码量要少。但长远来看，由于汇编语言具有高度的灵活性而结构性、抽象性较差，当我们试图修改或扩展程序功能时，其结果就是难以修改，并且也难以查错。同时，也为了能更加详细地讲解汇编语言程序设计，我们将采用第二种实现思路来进行编写。

**注意：**在本讲的代码中，考虑了延迟槽，也就是说执行每条跳转指令后（无论是否跳转）都会执行它的下一条指令。延时槽的知识在此并不重要，只是让大家先认识一下，在后面的学习中会作为重点内容出现。而在本部分的代码中，将不会真正用到延时槽（即所有延时槽中都为 `nop` 指令）。

接下来我们可以把对上述排序题的分析总结为编程思路：

1. 要有输入输出提示语句
2. 先输入整数的个数 n，再输入 n 个整数。
3. 能够读取 n 个整数输入，并保存在内存中。
4. 要对 n 个整数进行从小到大排序，这里采用选择排序法。
5. 将排序后的整数进行输出。



## 程序结构设计

为了方便理解，我们仿照C语言来对程序进行分解。按照功能模块来分，程序可以分为 6 个部分：数据定义、主函数、输入部分、输出部分、排序部分、寻找最小值部分。

注意，虽然这里使用了“函数”一词，但这只是为了便于理解，事实上并不需要写成一个完整的“函数”，只需能将不同的功能区分开，便于理解即可。

 ![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\2.4.2.1.svg)

1. 首先，程序需要声明几个内存区域来存储数列、字符串、临时变量等。
2. 然后来到主函数，主函数依次调用输入函数、排序函数和输出函数。
3. **不必使用内存存储所有的变量**，对于一些简单的变量，可以直接用寄存器存储
4. 排序函数循环调用寻找最小值部分，传递给寻找最小值部分想要遍历的范围，而寻找最小值部分则返回一个最小值的地址，以供排序部分进行交换。
5. 最终，程序结束，完成功能。

 关于通用寄存器的使用，实际上是一种**约定**，为了方便程序员之间的沟通而制定的规则。

1. 对于 s 寄存器而言，被调用者需要保证寄存器中的值在调用前后不能发生改变——对应到实际操作中，如果你想要编写一个子函数，那么在这个子函数中使用的所有 s 寄存器，都必须要在函数的开头入栈，在函数的结尾出栈，以确保其值在这个函数被调用前后不会发生变化。
2. 对于 t 寄存器而言则刚好相反，你编写的子函数中用到 t 寄存器的地方无需做任何保存，随意使用即可——因为维护 t 寄存器是上层函数的任务。这也就是所谓的 “s 寄存器由被调用者维护，t 寄存器由调用者维护”。
3. 需要注意的是，这仅仅是一个约定而已。你当然可以不遵守这种规范，但代价就是程序的合作和维护将变得举步维艰。在同学们编写 mips 代码的时候，尤其是涉及到子函数的编写时，我们推荐严格按照 mips 的规范进行，确保一个函数在被调用前后，其中所用到的 s 寄存器的值不会被改变。

一个调用者（即父函数）并不能预知其将要调用的子函数（即被调用者）会使用到哪些 t 寄存器，但可能在调用时并不想失去自己正在使用的某个 t 寄存器中的数据。

在这种情况下，为了维持 t 寄存器中的数据，调用者有两种选择：一是将所有 t 寄存器中的数据移至 s 寄存器，函数调用结束之后再移回来；二是将自己希望保留的 t 寄存器压入栈中，函数调用结束之后再弹回来。

第一种方法看似简单，但实际上引入了很多潜在的问题，比如：s 寄存器用完了怎么办？怎么确保子函数一定不会破坏 s 寄存器中的数据？在自动生成汇编代码（如编译）的过程中，怎样确定哪些 s 寄存器是可以用来保存 t 寄存器中的数据的？

因此，采用第二种方法，是一个更优雅，也更规范的做法。在第二种方法里，不再需要去考虑寄存器之间如何倒腾，只需要借助 sp 指针，不停地用栈去存取自己需要的数据就可以了。这减少了程序员的心智负担，规范了函数调用的过程，也方便了编译器的实现。

总而言之，调用者维护 t 寄存器，被调用者维护 s 寄存器的意义，就在于让代码更易于模块化。在这种约定下，调用者不需要去考虑被调用者的具体细节，被调用者也不需要去考虑自己被调用的方式。这使得 mips 代码可以以函数为单位进行模块化开发。

临时寄存器：

![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\temp1.png)

![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\temp2.png)

![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\save1.png)

![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\save2.png)



## 数据声明与分配

数据存储空间，指的是在内存中的空间

寄存器虽然也可以提供数据，但更重要的功能是临时存储以供计算

本节重点：

- 伪指令（Directive）
- 标签（Label）
- 内存的布局、分配

Mars没有提供栈，所以需要自己用数组开辟



## 控制流

用于产生复杂的程序逻辑

分支

循环

上面代码有，先摆了..



## 输入与输出

使用标签提示接下来为输入部分



## 函数调用

 之所以单独把函数调用作为一个章节来讲，是因为函数调用比普通的程序流控制（分支，跳转，判断）更加复杂。它是各种简单的程序流控制语句的组合。除此之外，函数调用还有具有某些特定的规范，这就更加大了用汇编语言书写函数的难度。我们可以总结出函数的如下特性：

- 函数是一个代码块，可以由**指定语句调用**，并且在执行完毕后**返回调用语句**。
- 函数通过传参，可以实现代码的**复用**。
- 函数只能通过返回值等有限手段对函数外造成影响。
- 函数里依然可以**嵌套调用**函数。

 我们会在下面的章节逐步用汇编语言实现函数的特性。我们会提供需要翻译的 C 代码，并且给出示例汇编程序，并且在必要处提供经典错误的汇编代码，希望同学们可以在自己的电脑上运行并调试代码，达到学习和避免错误的目的。

### 代码块

 我们要翻译的 C 程序：

```c
#include<stdio.h>

int sum(int a, int b)
{
    int tmp = a + b;
    return tmp;
}

int main()
{
    int a = 2;
    int b = 3;

    int ans = sum(a, b);

    printf("%d\n", ans);

    return 0;
}
```

 对于函数调用，可以看成在函数调用的这条语句，**程序跳转到函数的内容处开始执行，执行完整个函数以后再跳转回到调用处向下执行。**这个跳转过程可以用汇编中的跳转指令和标签实现，格式如下：

```mips
# function call
jal funtion_name


# function
function_name:
    <function-content>
    jr $ra
```

 为什么这里我们选择 `jal` 而非 `j` 呢？我们知道j指令可以直接跳转到 label 的位置，`jal` 与其相比多了一个将 \t{PC+4}\t 写入 31 号寄存器的过程。这样做的最大的好处在于，当我们函数结束时，我们可以通过`jr` 函数跳转回调用函数的位置。就像我们在 C 语言中，函数运行完后，会返回到之前调用它的位置，并执行下一条指令。所以在函数调用时，我们往往会搭配使用 `jal` 和 `jr`。

 按照这种方法，我们可以得到我们的第一个翻译版本：

```mips
.macro end
    li  $v0, 10
    syscall
.end_macro

.text
main:
    li      $s0, 2  # int a = 2;
    li      $s1, 3  # int b = 3;

    jal     sum     # function call

    li      $v0, 1
    move    $a0, $s2
    syscall         # print ans

    end

sum:
    add     $s2, $s0, $s1 
    jr      $ra
```

这样的 19 - 21 行，才是真正的函数体，我们规定了入口和出口，这块代码，只有按照我们规定的方法才能进入和出去。

### 复用代码

 仅仅写好了代码块，并没有完全实现函数的功能。因为我们没有办法实现代码的复用，比如 C 程序：

```c
int sum(int a, int b)
{
    int tmp = a + b;
    return tmp;
}

int main()
{
    int a = 2;
    int b = 3;
    int c = 4;
    int d = 5;

    int sum1 = sum(a, b);
    printf("%d", sum1);
    sum2 = sum(c, d);
    printf("%d", sum2);
    return 0;
}
```

 按道理，这个是可以复用 `sum` 的代码的，这也是函数很重要的一个功能，但是我们原来的那个函数操作的是 `$s0, $s1, $s2`，**显然没有办法操作其他寄存器**，所以为了复用代码，就必须让一些特定寄存器作为“接收器”，对于不同的参数，都采用同一组寄存器来存储他们的值，也就是我们说的**形参寄存器** `$a0, $a1, $a2, $a3`。同样的道理，对于返回值，也是需要指定特定的寄存器。

 根据这种思想，我们可以对这个代码进行翻译：

```mips
.macro end
    li      $v0, 10
    syscall
.end_macro

.macro printStr(%str)
    la      $a0, %str
    li      $v0, 4
    syscall
.end_macro

.data
space: .asciiz " "

.text
    li      $s0, 2
    li      $s1, 3
    li      $s2, 4
    li      $s3, 5

    move    $a0, $s0 #传参
    move    $a1, $s1
    jal     sum
    move    $s4, $v0 #获得返回值

    li      $v0, 1
    move    $a0, $s4
    syscall

    printStr(space)

    move    $a0, $s2
    move    $a1, $s3
    jal     sum
    move    $s5, $v0

    li      $v0, 1
    move    $a0, $s5
    syscall

    end

sum:
    #传参过程
    move    $t0, $a0
    move    $t1, $a1
    #函数过程
    add     $v0, $t0, $t1
    jr      $ra
```

 可以看到，这样就实现了代码的复用。另外，`$a0, $a1, $a2, $a3` 只是一种程序员的约定，用其他的寄存器或者存储入内存中，都是可以的。当需要传递的参数超过 4 个的时候，我们一般将多出的参数存入内存。在 MIPS 中，我们使用内存的一个主要方法就是利用栈，我们可以通过控制栈指针寄存器 `$sp`，完成对内存的访问。

### 避免对外界造成影响

那么这样是不是函数功能就完善了呢，我们说不是的，因为函数还有一个重要的功能是不对函数体外的变量造成不必要的影响，考虑下面的 C 程序：

```c
int sum(int a, int b)
{
    int tmp = a + b;
    return tmp;
}

int main()
{
    int a = 2;
    int b = 3;
    int c = 4;
    int sum1 = sum(a, b);
    int sum2 = sum(sum1, c);
    printf("%d", sum2);
    return 0;
}
```

 这段代码如果翻译成汇编，有可能会造成错误，以下是错误代码：

```mips
.macro end
    li      $v0, 10
    syscall
.end_macro

.text
    li      $s0, 2
    li      $s1, 3
    li      $t0, 4

    move    $a0, $s0 #传参
    move    $a1, $s1
    jal     sum
    move    $s4, $v0 #获得返回值

    move    $a0, $s4
    move    $a1, $t0
    jal     sum
    move    $s5, $v0

    li      $v0, 1
    move    $a0, $s5
    syscall

    end

sum:
    #传参过程
    move    $t0, $a0 #t0被修改了
    move    $t1, $a1
    #函数过程
    add     $v0 $t0, $t1
    jr      $ra
```

输出的答案是7，而不是9，这是因为我们储存 `c` 的寄存器是 `$t0`，而 `$t0` 在 `sum` 函数中被修改了，因此造成了 bug 。所以我们需要**保证函数不会对外部造成影响，方法就是应用栈**。

 栈在这里的作用是**保存和恢复函数使用的寄存器**，函数应该计算返回值，但不应该产生其他的负面影响。

 那么其实有两种使用栈的位置，第一种是在**调用函数前**，这种被称为**调用者保存**（在这里就是在 `main` 里面出入栈）：

```mips
.macro end
    li      $v0, 10
    syscall
.end_macro

.text
    li      $s0, 2
    li      $s1, 3
    li      $t0, 4

    move    $a0, $s0 #传参
    move    $a1, $s1
    sw      $t0, 0($sp) #入栈
    addi    $sp, $sp, -4
    jal     sum
    addi    $sp, $sp, 4 #出栈
    lw      $t0, 0($sp) 
    move    $s4, $v0 #获得返回值

    move    $a0, $s4
    move    $a1, $t0
    sw      $t0, 0($sp) #入栈
    addi    $sp, $sp, -4
    jal     sum
    addi    $sp, $sp, 4 #出栈
    lw      $t0, 0($sp)
    move    $s5, $v0

    li      $v0, 1
    move    $a0, $s5
    syscall

    end

sum:
    #传参过程
    move    $t0, $a0
    move    $t1, $a1
    #函数过程
    add     $v0 $t0, $t1
    jr      $ra
```

 另一种是**被调用者保存**（在 `sum` 里出入栈）：

```mips
.macro end
    li      $v0, 10
    syscall
.end_macro

.text
    li      $s0, 2
    li      $s1, 3
    li      $t0, 4

    move    $a0, $s0 #传参
    move    $a1, $s1
    jal     sum
    move    $s4, $v0 #获得返回值

    move    $a0, $s4
    move    $a1, $t0
    jal     sum
    move    $s5, $v0

    li      $v0, 1
    move    $a0, $s5
    syscall

    end

sum:
    #入栈过程
    sw      $t0, 0($sp)
    addi    $sp, $sp, -4
    #传参过程
    move    $t0, $a0
    move    $t1, $a1
    #函数过程
    add     $v0 $t0, $t1
    #出栈过程
    addi    $sp, $sp, 4
    lw      $t0, 0($sp)
    #return
    jr      $ra
```

 关于具体采取哪一种办法，其实是涉及对寄存器种类的划分的。同学们可以结合教材自行理解。

> 逆天，经典说话说一半

### 嵌套函数调用

 现在我们考虑在函数中调用函数的情况：

```c
int sum(int a, int b)
{
    return a + b;
}
int cal(int a, int b)
{
    return a - sum(b, a);
}

int main()
{
    int a = 2;
    int b = 3;
    int ans = cal(2, 3);
    printf("%d", ans);
}
```

我们按原来的理解将其翻译为汇编，会得到错误代码：

```mips
.macro end
    li $v0, 10
    syscall
.end_macro

.text
    li      $s0, 2
    li      $s1, 3

    move    $a0, $s0
    move    $a1, $s1
    jal     cal
    move    $s5, $v0

    li      $v0, 1
    move    $a0, $s5
    syscall

    end

sum:
    #传参过程
    move    $t0, $a0
    move    $t1, $a1
    #函数过程
    add     $v0, $t0, $t1
    #return
    jr      $ra

    cal:
    #传参过程
    move    $t0, $a0
    move    $t1, $a1
    #调用sum的过程
    move    $a0, $t1
    move    $a1, $t0
    jal     sum
    move    $t2, $v0
    #运算a-sum(b, a)
    sub     $v0, $t0, $t2 
    #return
    jr      $ra
```

 这段代码会陷入死循环，是因为寄存器 `$ra` 中存在的值，在调用完 `sum` 以后因为 `jal` 的作用会变为指向第 38 行，然后第 42 行跳转的时候，就又会跳到38行，然后到了 42 行又跳回 38 行，如此循环，所以我们发现，**一旦一个函数不是叶子函数**（叶子函数内不会调用函数），**就需要保存和恢复 `$ra`**。所以有正确代码：

```mips
.macro end
    li $v0, 10
    syscall
.end_macro

.text
    li      $s0, 2
    li      $s1, 3

    move    $a0, $s0
    move    $a1, $s1
    jal     cal
    move    $s5, $v0

    li      $v0, 1
    move    $a0, $s5
    syscall

    end

sum:
    #将 $t0 和 $t1 入栈
    sw      $t0, 0($sp)
    addi    $sp, $sp, -4
    sw      $t1, 0($sp)
    addi    $sp, $sp, -4
    #传参过程
    move    $t0, $a0
    move    $t1, $a1
    #函数过程
    add     $v0, $t0, $t1
    #将 $t0 和 $t1 出栈
    addi    $sp, $sp, 4
    lw      $t1, 0($sp) 
    addi    $sp, $sp, 4
    lw      $t0, 0($sp) 
    #return
    jr      $ra

cal:
    #将 $ra 入栈
    sw      $ra, 0($sp)
    addi    $sp, $sp, -4
    #传参过程
    move    $t0, $a0
    move    $t1, $a1
    #调用 sum 的过程
    move    $a0, $t1
    move    $a1, $t0
    jal     sum
    move    $t2, $v0
    #运算a-sum(b, a)
    sub     $v0, $t0, $t2
    #将ra出栈
    addi    $sp, $sp, 4
    lw      $ra, 0($sp) 
    #return
    jr      $ra
```

由此我们可以总结出，**嵌套函数调用的重要意识就是“用栈保存跳转地址”。**

### 递归函数调用

 经过层层铺垫，我们终于来到了最后的部分，也就是递归函数的汇编翻译。其实递归函数的本质就是**一个在函数体内调用自身的嵌套函数**。它与其他函数相比，没有过大的差异，我们只需要牢记上面的函数的特性和实现方法，就可以很轻松的翻译成功。

 下面我们实现一个阶乘程序，这是 C 语言版本：

```c
#include <stdio.h>

int factorial(int n)
{
    if (n == 1)
    {
        return 1;
    }
    else
    {
        return n * factorial(n - 1);
    }
}

int main()
{
    printf("%d\n", factorial(5));

    return 0;
}
```

 我们给出汇编版本：

```mips
.macro end
    li      $v0, 10
    syscall
.end_macro

.macro getInt(%des)
    li      $v0, 5
    syscall
    move    %des, $v0
.end_macro

.macro printInt(%src)
    move    $a0, %src
    li      $v0, 1
    syscall
.end_macro

.macro push(%src)
    sw      %src, 0($sp)
    subi    $sp, $sp, 4
.end_macro

.macro pop(%des)
    addi    $sp, $sp, 4
    lw      %des, 0($sp) 
.end_macro

.text
main:
    getInt($s0)

    move    $a0, $s0
    jal     factorial
    move    $s1, $v0

    printInt($s1)
    end

factorial:
    # 入栈
    push($ra)
    push($t0)
    # 传参
    move    $t0, $a0
    #函数过程
    bne     $t0, 1, else
    # 基准情况
    if:
        li      $v0, 1
        j       if_end  
    # 递归情况  
    else:
        subi    $t1, $t0, 1
        move    $a0, $t1
        jal     factorial
        mult    $t0, $v0
        mflo    $v0
    if_end:
    # 出栈
    pop($t0)
    pop($ra)
    # 返回
    jr      $ra
```

 这段代码不仅集成了上面所有的所有的函数特性，而且代码风格是更加成熟的，现在我们来分析这段程序：

 首先是定义里一些宏，这些宏的定义可以化简我们的代码结构，方便我们阅读代码，并且降低出现 bug 的概率：

```mips
# 程序结束
.macro end
    li      $v0, 10
    syscall
.end_macro

# 从标准输入处得到一个整型变量，并存储到 %des 寄存器中
.macro getInt(%des)
    li      $v0, 5
    syscall
    move    %des, $v0
.end_macro

# 向标准输出中写入一个数据，这个数据保存在 %src 寄存器中
.macro printInt(%src)
    move    $a0, %src
    li      $v0, 1
    syscall
.end_macro

# 将寄存器 %src 中的数据入栈
.macro push(%src)
    sw      %src, 0($sp)
    subi    $sp, $sp, 4
.end_macro

# 将栈顶数据出栈，并保存在 %des 寄存器中
.macro pop(%des)
    addi    $sp, $sp, 4
    lw      %des, 0($sp) 
.end_macro
```

 然后分析 `main` 函数，可以看出逻辑十分简单，只是用 `jal` 的方式调用了 `factorial` 函数。这里也可以看出，对于调用者来说，递归函数的调用与非递归函数的调用并无差别。

```mips
main:
    getInt($s0)

    move    $a0, $s0
    jal     factorial
    move    $s1, $v0

    printInt($s1)
    end
```

 最后分析我们的重头戏，递归函数 `factorial`。

 因为 `factorial` 是一个递归函数，需要在内部调用函数，所以需要将 `$ra` 入栈。此外，我们在函数中使用到的 `$t0` 寄存器，也是需要保存的。函数的传参和出入栈部分写法十分普适（对于每个函数，入口和出口都是十分固定的，都是**入栈，传参，出栈，返回**这四个基本流程）：

```mips
factorial:
    # 入栈
    push($ra)
    push($t0)
    # 传参
    move    $t0, $a0
    #函数过程
        ...
    # 出栈
    pop($t0)
    pop($ra)
    # 返回
    jr      $ra
```

 然后我们来分析函数的主体：

```mips
#函数过程
    bne     $t0, 1, else
    # 基准情况
    if:
        li      $v0, 1
        j       if_end  
    # 递归情况  
    else:
        subi    $t1, $t0, 1
        move    $a0, $t1
        jal     factorial
        mult    $t0, $v0
        mflo    $v0
    if_end:
```

 从 C 代码可以看出，这个函数是一个大的分支语句，我们首先判断输入的参数是否是 1（此时参数已经从 `$a0` 处拷贝到 `$t0` 处），如果是 1，那么就是基准情况，我们将返回值（`$v0`）设置为 1 以后就结束分支了。如果输入的参数不是 1，那么就需要递归调用，我们首先获得新的参数，就是将原来的参数减 1。然后再次调用 `factorial`。

 就像 C 一样，在结束了 11 行的语句后，可以认为此时返回值 `$v0` 中已经存储着我们想要的答案，做一次乘法将结果存储在 `$v0` 中返回即可。

 请你思考，为什么我们可以这样认为“此时返回值 `$v0` 中已经存储着我们想要的答案”。必要时可以自己画图理解。



## 内存操作

### 简介

 在高级语言中，我们可以使用多维数组对内存进行多维操作，但实际上，一般这些多维数组在内存中也只是按照一维的形式连续存储的。比如二维数组 arr\[2][2] 在内存中会占用4个单位的连续空间，分别保存 arr\[0][0]、arr\[0][1]、arr\[1][0]、arr\[1][1]。

 作为低级语言，汇编语言对内存只能进行一维操作。而为了实现多维操作，我们就需要使用一些技巧了，下面会进行举例分析。

### 样例分析

 比如我们要将0~255依次赋给一个16*16的矩阵，填充方式如下图4\*4矩阵的例子。

![img](D:\Programing\ComputerOrganization\CscorePicture\MIPS\Mars_P0_test__exm.png)

使用高级语言的话只需要两个for循环嵌套，如下：

```c
int value = 0;
int arr[16][16];
for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {
        arr[i][j] = value++;
    }
}
```

 使用汇编语言的话，就需要分为三步：

- 初始化数据

```mips
.data
    data: .word 0 : 256       # storage for 16x16 matrix of words

.text
    li $t0, 16         # $t0 = number of rows
    li $t1, 16         # $t1 = number of columns
    move $s0, $zero    # $s0 = row counter
    move $s1, $zero    # $s1 = column counter
    move $t2, $zero    # $t2 = the value to be stored
```

 t0和*t*0和t1是总的行列数，s0和*s*0和s1是当前赋值的行列数，$t2就是要赋的值。

- 为一行矩阵赋值

```mips
#________ tag1 _______
loop:
    mult $s0, $t1      # $s2 = row * cols (two-instruction sequence)
    mflo $s2           # move multiply result from lo register to $s2
    add $s2, $s2, $s1  # $s2 += column counter
    sll $s2, $s2, 2    # $s2 *= 4 (shift left 2 bits) for byte offset
    sw $t2, data($s2)  # store the value in matrix element
#---------------------  

#________ tag2 _______
    addi $t2, $t2, 1   # increment value to be stored
#---------------------  

# Loop control: If we increment past last column, reset colume counter and increment row counter
#               If we increment past last row, we're finished.

#________ tag3 _______
    addi $s1, $s1, 1   # increment column counter
#---------------------  

    bne $s1, $t1, loop # not at end of row so loop back
```

 tag1代码段为当前矩阵元素对应的内存赋值，tag2和tag3代码段更新数据，最后一行判断这一行矩阵是否已完全赋值。

- 准备为下一行矩阵赋值

```mips
    move $s1, $zero    # reset column counter
    addi $s0, $s0, 1   # increment row counter
    bne $s0, $t0, loop # not at end of matrix so loop back
# We're finished traversing the matrix
    li $v0, 10         # system service 10 is exit
    syscall            # we are outta here
```

 当一行矩阵已赋完值后，更新数据，然后重新跳回到 loop 处为下一行矩阵赋值，直到整个矩阵都赋完值。



### 补充：利用Macros简化二维数组的计算

 在 MIPS 教程部分，我们学习了如何使用 macro 宏定义一些操作来简化我们的 MIPS 程序，对于二维数组的相关计算，我们可以发现，计算数组中元素的地址是一个重复且固定的算法，因此，我们计划创建一个 macro 来代替这些语句，从而减少代码行数，增加可读性，以便出错后更好的调试代码。

```mips
.macro calc_addr(%dst, %row, %column, %rank)
    # dts: the register to save the calculated address
    # row: the row that element is in
    # column: the column that element is in
    # rank: the number of lines(rows) in the matrix
    multu %row, %rank
    mflo %dst
    addu %dst, %dst, %column
    sll %dst, %dst, 2
.end_macro
```

 上图就是我们关于计算地址的 macro 了，我们精心的设计保证了运算中只改变 %dst 所代表的寄存器，避免了 macro 内部不可见的修改其他寄存器的情况的发生。这种复用代码的思想类似于函数，但是一定注意 macro 的运用中易出现的如上所述的问题，希望同学们能够熟练运用，写出易懂的汇编代码来。