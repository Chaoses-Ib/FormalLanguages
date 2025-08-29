# NFA
[→Kinds](README.md#kinds)

## Thompson's construction
[Wikipedia](https://en.wikipedia.org/wiki/Thompson%27s_construction)

> Previous search algorithms involve backtracking when a partially successful search path fails. This necessitates a lot of storage and bookkeeping, and executes slowly. In the regular expression recognition technique described in this paper, each character in the text to be searched is examined in sequence against a list of all possible current characters. During this examination a new list of all possible next characters is built. When the end of the current list is reached, the new list becomes the current list, the next character is obtained, and the process continues. In the terms of Brzozowski, this algorithm continually takes the left derivative of the given regular expression with respect to the text to be searched. The parallel nature of this algorithm makes it extremely fast.[^thompsonProgrammingTechniquesRegular1968]

> Generating an NFA by Thompson's construction, and using an appropriate algorithm to simulate it, it is possible to create pattern-matching software with performance that is ⁠$O(mn)$⁠, where $m$ is the length of the regular expression and $n$ is the length of the string being matched. This is much better than is achieved by many popular programming-language implementations; however, it is restricted to purely regular expressions and does not support patterns for non-regular languages like backreferences.

Used by RE2, Rust `regex`.

[\[Finite Automata\] - Thompson Construct to DFA : r/learnprogramming](https://www.reddit.com/r/learnprogramming/comments/1d30ff/finite_automata_thompson_construct_to_dfa/)

## Glushkov's construction algorithm
[Wikipedia](https://en.wikipedia.org/wiki/Glushkov%27s_construction_algorithm)

> The automaton obtained by Glushkov's construction is the same as the one obtained by Thompson's construction algorithm, once its ε-transitions are removed.

[regular languages - Why do we need epsilon-transitions in Thompson's construction? - Computer Science Stack Exchange](https://cs.stackexchange.com/questions/64553/why-do-we-need-epsilon-transitions-in-thompsons-construction)

- Dual Glushkov NFA

  > Dual Glushkov NFA is the variant of Glushkov NFA, and it has the strong property that all the outgoing transitions to a state of it have the same labels. We propose the new matching method Look Ahead Matching that suited to Dual Glushkov NFA structure. This method executes NFA simulation with reading two input symbols at the one time. We use information of next symbol to narrow down the active states on NFA simulation. It costs additional working memory to apply Look Ahead Matching to ordinal Thompson NFA. However, we can use this method with no additional memory space if use it with Dual Glushkov NFA. Experiments also indicate that the combination of Dual Glushkov NFA with Look Ahead Matching outperforms the other methods on NFAs converted from practical regular expressions.[^kuraiFastRegularExpression2014]


[^thompsonProgrammingTechniquesRegular1968]: Thompson, K. (1968). Programming Techniques: Regular expression search algorithm. Communications of the ACM, 11(6), 419–422. https://doi.org/10.1145/363347.363387
[^kuraiFastRegularExpression2014]: Kurai, R., Yasuda, N., Arimura, H., Nagayama, S., & Minato, S. (2014). Fast Regular Expression Matching Based On Dual Glushkov NFA. Stringology, 3–16. https://www.stringology.org/papers/PSC2014.pdf#page=11
