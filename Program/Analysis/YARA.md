# YARA
[Wikipedia](https://en.wikipedia.org/wiki/YARA)

[Welcome to YARA's documentation! --- yara 4.5.0 documentation](https://yara.readthedocs.io/en/latest/)

[InQuest/awesome-yara: A curated list of awesome YARA rules, tools, and people.](https://github.com/InQuest/awesome-yara)

## Rule
[Anatomy of a rule | YARA-X](https://virustotal.github.io/yara-x/docs/writing_rules/anatomy-of-a-rule/)

### Parsers
- YARA-X
- [plyara: Parse YARA rules and operate over them more easily.](https://github.com/plyara/plyara)
- Go
  - [VirusTotal/gyp: gyp: A pure Go YARA parser](https://github.com/VirusTotal/gyp)
  - [Northern-Lights/yara-parser: Tools for parsing rulesets using the exact grammar as YARA. Written in Go.](https://github.com/Northern-Lights/yara-parser)

### [Modules](https://virustotal.github.io/yara-x/docs/modules/whats-a-module/)
- [console](https://virustotal.github.io/yara-x/docs/modules/console/)

Formats:
- Written with nom
- [pe](https://virustotal.github.io/yara-x/docs/modules/pe/) ([mod.rs](https://github.com/VirusTotal/yara-x/blob/main/lib/src/modules/pe/mod.rs))
- [dotnet](https://virustotal.github.io/yara-x/docs/modules/dotnet/) ([mod.rs](https://github.com/VirusTotal/yara-x/blob/main/lib/src/modules/dotnet/mod.rs))

## Implementations
- [YARA](https://github.com/VirusTotal/yara)
  - `scoop install yara`
  - [horsicq/QYara](https://github.com/horsicq/QYara)
    - [horsicq/XYara](https://github.com/horsicq/XYara)
  - [libyara-wasm: PoC compilation of libyara into WASM, for potential future CyberChef integration](https://github.com/mattnotmitt/libyara-wasm) ([npm](https://www.npmjs.com/package/libyara-wasm))
    - [YARA Rules - CyberChef](https://gchq.github.io/CyberChef/#recipe=YARA_Rules('',false,false,false,true,true,true))
    - [Yobi: Yara Based Detection Engine for web browsers](https://github.com/imp0rtp3/Yobi)
    - [YARA Playground Online -- Free YARA Validator & Rule Editor](https://www.yaraplayground.com/)

      [YARA Playground - Client Side WASM : r/netsec](https://www.reddit.com/r/netsec/comments/1kem25a/yara_playground_client_side_wasm/)

- [YARA-X: A rewrite of YARA in Rust.](https://github.com/VirusTotal/yara-x)
  - Higher overall performance
  - Better error reporting
  - Parser re-usability
  - Wasm: 用了 Wasm 做 JIT，但是 YARA 本身却不支持 Wasm
    - wasmtime

      [Move wasm functions and dependencies behind a cargo feature - Issue #164 - VirusTotal/yara-x](https://github.com/VirusTotal/yara-x/issues/164)
      > The boolean expression in a rule condition are translated to WebAssembly code, the `wasmtime` create provides the runtime for executing this code when the rule is evaluated, that's why `wasmtime` is not optional. Without `wasmtime` we can't evaluate rule conditions.
    - [wasm32-unknown-unknown compilation target unsupported - Issue #351](https://github.com/VirusTotal/yara-x/issues/351)

      > I can compile `fmt` (and by extension the `parser` module) which has been really great to experiment with on browser, but it looks like compilation of the yara-x library to wasm32-unknown-unknown is not possible due to the way rules are compiled using wasmtime, which is dependent on os-level memory mapping.
  - More powerful CLI
  - No process scanning (yet)
  - [Differences with YARA | YARA-X](https://virustotal.github.io/yara-x/docs/writing_rules/differences-with-yara/)

  [Getting started | YARA-X](https://virustotal.github.io/yara-x/docs/intro/getting-started/)

  2025-06-04 [YARA-X is stable!](https://virustotal.github.io/yara-x/blog/yara-x-is-stable/)

- [davbo/yara-rs: yara pattern matching in rust](https://github.com/davbo/yara-rs)
  - Wasm

## Tools
- [horsicq/YARA-sort: Yara sort](https://github.com/horsicq/YARA-sort)
- x64dbg
- [Yobi: Yara Based Detection Engine for web browsers](https://github.com/imp0rtp3/Yobi)

Web:
- [YARA Rules - CyberChef](https://gchq.github.io/CyberChef/#recipe=YARA_Rules('',false,false,false,true,true,true))
- [YARA Playground Online -- Free YARA Validator & Rule Editor](https://www.yaraplayground.com/)

## Rules
- Defender
  - [DefenderYara: Extracted Yara rules from Windows Defender mpavbase and mpasbase](https://github.com/roadwy/DefenderYara)

    [roadwy/SIGNATURE\_TYPE\_LUASTANDALONE: Extracted lua script from Defender mpavbase.vdm and mpasbase.vdm](https://github.com/roadwy/SIGNATURE_TYPE_LUASTANDALONE)
  - [t-tani/defender2yara: Convert Microsoft Defender Antivirus Signatures (VDM) into YARA rules](https://github.com/t-tani/defender2yara)
- [x64dbg/yarasigs: Various Yara signatures (possibly to be included in a release later).](https://github.com/x64dbg/yarasigs)
- [XYara/yara\_rules at master - horsicq/XYara](https://github.com/horsicq/XYara/tree/master/yara_rules)

Others:
- [horsicq/signatures](https://github.com/horsicq/signatures)

### JS
- [imp0rtp3/js-yara-rules: Yara rules for malicious javascript files from public repositories or written by me.](https://github.com/imp0rtp3/js-yara-rules)
