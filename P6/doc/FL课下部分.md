## 课下部分

P5 已经完成了流水线的大部分框架性工作了，P6 要做的主要就是三件事：按照教程要求改造 DM，添加乘除槽以及添加大量指令

要求实现的指令集为 `MIPS-C3` ，即 **LB、LBU、LH、LHU、LW、SB、SH、SW、ADD、ADDU、 SUB、SUBU、MULT、MULTU、DIV、DIVU、SLL、SRL、SRA、SLLV、 SRLV、SRAV、AND、OR、XOR、NOR、ADDI、ADDIU、ANDI、ORI、 XORI、LUI、SLT、SLTI、SLTIU、SLTU、BEQ、BNE、BLEZ、BGTZ、 BLTZ、BGEZ、J、JAL、JALR、JR、MFHI、MFLO、MTHI、MTLO**，可以看出已经包括了除了浮点数运算和 CP0 协处理器之外的所有指令

第一件事情，也是最容易做的就是添加运算类的和跳转类的指令了，由于支持的指令非常非常多，建议用宏的方式，定义每一条指令的 `opcode` 和 `funct` ，例如单独建立一个文件 `def.v` 用于定义所有的控制信号和指令的 `opcode` 和 `funct` ，尽量避免在程序主体部分出现 magic number

跳转类的只需要添加 b 类跳转，由于按照 P5 的架构，由 D 级的 CMP 判断是否需要跳转，那么我们只需要修改 `CMP` 即可支持所有的指令

运算类的需要修改 `ALU` ，这里非常容易出现**有符号数、无符号数， `$signed` ， `$unsigned` 的符号问题**，建议根据课下给出的弱测数据逐一进行功能测试，确保无问题

由于 P5 的阻塞和转发是对于某一类指令做的，添加上面两类指令时必然不会出现其它新的转发阻塞问题，因此只需要将他们加到原有分类中即可

需要特别注意 `SLL、SRL、SRA、SLLV、SRLV、SRA` 这些指令，因为如果不可变的移位指令如 `SLL、SRL、SRA` ，符号是一方面问题，更重要的是他们无需使用 `$rs` 寄存器，在阻塞的时候需要特别考虑

对于上面的问题，解决方案是单独分出两类，然后阻塞特殊判断，代码如下：

```
// control.v
assign shift_s = sll | srl | sra;
assign shift_v = sllv | srlv | srav;

// stall.v
assign D_Tuse_rt = (D_branch) ? 8'd0 :
                   (D_calc_r | D_md) ? 8'd1 :
                   (D_store) ? 8'd2 :
                   8'd3;
assign D_Tuse_rs = (D_branch | D_jump_reg) ? 8'd0 :
                   (D_calc_i | (D_calc_r & !D_shift_s) | D_load | D_store | D_mt | D_md) ? 8'd1 :
                   8'd3;
```

第二件事情是实现乘除槽，我们需要模拟乘除法的时延，因此乘法需要慢 5 个周期，除法需要慢 10 个周期，乘除槽有天然的 HI 和 LO 两个寄存器，因此除了 `mflo, mfhi, mthi, mtlo` 不需要考虑转发，但是需要考虑阻塞，我们这样做

```
// control.v
assign md = mult | multu | div | divu;
assign mt = mtlo | mthi;
assign mf = mflo | mfhi;

// stall.v
wire E_stall_mdu = ((D_md | D_mt | D_mf) && (E_MDU_Busy | E_MDU_Start));
assign Stall = E_stall_rs | E_stall_rt | M_stall_rs | M_stall_rt | E_stall_mdu;
```

**注意在乘除槽处于运算过程中时，如果 D 级出现了任何与乘除槽有关的指令，我们都必须阻塞！**

此外对于乘除槽内部，我们维护一个 `tmp_HI` 和 `tmp_LO` ，乘法需要慢 5 个周期，除法需要慢 10 个周期只是假象，我们在第一个周期就能算出结果，只是我们给他存入 `tmp_HI` 和 `tmp_LO` 里面，到规定的时延之后我们再把他们转存到 `HI` 和 `LO` 里面，像这样

