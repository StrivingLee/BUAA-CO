## 分析

跳转和存储没什么好说的，都在 P5 里面说过了。所以这里说一下 P6 的计算。

P6 的计算一般是和乘除部件有关，但是其实也不难，这里建议课下做一下 `madd`、`maddu`、`msub`、`msubu`。

一个坑点在于 `madd`（或者 `msub`）里面。如果你的写法是

```
1 {temp_hi, temp_lo} <= {hi, lo} + $signed(rs) * $signed(rt); 
```

好像就会出锅，这个具体的原因在 P1 里面讲过了，和 signedness 有关。另外，如果你写的是

```
1 {temp_hi, temp_lo} <= {hi, lo} + $signed($signed(rs) * $signed(rt)); 
```

也不对，具体也是 P1 里面有讲。正确的写法是：

```
1 2 3 {temp_hi, temp_lo} <= {hi, lo} + $signed($signed(64'd0) + $signed(rs) * $signed(rt)); // 或者 {temp_hi, temp_lo} <= {hi, lo} + $signed({{32{rs[31]}}, rs[31:0]} * $signed({{32{rt[31]}}, rt[31:0]})); // 手动进行符号位扩展 
```

总之一句话：小心 `$signed()`。