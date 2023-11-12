# **简单使用说明**

## 0. 本自动对拍程序依赖于 iverilog 和 python 环境，理论上只要有可对照的 CPU，即可进行测试
## &emsp;为保证正常生成 Testbench，需安装以下四个库：

```
pip install certifi

pip install chardet

pip install idna

pip install urllib3
```
&emsp;
## 1. 将需要对拍的两份 CPU 所有 `.v` 文件准备好，尽量不要包含额外的 `_tb.v` 文件（程序会自动生成）。
## &emsp;其中用于参考的 CPU 的 `.v` 文件放入 `ref_CPU` 文件夹，用于测试的 CPU 的 `.v` 文件放入 `test_CPU` 文件夹。
&emsp;
## 2. 将需要测试的机器码文件放入当前文件夹，并**命名为 `code.txt`** （程序会检测命名，若目录无该文件会暂停）
&emsp;
## 3. 双击 `Test.bat` 即可运行
&emsp;
## 4. `.py` 文件夹中为源码文件，`Result` 中为运行结果（程序会自动打开对比结果）
---
&emsp;
# **More Info**
## 1. 在 `Setup.py` 中可修改相关参数，具体参数含义以注释形式给出。  
&emsp;
## 2. 程序对比两份结果的方法有待优化，实测在遇到数千行内容不同时生成对比结果极慢、甚至假死，但实际上两份结果已保存在各自目录的相关 `out.txt` 文件中，可自行用 VSCode 对比。