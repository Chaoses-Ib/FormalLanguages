# $\TeX$
**TeX** is a macro- and token-based language: many commands (commonly start with a backslash and are grouped with curly braces), including most user-defined ones, are expanded on the fly until only unexpandable tokens remain, which are then executed. Expansion itself is practically free from side effects. The system can be divided into four levels[^wiki]:
1. In the first, characters are read from the input file and assigned a category code (sometimes called "catcode", for short). Combinations of a backslash (actually, any character of category zero) followed by letters (characters of category 11) or a single other character are replaced by a control-sequence token.
2. In the next stage, expandable control sequences (such as conditionals or defined macros) are replaced by their replacement text.
3. The input for the third stage is then a stream of characters (including the ones with special meaning) and unexpandable control sequences (typically assignments and visual commands). Here, the characters get assembled into a paragraph, and TeX's paragraph breaking algorithm works by optimizing breakpoints over the whole paragraph.
4. The fourth stage breaks the vertical list of lines and other material into pages.

The base TeX system understands about 300 commands, called **primitives**. These low-level commands are rarely used directly by users, and most functionality is provided by format files (predumped memory images of TeX after large macro collections have been loaded)[^wiki]:
- The most widely used format is **[LaTeX](LaTeX.md)**, originally developed by Leslie Lamport, which incorporates document styles for books, letters, slides, etc., and adds support for referencing and automatic numbering of sections and equations.
- Another widely used format, **AMS-TeX**, is produced by the American Mathematical Society and provides many more user-friendly commands, which can be altered by journals to fit with their house style.

## Distributions
TeX is usually provided in the form of an easy-to-install bundle of TeX itself along with Metafont and all the necessary fonts, documents formats, and utilities needed to use the typesetting system.[^wiki]

Distributions:
- Unix-like
  - [TeX Live](https://www.tug.org/texlive/) ([GitHub](https://github.com/TeX-Live/texlive-source))
  - teTeX
- Windows
  - [MiKTeX](https://miktex.org/) ([GitHub](https://github.com/MiKTeX/miktex))
  - TeX Live
- Web
  - [MathJax](https://www.mathjax.org/) ([GitHub](https://github.com/mathjax/MathJax))
  - [KaTeX](https://katex.org/) ([GitHub](https://github.com/KaTeX/KaTeX))

## Editors
- Visual Studio Code
- Vim
- Emacs

## Tools
Visual recognition:
- [Mathpix: AI powered handwriting recognition, document conversion, and digital ink](https://mathpix.com/)
- [pix2tex: LaTeX OCR](https://github.com/lukas-blecher/LaTeX-OCR)
- [Detexify LaTeX handwritten symbol recognition](https://detexify.kirelabs.org/classify.html)


[^wiki]: [TeX - Wikipedia](https://en.wikipedia.org/wiki/TeX)