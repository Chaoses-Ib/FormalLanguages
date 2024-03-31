# ANTLR
[ANTLR](https://www.antlr.org/)
- [antlr/antlr4: ANTLR (ANother Tool for Language Recognition) is a powerful parser generator for reading, processing, executing, or translating structured text or binary files.](https://github.com/antlr/antlr4)

[antlr/grammars-v4: Grammars written for ANTLR v4; expectation that the grammars are free of actions.](https://github.com/antlr/grammars-v4)

- [The Definitive ANTLR 4 Reference](Reference.md)
- [antlr4/index.md at master · antlr/antlr4](https://github.com/antlr/antlr4/blob/master/doc/index.md)

From a formal language description called a **grammar**, ANTLR generates a
parser for that language that can automatically build parse trees, which are
data structures representing how a grammar matches the input. ANTLR also
automatically generates tree walkers (*listener and visitor*) that you can use to visit the nodes of those trees to execute application-specific code.

Grammar:
- Adaptive LL(\*)
- Left-recursion

## Basics
```powershell
$Env:CLASSPATH += '..\antlr-4.10.1-complete.jar;'
Function antlr4 { java org.antlr.v4.Tool $args }
Function grun { java org.antlr.v4.gui.TestRig $args }
```
- `antlr4 Hello.g4`
  
  ~~ANTLR 是以输入文件的目录为根目录的，使用 `-o` 指定输出目录时要注意。~~
  输出位置非常诡异。
- `javac *.java`
- `grun Hello r -tokens`
- `grun Hello r -tree`
- `grun Hello r -gui`

[fangsong0517/Hython: 使用Antlr、C++面向对象、责任链模式、访问者模式、设计一门自己的编程语言Hython](https://github.com/fangsong0517/Hython)

[Best Practices for ANTLR Parsers - Strumenta](https://tomassetti.me/best-practices-for-antlr-parsers/)
