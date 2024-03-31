# Grammars
描述 R 语言居然只需要不到 150 行的 grammar。

## Garmmar notation
Syntax | Description
--- | ---
`x` | Match token, rule reference, or subrule x.
`x y ... z` | Match a sequence of rule elements.
`(...\|...\|...)` | Subrule with multiple alternatives.
`x?` | Match x or skip it.
`x*` | Match x zero or more times.
`x+` | Match x one or more times.
`r:...;` | Define rule r.
`r:...\|...\|...;` | Define rule r with multiple alternatives.
`.` | Wildcard operator
`~` | Not operator
`'a'..'z'` | Range operator
`[a-z]` | Regular expression set
`?` | Nongreedy subrule
`->` | Command operator

## Language patterns
- Sequence
- Sequence with terminator

  `(statement ';')*`
- Sequence with separator

  `expr (',' expr)*`
- Choice
- Token dependency
- Nested phrase
