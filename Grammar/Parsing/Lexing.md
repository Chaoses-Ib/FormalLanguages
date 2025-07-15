# Lexing
## Rust
- [logos: Create ridiculously fast Lexers](https://github.com/maciejhirsz/logos)

  > lexer 用 logos  
  > logos 很多优化都做得不错，我当时写 paguroidea 的时候去读发现我们的一些想法它都已经实现了，我们也从里面抄了一点  
  > 基本上就是和 regex 一样编译成一个状态机  
  > 但是对于 lexing 这个场景，状态机里有很多可以特化的点  
  > 比如 lex 一个关键字，很多时候会出现一堆 state 只有一个入度一个出度，比如 `'f' -> 'a' -> 'l' -> 's' -> 'e'`  
  > 这种可以直接合并成一个点，一次性判断  
  > 比如 4 字符的字面量，判断只要一个 u32 比较  
  > 还有 lexer 里面常出现的像是 `[ \r\n\t]+` 这种用来跳过空白字符的，自我循环的 state ，logos 会直接编译成一个优化过的 lut  
  > 整体思路来说，其实就是在整个 state machine 里面，找针对于 lexing 这个场景里会出现的各种 pattern ，然后去做特化实现  
  > 跑起来也是很快  
  > 像是 regex crate 的话就只有 memchr ，而且 memchr 是为高吞吐场景优化的，它预设你要找的 char 在很远的位置，这根本不符合 lexing 的大多数场景  

  > 我之前是真的用 regex 包的 regex group 做 lexer ，但性能一般。找了几个 issue 好像说 regex 可能不是设计用来做这个场景，通常是假设一个 regex 跑完一个大串或者一次性找出所有匹配来优化吞吐，而不是一次找一堆小 regex 然后在上次的匹配位置重新查找。后来才发现的 logos 。
