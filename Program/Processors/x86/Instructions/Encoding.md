# Instruction Encoding
0~4B | 1~2B | 0~1B | 0~1B | 0/1/2/4B | 0/1/2/4B
--- | --- | --- | --- | --- | ---
Prefix | OP | Mod R/M | SIB | Disp | Imm
前缀 | 操作码 | 寻址信息 | 比例变址 | 偏移量 | 立即数

1~15字节

例子：
- 01 C2
  OP(6) | d(1) | w(1) | Mod(2) | Reg/OP(3) | R/M(3)
  --- | --- | --- | --- | --- | ---
  0 (ADD) | 0 (源) | 1 (宽) | 3 (寄存器寻址) | 0 (EAX) | 2 (EDX)

	`ADD EDX, EAX`
- 03 4C BB 66
  OP(6) | d(1) | w(1) | Mod(2) | Reg/OP(3) | R/M(3) | Scale(2) | index(3) | Base(3) | Disp(8)
  --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
  0 (ADD) | 1 (目的) | 1 (宽) | 1 (基址+比例变址+偏移量寻址) | 1 (ECX) | 100 | 2 | 7 (EDI) | 3 (EBX) | 66

	`ADD ECX, [EBX+EDI<<2+66H]`

## Prefix
0~1B | 0~1B | 0~1B | 0~1B
--- | --- | --- | ---
指令前缀 | 段前缀 | 操作数大小 | 地址大小

### 指令前缀
前缀 | 前缀字节 | 说明
--- | --- | ---
Lock | F0 | 存储器锁
REPNE | F2 | ECX 不等于零且两数不相等时，重复指令
REP<br />REPE | F3 | ECX 不等于零时，重复指令<br />ECX 不等于零且两数相等时，重复指令

### 段前缀
段 | 前缀字节
--- | ---
CS | 2E
SS | 36
DS | 3E
ES | 26
FS | 64
GS | 65

### 操作数大小
前缀字节 | 操作数大小
--- | ---
66 | 32位下代表16位操作数<br />16位下代表32位操作数

x86-64:
- REX.W == 1: 64-bit

### 地址大小
前缀字节 | 地址大小
--- | ---
67 | 

### VEX prefix
[Wikipedia](https://en.wikipedia.org/wiki/VEX_prefix)

## OP
- 
  OP(8) |
  --- |

  零地址/单地址/双地址指令
- 
  OP(5) | Reg(1)
  --- | ---

	单地址指令
- 
  OP(6) | d(1) | w(1)
  --- | --- | ---
  操作码 | 目的/源 | 宽操作数

	双地址指令
- 双字节操作码
  0F | 扩展操作码(8)
  --- | ---

## Mod R/M
[Wikipedia](https://en.wikipedia.org/wiki/ModR/M)

Mod(2) | Reg/OP(3) | R/M(3)
--- | --- | ---
寻址方式 | 寄存器/扩展操作码 | 操作数

- Mod == 00
  - R/M != 100 and R/M != 101: `[REG]`
  - R/M == 100: `[SIB]`
  - R/M == 101: `[disp32]`
- Mod == 01
  - R/M != 100: `[REG+disp8]`
  - R/M == 100: `[SIB+disp8]`
- Mod == 10
  - R/M != 100: `[REG+disp32]`
  - R/M == 100: `[SIB+disp32]`
- Mod == 11: `REG`

x86-64:
- REX.R == 1: `0b1000 | Reg`
- REX.B == 1: `0b1000 | R/M`

## SIB
Scale(2) | index(3) | Base(3)
--- | --- | ---

$Addr = R[Base] + R[index] << Scale$

x86-64:
- REX.B == 1: `0b1000 | Base`
- REX.X == 1: `0b1000 | index`

## Assemblers
- [Intel® XED](https://intelxed.github.io/) ([GitHub](https://github.com/intelxed/xed))