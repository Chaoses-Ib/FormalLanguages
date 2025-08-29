# Hybrid Finite Automaton
- A hybrid finite automaton for practical deep packet inspection[^becchiHybridFiniteAutomaton2007]

  Head-DFA + tail NFA/DFA

  > We propose a hybrid DFA-NFA finite automaton (*Hybrid-FA*), a solution bringing together the strengths of both DFAs and NFAs. When constructing a hybrid-FA, any nodes that would contribute to state explosion retain an NFA encoding, while the rest are transformed into DFA nodes. The result is a data structure with size nearly that of an NFA, but with the predictable and small memory bandwidth requirements of a DFA.

  > In fact, the automaton traversal remains for the most part within the head-DFA.


[^becchiHybridFiniteAutomaton2007]: Becchi, M., & Crowley, P. (2007). A hybrid finite automaton for practical deep packet inspection. Proceedings of the 2007 ACM CoNEXT Conference, 1–12. https://doi.org/10.1145/1364654.1364656
