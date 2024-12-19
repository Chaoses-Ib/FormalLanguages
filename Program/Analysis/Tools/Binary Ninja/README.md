# [Binary Ninja](https://binary.ninja/)
[GitHub](https://github.com/Vector35), [Wikipedia](https://en.wikipedia.org/wiki/Binary_Ninja)

[Binary Ninja - Features](https://binary.ninja/features/)

[Getting Started - Binary Ninja User Documentation](https://docs.binary.ninja/getting-started.html)

[User Guide - Binary Ninja User Documentation](https://docs.binary.ninja/guide/index.html)

## Licensing
[Binary Ninja - Purchase](https://binary.ninja/purchase/)

Personal installer also inclues commercial features?

[auth.lol/binja/](https://auth.lol/binja/)
- [Binary Ninja Personal 4.1.5747 - 吾爱破解 - 52pojie.cn](https://www.52pojie.cn/thread-1951539-1-1.html)

[Vector 35 Binary Ninja Full - CRACKSurl](https://cracksurl.com/binary-ninja-commercial-edition-full/)

## API
[Vector35/binaryninja-api: Public API, examples, documentation and issues for Binary Ninja](https://github.com/Vector35/binaryninja-api)
- C++, Python, [Rust](https://rust.binary.ninja/binaryninja/)

## Automation
[Automation - Binary Ninja User Documentation](https://docs.binary.ninja/dev/batch.html)
- Python > 3.9?

## Console
- Autocomplete is much better than IDA, but still not great

## Analysis
[User Guide - Binary Ninja User Documentation](https://docs.binary.ninja/guide/index.html#analysis)

- [Settings](https://docs.binary.ninja/guide/settings.html)
- [Triage mode](https://github.com/Vector35/binaryninja-api/tree/dev/python/examples/triage)

Analysis mode | Linear sweep | Functions | GUI | Python
--- | --- | --- | --- | ---
full | autorun,controlFlowGraph | 10661 | 63s | 64s
basic | autorun,controlFlowGraph | 10329 | 37s | 29s
controlFlow | autorun,controlFlowGraph | 10329 | | 16.7s
IDA | | 6312 | | 38s
full | autorun | 2285 | 14s | 13s
basic | autorun | 2281 | 5s | 5s
controlFlow | autorun | 2281 | | 3.7s

(Binary Ninja v4.1, IDA v9.0)

[What would be the recommended settings for large malformed binaries? - Vector35/binaryninja-api - Discussion #3168](https://github.com/Vector35/binaryninja-api/discussions/3168)

[Binary Ninja - Memory Usage and Performance Optimizations](https://binary.ninja/2022/03/24/memory-usage-and-performance-optimizations.html)

## Plugins
[Vector35/official-plugins: Repository for officially supported Binary Ninja plugins](https://github.com/Vector35/official-plugins)

[Vector35/community-plugins: Repository for community provided Binary Ninja plugins](https://github.com/Vector35/community-plugins)

## Debugging
[Vector35/debugger: Binary Ninja debugger](https://github.com/Vector35/debugger)

[Next-Level Reversing: Binary Ninja+TTD - seeinglogic blog](https://seeinglogic.com/posts/binary-ninja-ttd-intro/)

## Patching
[Binary Ninja - Change is in the air](https://binary.ninja/2017/12/15/change-is-in-the-air.html) (2017)

> The two biggest improvements yet to be completed in the current patching system are:
> - A smart-patching mechanism
>
>   A smart-patching mechanism would be capable of broader changes to a binary without the user having to worry about what else was being overwritten. Short trampolines to code-caves, or even the ability to modify segments would be desired features for a true smart-patching system. Note that [BNHook](https://github.com/orndorffgrant/bnhook) implements some of these features. Check it out!
> 
> - Symbol/binary context in assembler and compiler
>
>   The current patching systems would be greatly improved with the context of the binaries' types and symbols to the assembler and compiler. This would allow for far more powerful patching with knowledge already synthesized from the binary. Related to that would be the ability to emit branches to addresses via relative addressing, or even to known addresses by symbol in a non-randomized binary. This level of integration between the compiler and the disassembler doesn't yet exist, so keep an eye out for that improvement!

## Comparison
Discussions:
- 2023-02 [Binary Ninja 3.3 Release Notes : r/ReverseEngineering](https://www.reddit.com/r/ReverseEngineering/comments/10qlkkq/binary_ninja_33_release_notes/)
  
  > I think the advantages of binja compared to ghidra are as follows
  > - Nice graphical ui
  > - Python api with lots of features. This makes it easy to automate analysis.
  > - BNIL, an intermediate language of binja. This is easier to understand than Ghidra's pcode.

  > Binjas API is miles ahead of both ida and Ghidra.
  
  > Binja is faster with a better API.

  > Dev here.
  > 
  > Others have already summarized some good reasons, my (non-exhaustive) list would be:
  > 
  > - Speed (depending on the exact situation we're ~6-8x faster in my testing so for batch-processing we're a clear win and cases like malware triage where quickly scanning through multiple files is important, speed matters
  > 
  > - API has more powerful features, real python API (and Rust and C++)
  > 
  > - Unique IL stack not only makes plugins more powerful/easier to write but helps with manual RE since you can verify decompiler results without going all the way back to disassembly
  > 
  > - Commercial Support: While obviously not true for all issues, it's quite frequent for [issues](https://github.com/Vector35/binaryninja-api/issues?q=is%3Aissue+is%3Aclosed)to be resolved and available to all customers a few hours after a report or later the same day
  > 
  > - Vibrant [plugin community](https://github.com/vector35/community-plugins/)
  > 
  > - Ease of use/Learning Curve: this is maybe more nebulous but we work really had to make our UI well designed, ergonomic, and approachable for new users. This is more subjective and not everyone will agree, but it's also feedback we frequently hear from customers. For example, I recently saw a YT tutorial on "how to open a binary and find main" in Ghidra that was several minutes long because of the entire process of creating the project, adding a file, kicking off analysis, finding main and navigating to it. In Binja the equivalent process was: "drag the file into the binja window". Absolutely everything else was fully automtic.
  > 
  > - Pace of development. Even with an open source community backing it, Binary Ninja's [new features](https://binary.ninja/changelog/) outpaces [Ghidra's](https://htmlpreview.github.io/?https://github.com/NationalSecurityAgency/ghidra/blob/Ghidra_10.2.2_build/Ghidra/Configurations/Public_Release/src/global/docs/ChangeHistory.html) over the past year.
  > 
  > That said, I always like to point out areas where Ghidra has the advantage. Here's a non-exhaustive list:
  > 
  > - Projects/multi-binary management (for now anyway, we're actively working on this, keep an eye out for the next few releases!)
  > 
  > - Architectures (Ghidra's supported processor list is immense, with decompilation supported across the board)
  > 
  > - Cost (obviously)
  > 
  > - Java (for people that prefer Java for plugins, Ghidra is obviously a better choice -- though check out [Jeb](https://www.pnfsoftware.com/) as well)
  > 
  > - Open Source (though I will point out that [large swaths](https://github.com/orgs/Vector35/repositories?q=&type=source&language=&sort=) of Binja are also open source, the core is not)
  > 
  > - The counter-argument to my last Binja "pro" point is that Ghidra doesn't have as many new features because it already has more features to begin with having been around longer, and there is definitely some truth to this. However, even as Binja has hit parity for many use-cases (imho) the development pace hasn't slowed. In fact, the rate of improvements has increased recently, so I think this one has some nuance.

  > For power-users the choice between P-Code vs Binja IL comes down to use case. Binja's IL and 'decompilation' are tightly coupled which can be useful; P-Code is slightly easier to modify and the decompiler is generally more optimized. Various research groups have also toyed with modifying the Ghidra decompiler directly to more closely match the 'low PCode' and even modify the Ghidra database schema to accomodate PCode patching.