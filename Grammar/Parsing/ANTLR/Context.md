# Context-Sensitive Lexical Problems
- The same token character sequence can mean different things to the parser.
  
  e.g. keywords can also be identifiers
  
  Solution:
  - 让 lexer 只考虑其中一种意义，由 parser rule 进行实际区分

- The same character sequence can be one token or multiple.
  
  e.g. Java character sequence `>>` can be treated either as two close-type-parameter tokens or as a single right shift operator token
  
  Solution:
  - lexer 只识别最小单元

- The same token must sometimes be ignored and sometimes be recognized by the parser.
  
  e.g. Python’s physical and logical input lines
  
  Solutions:
  - Lexical actions and semantic predicates
  - `-> skip`

Or use scannerless parsers.

> Parsers can often be big, but they’re usually not that difficult.

## Island languages
Examples:
- XML
- LaTeX
- StringTemplate

## Lexical modes
```antlr
lexer grammar ModeTagsLexer;

// Default mode rules (the SEA)
OPEN  : '<'     -> mode(ISLAND) ;       // switch to ISLAND mode
TEXT  : ~'<'+ ;                         // clump all text together

mode ISLAND;
CLOSE : '>'     -> mode(DEFAULT_MODE) ; // back to SEA mode 
SLASH : '/' ;
ID    : [a-zA-Z]+ ;                     // match/send ID in tag to parser
```
```antlr
parser grammar ModeTagsParser;

options { tokenVocab=ModeTagsLexer; } // use tokens from ModeTagsLexer.g4

file: (tag | TEXT)* ;

tag : '<' ID '>'
    | '<' '/' ID '>'
    ;
```
- `mode()`
- `pushMode()`, `popMode`

- `error(120): lexical modes are only allowed in lexer grammars`
- `error(126): cannot create implicit token for string literal in non-combined grammar: '+'`

```cmd
antlr4 ModeTagsLexer.g4
antlr4 ModeTagsParser.g4
javac ModeTags*.java
grun ModeTags file -tokens
```

lexer 只需要保证在语法正确的情况下区分开 parser 需要的 tokens，不需要检验语法。