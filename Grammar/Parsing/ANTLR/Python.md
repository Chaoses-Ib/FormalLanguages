# Python
1. `pip install antlr4-python3-runtime`
2. `antlr4 -Dlanguage=Python3 MyGrammar.g4`
3. 
   ```python
   import sys
   from antlr4 import *
   from MyGrammarLexer import MyGrammarLexer
   from MyGrammarParser import MyGrammarParser
    
   def main(argv):
       input_stream = FileStream(argv[1])
       lexer = MyGrammarLexer(input_stream)
       stream = CommonTokenStream(lexer)
       parser = MyGrammarParser(stream)
       tree = parser.startRule()
    
   if __name__ == '__main__':
       main(sys.argv)
   ```

runtime 没有 docstrings……