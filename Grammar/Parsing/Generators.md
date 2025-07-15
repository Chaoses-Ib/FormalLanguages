# Parser Generators
[Compiler-compiler - Wikipedia](https://en.wikipedia.org/wiki/Compiler-compiler)
- 为什么要生成 parser，而不是调用 parsing 库？

[Comparison of parser generators - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_parser_generators)

为什么没有 context-sensitive parser generator 呢？

## Deterministic context-free grammar
### LR
LR(1):
- [LALRPOP: LR(1) parser generator for Rust](https://github.com/lalrpop/lalrpop)
  
  [LALRPOP - baby steps](https://smallcultfollowing.com/babysteps/blog/2015/09/14/lalrpop/) ([Hacker News](https://news.ycombinator.com/item?id=10296149))

  > 我之前一直是用 lalrpop ，它的主要问题是写起来比较麻烦，尤其是要自定义 lexer 的话会有很多重复的东东； span 也要手动维护。

### LALR
LALR(1):
- Yacc
  
  Yacc

  C

### GLR
- [tree-sitter: An incremental parsing system for programming tools](https://github.com/tree-sitter/tree-sitter) ([Wikipedia](https://en.wikipedia.org/wiki/Tree-sitter_(parser_generator)))

### LL
LL(\*):
- [ANTLR](ANTLR/README.md)
  
  EBNF

  C#, Java, Python, JavaScript, C++, Swift, Go, PHP

## Parsing expression grammar
- [taocpp/PEGTL: Parsing Expression Grammar Template Library](https://github.com/taocpp/PEGTL)
  
  C++

- [pyparsing/pyparsing](https://github.com/pyparsing/pyparsing)
  
  Python

Rust:
- [pest: The Elegant Parser](https://github.com/pest-parser/pest)
- [pom: PEG parser combinators using operator overloading without macros.](https://github.com/J-F-Liu/pom)
  - Slow
- [peginator: PEG parser generator for creating ASTs in Rust](https://github.com/badicsalex/peginator)
