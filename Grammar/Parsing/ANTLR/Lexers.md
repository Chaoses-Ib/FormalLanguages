# Lexers
Several lexer rules can match the same input text. In that case, the token type will be chosen as follows[^priority]:
- First, select the lexer rule which matches the _longest_ input
- If the text matches an implicitly defined token (like `'{'`), use the implicit rule
- If several lexer rules match the same input length, choose the _first_ one, based on definition order

> `[@5,8:10='451',<4>,1:8]` indicates that it’s the token at index 5 (indexed from 0), goes from character position 8 to 10 (inclusive starting from 0), has text 451, has token type 4 (INT), is on line 1 (from 1), and is at character position 8 (starting from zero and counting tabs as a single character).

[^priority]: [ANTLR Tutorial => Priority rules](https://riptutorial.com/antlr/example/11235/priority-rules)

## Fallback
```antlr
mode MY_MODE;
//FALLBACK : . {_input.seek(_input.index()-1);} -> skip, mode(DEFAULT_MODE) ;
FALLBACK : -> skip, mode(DEFAULT_MODE) ;
```

Fallback and reset:
```antlr
FALLBACK : {_input.seek(0);} -> skip, mode(DEFAULT_MODE) ;
```

## Begin of file
```antlr
BOF : -> mode(DEFAULT) ;

mode DEFAULT;
...
```

## Commands
`type(T)` 可以直接设置为另一个 token，但即使如此也不能重名。