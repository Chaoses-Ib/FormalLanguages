# Instruction Rewriting
Rewriting within the same instruction.

## x86
- Hydan: Hiding Information in Program Binaries[^el-khalilHydanHidingInformation2004a]

- Smashing the Gadgets: Hindering Return-Oriented Programming Using In-place Code Randomization[^pappasSmashingGadgetsHindering2012][^pappasPracticalSoftwareDiversification2013]
  - Modifiable gadgets (~%):
    - Instruction Substitution: 17%
    - Intra Basic Block Reordering: 35%
    - Reg. Preservation Code Reordering: 52%
    - Register Reassignment: 44%
    - All Transformations: 82%

- [steg86: Hiding messages in x86 programs using semantic duals](https://github.com/woodruffw/steg86)
  - [steg86/src/steg86/binary.rs at master - woodruffw/steg86](https://github.com/woodruffw/steg86/blob/master/src/steg86/binary.rs#L218)

  [Hiding messages in x86 binaries using semantic duals](https://blog.yossarian.net/2020/08/16/Hiding-messages-in-x86-binaries-using-semantic-duals) ([Hacker News](https://news.ycombinator.com/item?id=24178188))

  [A steganographic tool for hiding messages in x86 binaries, written in Rust : r/rust](https://www.reddit.com/r/rust/comments/iatp22/a_steganographic_tool_for_hiding_messages_in_x86/)
  > Do compilers emit more than one encoding of the instructions? Otherwise, wouldn't it be easy to detect the presence of a message?
  > 
  > Most only emit one, so this scheme does not provide deniability. At the most, it's a neat trick for hiding messages, and could be used to hide an encrypted message.

- [Theldus/stelf: 🕵️ Hide binary data inside x86 ELF files](https://github.com/Theldus/stelf)
  - Roughly 16% of the total instructions can be patched


[^el-khalilHydanHidingInformation2004a]: El-Khalil, R., & Keromytis, A. D. (2004). Hydan: Hiding Information in Program Binaries. In J. Lopez, S. Qing, & E. Okamoto (Eds.), Information and Communications Security (Vol. 3269, pp. 187–199). Springer Berlin Heidelberg. https://doi.org/10.1007/978-3-540-30191-2_15
[^pappasSmashingGadgetsHindering2012]: Pappas, V., Polychronakis, M., & Keromytis, A. D. (2012). Smashing the Gadgets: Hindering Return-Oriented Programming Using In-place Code Randomization. 2012 IEEE Symposium on Security and Privacy, 601–615. https://doi.org/10.1109/SP.2012.41
[^pappasPracticalSoftwareDiversification2013]: Pappas, V., Polychronakis, M., & Keromytis, A. D. (2013). Practical Software Diversification Using In-Place Code Randomization. In S. Jajodia, A. K. Ghosh, V. S. Subrahmanian, V. Swarup, C. Wang, & X. S. Wang (Eds.), Moving Target Defense II (pp. 175–202). Springer. https://doi.org/10.1007/978-1-4614-5416-8_9
