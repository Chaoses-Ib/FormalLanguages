# String Compilation
## String literals
```cpp
char s[] = "abcde";
std::cout << s << std::endl;
```
Compiler | Options | size == 5 | size == 30 | size == 120
--- | --- | --- | --- | ---
Clang x64 v11.0.1 | -Ofast | 立即数写入 | 内存复制 | 内存复制
GCC x64 v10.2 | -Ofast | 立即数写入 | 立即数写入+内存复制 | 立即数写入+内存复制
MSVC x64 v19.28 | /O2 | 内存复制 | 内存复制 | 内存复制
ICC x64 v21.1.9 | -Ofast | 立即数写入 | 立即数写入 | 内存复制
Clang x64 v11.0.1 | | | | 内存复制（memcpy）
GCC x64 v10.2 | | | | 立即数写入（imm64）
MSVC x64 v19.28 | | | | 内存复制（rep movsb）
ICC x64 v21.1.9 | |  | | 内存复制（rep movsd）

## Char arrays
```cpp
char s[] = {'a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e','a','b','c','d','e'};
std::cout << s << std::endl;
```
Compiler | Options | size == 120
--- | --- | ---
Clang x64 v11.0.1 | -Ofast | 内存复制
GCC x64 v10.2 | -Ofast | 立即数写入+内存复制
MSVC x64 v19.28 | /O2 | 立即数写入+内存复制
ICC x64 v21.1.9 | -Ofast | 内存复制
Clang x64 v11.0.1 | | 内存复制（memcpy）
GCC x64 v10.2 | | 立即数写入（imm64）
MSVC x64 v19.28 | | 立即数写入（imm8）
ICC x64 v21.1.9 | | 内存复制（rep movsd）

## Integer arrays
```cpp
uint64_t s[] = {0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261, 0x6867666564636261};
std::cout << s << std::endl;
```
Compiler | Options | size == 120
--- | --- | ---
Clang x64 v11.0.1 | -Ofast | 内存复制
GCC x64 v10.2 | -Ofast | 立即数写入+内存复制
MSVC x64 v19.28 | /O2 | 立即数写入+内存复制
ICC x64 v21.1.9 | -Ofast | 内存复制
Clang x64 v11.0.1 | | 内存复制（memcpy）
GCC x64 v10.2 | | 立即数写入（imm64）
MSVC x64 v19.28 | | 立即数写入（imm64）
ICC x64 v21.1.9 | | 内存复制（rep movsd）

## Line by line initialization
```cpp
uint64_t s[15];
s[0] = 0x6867666564636261;
s[1] = 0x6867666564636262;
s[2] = 0x6867666564636263;
s[3] = 0x6867666564636264;
s[4] = 0x6867666564636265;
s[5] = 0x6867666564636266;
s[6] = 0x6867666564636267;
s[7] = 0x6867666564636268;
s[8] = 0x6867666564636269;
s[9] = 0x686766656463626A;
s[10] = 0x686766656463626B;
s[11] = 0x686766656463626C;
s[12] = 0x686766656463626D;
s[13] = 0x686766656463626E;
s[14] = 0x686766656463626F;
std::cout << s << std::endl;
```
Compiler | Options | size == 120
--- | --- | ---
Clang x64 v11.0.1 | -Ofast | 立即数写入+内存复制
GCC x64 v10.2 | -Ofast | 立即数写入+内存复制
MSVC x64 v19.28 | /O2 | 立即数写入+内存复制
ICC x64 v21.1.9 | -Ofast | 立即数写入
Clang x64 v11.0.1 | | 立即数写入
GCC x64 v10.2 | | 立即数写入
MSVC x64 v19.28 | | 立即数写入
ICC x64 v21.1.9 | | 立即数写入

## Detailed code
```c
char s[] = "Hello, World!";
```
- MSVC x64 v19.33:
  ```x86asm
  lea     rax, QWORD PTR s$[rsp]
  lea     rcx, OFFSET FLAT:$SG584
  mov     rdi, rax
  mov     rsi, rcx
  mov     ecx, 14
  rep movsb
  ```
  /O2:
  ```x86asm
  mov     eax, DWORD PTR `string'+8
  ```

```c
char s[] = {'H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!', '\0'};
```
- MSVC x64 v19.33:
  ```x86asm
  mov     BYTE PTR s$[rsp], 72                  ; 00000048H
  mov     BYTE PTR s$[rsp+1], 101             ; 00000065H
  mov     BYTE PTR s$[rsp+2], 108             ; 0000006cH
  mov     BYTE PTR s$[rsp+3], 108             ; 0000006cH
  mov     BYTE PTR s$[rsp+4], 111             ; 0000006fH
  mov     BYTE PTR s$[rsp+5], 44                    ; 0000002cH
  mov     BYTE PTR s$[rsp+6], 32                    ; 00000020H
  mov     BYTE PTR s$[rsp+7], 87                    ; 00000057H
  mov     BYTE PTR s$[rsp+8], 111             ; 0000006fH
  mov     BYTE PTR s$[rsp+9], 114             ; 00000072H
  mov     BYTE PTR s$[rsp+10], 108      ; 0000006cH
  mov     BYTE PTR s$[rsp+11], 100      ; 00000064H
  mov     BYTE PTR s$[rsp+12], 33             ; 00000021H
  mov     BYTE PTR s$[rsp+13], 0
  ```
  /O2:
  ```x86asm
  lea     rdx, QWORD PTR s$[rsp]
  mov     DWORD PTR s$[rsp], 1819043144       ; 6c6c6548H
  mov     DWORD PTR s$[rsp+4], 1461726319         ; 57202c6fH
  mov     DWORD PTR s$[rsp+8], 1684828783         ; 646c726fH
  mov     WORD PTR s$[rsp+12], 33             ; 00000021H
  ```