```
if(cycle_cnt == 0) begin
	if(Start) begin
		Busy <= 1;
        if(MDUOp == `MDU_multu || MDUOp == `MDU_mult) cycle_cnt <= 5;
        else if(MDUOp == `MDU_div || MDUOp == `MDU_divu) cycle_cnt <= 10;
        
        if(MDUOp == `MDU_multu) {tmp_HI, tmp_LO} <= D1 * D2;
        else if(MDUOp == `MDU_mult) {tmp_HI, tmp_LO} <= $signed(D1) * $signed(D2);
        else if(MDUOp == `MDU_div) begin
        	tmp_LO <= $signed(D1) / $signed(D2);
            tmp_HI <= $signed(D1) % $signed(D2);
        end else if(MDUOp == `MDU_divu) begin
            tmp_LO <= D1 / D2;
            tmp_HI <= D1 % D2;              
        end    
	end else begin
		cycle_cnt <= 0;
	end
```

然后就是正常的状态机，每一次时钟上升沿 `cycle_cnt` 都会减 1，减到 1 的时候把 `tmp_HI` 和 `tmp_LO` 转存

```
if(cycle_cnt == 1) begin
	LO <= tmp_LO;
    HI <= tmp_HI;
    Busy <= 1'b0;
    cycle_cnt <= 0;
end else begin
    cycle_cnt <= cycle_cnt - 1;
end
```

第三件事 DM 改造，课程组今年已经给出了标准的 DM 实现，我们只需要调用对应的接口即可

这里我们用 `BE` 处理要写入的数据，使其符合规范，用 `DE` 处理读出的数据，使其符合 `lh, lb, lhu, lbu, lw, lw` 的要求

BE 的端口

| 信号名称           | 方向 | 功能描述                     |
| ------------------ | ---- | ---------------------------- |
| BEOp[1:0]          | 输入 | 控制信号                     |
| Addr[31:0]         | 输入 | 地址信息，用于处理半字、字节 |
| rt_data[31:0]      | 输入 | 读取的寄存器数据，待处理     |
| DMWrEn             | 输入 | 写使能                       |
| m_data_byteen[3:0] | 输出 | 控制写入半字、字节的位置位置 |
| m_data_wdata[31:0] | 输出 | 待写入数据                   |

DE 的端口

| 信号名称           | 方向 | 功能描述                        |
| ------------------ | ---- | ------------------------------- |
| DEOp[1:0]          | 输入 | 控制信号                        |
| Addr[31:0]         | 输入 | 地址信息，用于处理半字、字节    |
| m_data_rdata[31:0] | 输入 | `mips_txt.v` 返回的 DM 中的数据 |
| DMRD[31:0]         | 输出 | 处理之后的正确的读取数据        |

与接口进行交互的细节代码

```
// 与 DM 交互
M_BE _be(
	.BEOp(M_BEOp),
	.Addr(M_ALUAns),
	.rt_data(M_FWD_rt_data),
	.m_data_byteen(m_data_byteen),
	.m_data_wdata(m_data_wdata)
);

assign m_inst_addr = M_PC;
assign m_data_addr = M_ALUAns;

wire [31:0] M_DMRD;
M_DE _de(
	.DEOp(M_DEOp),
	.Addr(M_ALUAns),
	.m_data_rdata(m_data_rdata),
	.DMRD(M_DMRD)
);

// 正确输出 GRF 读写信息
assign w_grf_addr = W_GRFA3;
assign w_grf_wdata = W_GRFWD;
assign w_grf_we = W_GRFWrEn;
assign w_inst_addr = W_PC;
```

**注意今年的 P6 也不需要在寄存器堆里面输出写入信息了，同样是调用 `mips_tb.v` 的接口即可**

这一部分仔细读一读教程，然后在看一看提供的源代码就行，问题不大

## [#](#课上部分) 课上部分

题目的考察离不开 P5 的那几种类型，逐一进行解释

个人的一些想法：
关于课上测试的准备，自己练习加的指令不求多，因为反正不可能考到原题，要更加熟悉你自己设计的流水线的架构，理解阻塞和转发的过程，做到心中有图，然后自己可以想一想如何添加，多想几种方法，找一个最方便的形成自己的套路，就足以应对课上测试了
并不一定需要真正把指令加到 CPU 里面，这有可能会引入潜在的 bug，而且你没有.class 文件也没法做测试，出了问题除了让自己血压升高没别的好处
下面的总结和套路也仅供参考，但是至少顺利通过了 P5 和 P6 的课上测试

### [#](#第一类运算类) 第一类：运算类

#### [#](#shl-swap-hi-lo) shl (swap HI LO)

这是第一次课上考试的题目，要求是交换 HI、LO 寄存器的值

可以直接这样加（注意非阻塞赋值的运用），非常容易

```
if(MDUOp == `MDU_shl) begin
    HI <= LO;
    LO <= HI;
