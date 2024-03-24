# Runtime
[ANTLR v4 Runtime API](https://www.antlr.org/api/)
- [Java](https://www.antlr.org/api/Java/index.html)

Classes:
- Tree
  - SyntaxTree
    - ParseTree
      - RuleNode

        toStringTree()
        - RuleContext
          - ParserRuleContext
            - MyRuleContext

## Sharing Information Among Event Methods
- Use visitor method return values
  
  为什么不能让 visitor method 返回不同类型？

- Define a field shared among event methods

- Annotates parse tree nodes to squirrel away values of interest
  
  ParseTreeProperty

## Serialization
[Making Parse Tree Serializable · Issue #233 · antlr/antlr4](https://github.com/antlr/antlr4/issues/233)

[HSorensen/antlr4](https://github.com/HSorensen/antlr4)

可以作为源代码与字节码之间的折中方案，既方便处理又可以起到一定的保护效果。

如何去除 serialization 中的源代码信息？
- Input 问题：通过 `char[]` 构造 ANTLRInputStream，构建 ParserTree 后清零或打乱
  
  应用所需的信息可以通过 Token.index 构建数组保存，或者加密后直接覆盖到 Input。
- Context 类名问题、Token.type 问题
  - Grammar 规则名混淆
  - 命名混淆 + 移除 `ruleNames`、`_LITERAL_NAMES`、`_SYMBOLIC_NAMES`、`tokenNames`
- Token.position 问题

## C++
`vcpkg install antlr4`
```cmake
find_package(antlr4-runtime CONFIG REQUIRED)  
target_link_libraries(main PRIVATE antlr4_static)
```
