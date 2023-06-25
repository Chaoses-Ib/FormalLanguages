# [Pwntools](https://github.com/Gallopsled/pwntools)
- [Documentation](http://docs.pwntools.com/)
- [Getting Started](http://docs.pwntools.com/en/latest/intro.html)
- [Tutorials](https://github.com/Gallopsled/pwntools-tutorial) (inactive)
- [Demos](https://github.com/Gallopsled/pwntools-write-ups)

## [context](https://docs.pwntools.com/en/stable/context.html)
```python
context.binary = elf = ELF()
```

## util
### [cyclic](https://docs.pwntools.com/en/stable/util/cyclic.html)
使用 `bytes` 与使用 `int` 进行查找是不同的，`bytes` 是大端序的，而 `int` 默认是小端序的。即：
```python
cyclic_find(unhex('6161616161616168'), n=8)
```
等价于
```python
cyclic_find(0x6161616161616168, n=8, endian='big')
```

如果查找结果不是 `n` 的倍数，那么就有可能是字节序被搞反了。

### [packing](https://docs.pwntools.com/en/stable/util/packing.html)
#### [flat()](https://docs.pwntools.com/en/stable/util/packing.html#pwnlib.util.packing.flat)
This function takes an arbitrary number of arbitrarily nested lists, tuples and dictionaries. It will then find every string and number inside those and flatten them out.

Dictionary keys give offsets at which to place the corresponding values (which are recursively flattened). Offsets are relative to where the flattened dictionary occurs in the output (i.e. `{0: 'foo'}` is equivalent to `'foo'`).

Integer offsets >= `2**(word_size-8)` are converted to a string using `pack()`. The offset will be the lowest index at which the string occurs in *filler*.

```python
>>> cyclic(16)
b'aaaabaaacaaadaaa'
>>> flat({
...     0x61616161: b'a',
...     1: b'b',
...     0x61616161+2: b'c',
...     3: b'd',
... })
b'abadbaaac'
```