end
```

#### [#](#bds-big-divideunsigned-small) bds (big divide(unsigned) small)

给出 `rs` 和 `rt` 两个寄存器，用较大的那个数除以较小的那个数，**注意是无符号除法**

这是第二次课上考试的题目，也非常容易（注意无符号）

```
if(MDUOp == `MDU_bds) begin
    if(D1 > D2) begin
        tmp_LO <= D1 / D2;
        tmp_HI <= D1 % D2;
    end else begin
        tmp_LO <= D2 / D1;
        tmp_HI <= D2 % D1;  
    end
end
```

**可以看出主要是关于乘除槽的计算，只要熟悉乘除槽的工作原理，第一题不难做出**

### [#](#第二类条件跳转) 第二类：条件跳转

#### [#](#bezal) bezal

**指令描述**

| special | rs            | rt            | 0     | 0     | funct  |
| ------- | ------------- | ------------- | ----- | ----- | ------ |
| 000000  | rs 寄存器地址 | rt 寄存器地址 | 00000 | 00000 | 110001 |

**指令行为**

若 `GPR[rt] = 0` ，则跳转到 `GPR[rs]` ，并且链接到 `GPR[31]`

**解法**

这是第二次上机考试的题目

对于条件跳转的题目，有**两个不同性质：条件链接 / 无条件链接，清空 / 不清空延迟槽**，本题显然是条件链接 + 不清空延迟槽

而且由于在 D 级我们就可以获得是否跳转，因此我们只需要修改 `NPC` 和 `CMP` 两个元件，明确 ** `CMP` 是用来比较产生是否跳转的结果的， `NPC` 是根据 `CMP` 的结果决定跳转到哪里去的 **，然后相应修改两个元件即可

**我强烈建议大家课下搭建 `CPU` 时把是否跳转的 `b_jump` 信号跟着流水线一直传递到最后**，因为条件链接需要根据 `b_jump` 信号来决定本条指令是写 `5'd31` 还是 `5'd0` 寄存器，在把 `b_jump` 连到 `control` 里面后只需要这样即可

```
// 要向寄存器中写入的值
assign GRFWDSel = (jump_link | branch_link) ? `WDSel_pc8 :
                  (load) ? `WDSel_dmrd :
                  (mf) ? `WDSel_mduans :
                  `WDSel_aluans;

// 要写入哪个寄存器
assign GRFA3 = (calc_r | jalr | mf) ? rd :
               (calc_i | load) ? rt :
    		   (jal | (branch_link && b_jump)) ? 5'd31 :		// 仅限条件链接
               5'd0;
```

对于清空延迟槽，P5 已经说过了，**要注意在处于阻塞状态时不能立即清空延迟槽指令，因为这时候你得到的 `b_jump` 未必是正确的**，代码如下：

```
// D_CMP.v
assign flush = (CMPOp == `CMP_bltzall && !jump);

