# String Obfuscation
## C++
- constexpr/consteval
  - [adamyaxley/Obfuscate: Guaranteed compile-time string literal obfuscation header-only library for C++14](https://github.com/adamyaxley/Obfuscate)  
  - [skCrypter: Compile-time, Usermode + Kernelmode, safe and lightweight string crypter library for C++11+](https://github.com/skadro-official/skCrypter)
  - [katursis/StringObfuscator: Simple header-only compile-time library for string obfuscation (C++14)](https://github.com/katursis/StringObfuscator)
  - [String Obfuscator in Compile Time: C++ Header only string obfuscator library using metaprogramming. Affine Cipher technique is used for encryption and decryption.](https://github.com/Snowapril/String-Obfuscator-In-Compile-Time)
  - [pyj2323/StrCrypt: Compile-time string crypter library for C++](https://web.archive.org/web/20220620020218/https://github.com/pyj2323/StrCrypt) (C++20)

    即使开了 `/O2` 也会生成几个多余的 lambda。不过链接时可能会优化掉。

    [StrCrypt.cpp](StrCrypt.cpp)

    [\[Release\] Compile-time string encryption with pseudo random function](https://www.unknowncheats.me/forum/c-and-c-/482068-compile-time-string-encryption.html)

- Code generation

- Compiler plugins
  
  [使用 LLVM Pass 实现字符串加密 - 知乎](https://zhuanlan.zhihu.com/p/104735336)

- Binary rewriting

### [adamyaxley/Obfuscate](https://github.com/adamyaxley/Obfuscate)
Cipher:
```cpp
constexpr void cipher(char* data, size_type size, key_type key)
{
  // Obfuscate with a simple XOR cipher based on key
  for (size_type i = 0; i < size; i++)
  {
    data[i] ^= char(key >> ((i % 8) * 8));
  }
}
```

Decompiled code:
```cpp
  v3 = (__int64 *)NtCurrentTeb()->ThreadLocalStoragePointer;
  v4 = *v3;
  v5 = *(_DWORD *)(*v3 + 304);
  if ( (v5 & 1) != 0 )
  {
    v6 = (_BYTE *)(v4 + 312);
  }
  else
  {
    *(_DWORD *)(v4 + 304) = v5 | 1;
    v6 = (_BYTE *)(v4 + 312);
    *(_WORD *)(v4 + 325) = 0x1B3;
    *(_DWORD *)(v4 + 312) = 0xAB11203B;
    *(_DWORD *)(v4 + 316) = 0x86E293DE;
    *(_DWORD *)(v4 + 320) = 0xE6192901;
    *(_BYTE *)(v4 + 324) = 0xBB;
    _tlregdtor(qword_140002260);
  }
  if ( v6[14] )
  {
    *v6 ^= 0x73u;
    v6[1] ^= 0x45u;
    // ...
    v6[13] ^= 0xB3u;
    v6[14] = 0;
  }
```

Decrypt and **get the line number of the string**:
```python
def cipher(data, key):
    result = bytearray(data)
    for i in range(len(result)):
        result[i] ^= (key >> ((i % 8) * 8)) & 0xff
    return result

def gen_key(seed):
    # Use the MurmurHash3 64-bit finalizer to hash our seed
    key = uint64(seed)
    key ^= key >> 33
    key *= 0xff51afd7ed558ccd
    key ^= key >> 33
    key *= 0xc4ceb9fe1a85ec53
    key ^= key >> 33

    # Make sure that a bit in each byte is set
    key |= 0x0101010101010101

    return key

for line in range(65536):
    result = cipher(ciphertext, gen_key(line))
    try:
        print(line, result.decode())
    except UnicodeDecodeError:
        pass
```