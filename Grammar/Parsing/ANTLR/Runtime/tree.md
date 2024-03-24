# [tree](https://www.antlr.org/api/Java/org/antlr/v4/runtime/tree/package-summary.html)
## ParseTree
### toStringTree()
~~Java 虽然没有缩进，但起码打印了 rule 名，Python 连 rule 名都没有，太过分了。~~

Python 需要手动提供 ruleNames：`tree.toStringTree(parser.ruleNames)` 或 `tree.toStringTree(recog=parser)`。

缩进：
1. `print(tree.toStringTree(recog=parser).replace(' (', '\n ('))`
2. Format document

[antlr - antlr4/java: pretty print parse tree to stdout - Stack Overflow](https://stackoverflow.com/questions/50064110/antlr4-java-pretty-print-parse-tree-to-stdout)