// mips.v
assign FD_REG_Flush = CMP_flush && !Stall;
```

对于本题而言，跳转方式反而与 `jr, jalr` 类似，但是还是需要 `CMP` 的判断，因此**考虑给 `NPC` 和 `CMP` 都添加新的控制信号，然后 `CMP` 按 `rtData < 0` 比较，NPC 按 `jr` 跳转**，就可以轻松解决本题

#### [#](#类似的往年题) 类似的往年题

##### [#](#blezalc) blezalc

小于等于 0 时跳转并链接，显然也是跳转并链接并且不清空延迟槽，按照上述套路**只需要改 CMP 即可**，因为这条指令的跳转方式跟其他的 b 型指令一致

### [#](#第三类条件储存) 第三类：条件储存

属于是大 Boss 了，不论是什么样的条件储存题目，都有这样的**特点：我们至少在 M 级之前都无法确切得知我们要写的寄存器和要写的值是什么**，这就是条件储存的 “条件”

对于这类题目，我们认为最保险的情况就是**当啥都知道的时候（即 W 级时），在一起处理所有的问题，即要写啥要写什么这两个问题**

但是问题在于，在 W 级之前怎么办？

**当我们不确定自己要写啥寄存器时，把当前要写的寄存器设置为 0 总是最保险的**，这是因为我们不会处理向 0 号寄存器里面写的转发

至于要写啥有需要分成两种情况：一是一开始就知道要写的是 DM 的数据，二是那种如果满足某种情况就写 DM 数据，否则我们写其他数据（寄存器啊，PC+8 啊，PC+4 啊各种乱七八糟的...），但是由于我们是在 W 级才处理这些问题，所以无论写的是啥乱七八糟的东西，我们可以**确定拿到的一定是正确的数据**，结论是**在 W 级之前，我们设置的写入寄存器的数据是啥都无所谓！**

为什么呢？这就是下面要说的阻塞，我们对于条件储存的指令，阻塞的策略是：如果后面有这条指令，前面的寄存器需要读**后面这条指令可能需要写**的寄存器，在这里 `lhogez` 就是指 rt 和 31 号寄存器，再例如说下面的 `lwmx` 指令就是 4 号和 5 号寄存器，**总之只要条件储存指令在流水线 W 级之前，并且后面的那条指令要读后面这条指令可能需要写的寄存器，就必须把它阻塞在 D 级**，这样的话条件储存指令在 W 级之前**根本不会向前转发**，因此根本不需要特别关心设置的写入寄存器的数据是啥，阻塞时这样设置即可

```
wire E_stall_rs = ((E_lwmx ? (D_rs_addr == 5'd4 || D_rs_addr == 5'd5) : (E_GRFA3 == D_rs_addr)) && D_rs_addr != 0) && (E_Tnew > D_Tuse_rs);
wire E_stall_rt = ((E_lwmx ? (D_rt_addr == 5'd4 || D_rt_addr == 5'd5) : (E_GRFA3 == D_rt_addr)) && D_rt_addr != 0) && (E_Tnew > D_Tuse_rt);

wire M_stall_rs = ((M_lwmx ? (D_rs_addr == 5'd4 || D_rs_addr == 5'd5) : (M_GRFA3 == D_rs_addr)) && D_rs_addr != 0) && (M_Tnew > D_Tuse_rs);
wire M_stall_rt = ((M_lwmx ? (D_rt_addr == 5'd4 || D_rt_addr == 5'd5) : (M_GRFA3 == D_rt_addr)) && D_rt_addr != 0) && (M_Tnew > D_Tuse_rt);

assign Stall = E_stall_rs | E_stall_rt | M_stall_rs | M_stall_rt;
```

然后是条件如何判断？我们选择在 W 级判断，直接把判断逻辑写在 `mips.v` 或者 `datapath` 里面，生成一个 `check` 信号，然后连入 W 级的 `control` 里面去判断写什么，写哪里

但是这个时候前面 DEM 级的 `control` 会出现 `check` 信号是浮空值 `z` 的情况，这时候我们需要特殊用 `===` 语法进行判断，即得到浮空值，并且当前指令是条件储存，那么这时把要写的寄存器地址赋值成 `5'd0` ，以 `lhonez` 指令和 `lwer` 指令为例，示例代码如下：

```
// mips.v
reg W_lhonez_check;
reg [31:0] W_lwer_dst;

always @(*) begin
	W_lwer_dst = (W_rt_data + W_DMRD) & 32'h1e;
end

always @(*) begin
	count1 = 0;
	for(i=0; i<16; i=i+1) if(W_DMRD[i] == 1'b1) count1 = count1 + 1;
	W_lhonez_check = (count1 > 8) ? 1'b1 : 1'b0;
end

control W_CTRL(
	.Instr(W_Instr),
    .b_jump(W_b_jump),
    .lhonez_check(W_lhonez_check),
    .lwer_dst(W_lwer_dst),
        
    .GRFA3(W_GRFA3),
    .GRFWDSel(W_GRFWDSel),
    .GRFWrEn(W_GRFWrEn)
);

// control.v
assign GRFWDSel = (jump_link | branch_link) ? `WDSel_pc8 :
                  ((load && !lhonez) || (lhonez && lhonez_check === 1'b1)) ? `WDSel_dmrd :
                  (lhonez && lhonez_check === 1'b0) ? `WDSel_pc4 :
                  (mf) ? `WDSel_mduans :
                  (jap) ? `WDSel_jap :
                  `WDSel_aluans;

assign GRFA3 = (lhonez && lhonez_check === 1'bz) ? 5'b0 :
               (lwer && lwer_dst === 32'bz) ? 5'b0 :
               (lwer && lwer_dst !== 32'bz) ? lwer_dst[4:0] :
               (calc_r | jalr | mf) ? rd :
               (calc_i | (load && !lwer && !lhonez) | (lhonez && lhonez_check === 1'b1)) ? rt :
               (jal | branch_link | (lhonez && lhonez_check === 1'b0)) ? 5'd31 :
               (jap) ? 5'd29 :
               5'd0;
```

`lwer` 指令还稍微有些不同，我们在 W 级确定的是写入的地址，因此我们传入的不再是 `check` 信号，而是寄存器地址

里面还有一些别的其它指令，后面会再说，先说一下 `lwer` 和 `lhonez` 以及本次课上考试指令的具体描述

#### [#](#lwer) lwer

**文字描述**

从内存读出数 ( `memword` )，经表达式

```
(memword + GRF[rt]) & 0x1e
```

算出**要写的**寄存器编号（必为偶数），再将 `memword` 写入该寄存器

**解法**

这是 P6 第一次课上考试的题目

关键代码已经如上，具体思路就是**在 W 级判断，其余数据相关指令阻塞到 D 级**，**注意这里的数据相关型指令是指要读的寄存器地址为偶数的指令**

#### [#](#lhonez) lhonez

**文字描述**

从内存读出**半字**数据，比较该数据中数字 1 和 0 的个数的多少，1 多的情况下将该数据写入 rt 寄存器，否则将 PC+4 写入 31 号寄存器

**解法**

思路还是上面那样，总之在 W 级再判断，然后其他的数据相关指令阻塞到 D 级不会出问题，大致框架定下来之后，其他的就是细化如何判断，阻塞逻辑是什么（就是什么是数据相关的指令），然后把 `check` 信号连到 `control` 里面，注意一下特判浮空值，然后就不会有问题了

#### [#](#lwmx) lwmx

**指令描述**

| opcode | base              | rt              | offset      |
| ------ | ----------------- | --------------- | ----------- |
| 101010 | `base` 寄存器地址 | `rt` 寄存器地址 | 16 位偏移量 |

**指令行为**

如果从内存中读出的 `memword` 值大于 `GPR[rt]` 则将 `memword` 写入 5 号寄存器中，否则写入 4 号寄存器中

**解法**

- 就不放代码了，详细说一说思路
- 首先明确**数据相关的指令就是指需要读 4 号 5 号寄存器的指令，这些指令需要在 `stall.v` 中添加逻辑让其阻塞在 D 级**
- 然后把判断放在 W 级，这时候我们需要把 `rt_data` 数据跟着流水线传递到 W 级（这时候的 `rt_data` 一定是正确的，想一想为什么？）
- 判断就是比大小，**注意是有符号比较**，然后生成 `check` 信号传入 W 级 `control` ，**小心 DEM 级 `control` 的浮空值**
- 在 `control` 里面添加逻辑根据 `check` 信号是 `1'b0, 1'b1, 1'bz` 设置正确的待写入寄存器地址
- 待写入寄存器的值从一开始就很明确，是读出的 `memword` ，所以没啥好说的

#### [#](#往届考试的相似题型) 往届考试的相似题型

##### [#](#lwld) lwld

读出来的 `memword` 如果满足 `memword[1:0]==0 && memword >= 32'h3000` 就写到 31 号寄存器，否则写到 rt 寄存器

典型的条件写，待写入的值很明确，就是 `memword` ，只需要在 W 级完成判断逻辑，在 `stall.v` 中完成阻塞逻辑即可

### [#](#第四类一些奇奇怪怪不能归入某一类的题目) 第四类：一些奇奇怪怪不能归入某一类的题目

#### [#](#movz) movz

**文字描述**

当 `GRF[rt] > 0` 时，将 `GRF[rs]` 写入 `GRF[rd]` ，否则不写

**解法**

- 好像是一条 R 型计算类指令，但是如果 `GRF[rt] <= 0` 时又不去写计算结果了
- 根据 Harahan 大佬的意见，本题可以看成计算类指令，但是需要在 `ALU` 中重新加入 `ALU_check` 判断 `GRF[rt] > 0` ，然后信号沿着流水线传递，去确定写不写寄存器

#### [#](#jap) jap

**文字描述**

- 从编号为 **29 号**的寄存器读出数据，作为地址将 **PC+8** 写入**内存**
- 维护这个以 29 号寄存器的值为栈顶指针的栈（这个栈和内存里的栈一样是**倒着**长得），即让 29 号寄存器的值**减 4** 再写入 29 号**寄存器**
- 完成与 **j 指令**一摸一样的跳转操作

**RTL 语言描述**

```
Addr <- GRF[29]
mem[addr] <- PC + 8
GRF[29] <- GRF[29] - 4
PC <- PC[31:28]||imm26||00
```

**解法**

这一题的操作非常多，贯穿了整个数据通路，所以我们应当找到一条**关键路径**，这条路径最长而且时这条指令的中心任务

我认为关键路径应当是 `GRF[29] <- GRF[29] - 4` ，其他的什么跳转和写内存都只是路径上顺便完成的任务而已

- 首先到了 D 级，我们应当顺便利用 `NPC` 完成跳转操作，因为是无条件跳转，因此这个任务是没有难度的，直接改 `NPCOp` 即可
- 然后到了 E 级，我们利用 `ALU` 完成 `GRF[29] + 0` 操作，得到的 `ALUAns` 是要写入的地址，而要写入寄存器的值敲好就是 `ALUAns - 4` ，这一点特判即可，关于阻塞，这里我们在 E 级就需要用到 `GRF[29]` 的值，即Tuse{jap}=1T_{use}\{jap\}=1Tuse{jap}=1
- 然后到了 M 级，我们写入 DM 只需要改变 `DMWrEn` ，然后把 PC+8 作为写入数据即可，这时也应当特判
- 然后在 W 级，正常写入

**需要注意的是：我们从 E 级开始就需要处理由于 `jap` 指令导致的 29 号寄存器数据的转发了**

**在上面的过程中，我们多次用到了特判，因此把 `jap` 归入哪一类指令都是不合适的，因此我们考虑单开一类，特殊处理**