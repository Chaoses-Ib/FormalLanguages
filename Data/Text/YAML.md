# [YAML](https://yaml.org/)
[Wikipedia](https://en.wikipedia.org/wiki/YAML)

> YAML (/ˈjæməl/, rhymes with camel) was first proposed by Clark Evans in 2001, who designed it together with Ingy döt Net and Oren Ben-Kiki. Originally YAML was said to mean **Yet Another Markup Language**, because it was released in an era that saw a proliferation of markup languages for presentation and connectivity (HTML, XML, SGML, etc). Its initial name was intended as a tongue-in-cheek reference to the technology landscape, referencing its purpose as a markup language with the yet another construct, but it was then repurposed as **YAML Ain't Markup Language**, a recursive acronym, to distinguish its purpose as data-oriented, rather than document markup.

[YAML Test Matrix Overview](https://matrix.yaml.info/)
> YAML 的生态很糟糕。不仅很多库是 YAML 1.1 的，不容易知道每个使用 YAML 的地方是否按 YAML 1.2 解析，而且几乎没有完全符合 YAML 1.2 标准的库。这个网站展示了各种语言的 YAML 库分别能通过多少 YAML 1.2 的测试样例，可以看到错误是很多的。

## Scalars
### Multiple lines
[syntax - How do I break a string in YAML over multiple lines? - Stack Overflow](https://stackoverflow.com/questions/3790454/how-do-i-break-a-string-in-yaml-over-multiple-lines)

| | |
| --- |  --- |
| `>-` | 没有换行 |
| `>` | 内部无换行，行尾有 |
| `\|-` | 内部有换行，行尾没有 |
| `\|` | 内部、行尾都有换行 |
| <code>"abc\ <br/> def\nhij"</code> |  |

## [Mappings](https://yaml.org/spec/1.2.2/#mapping)
> The content of a *mapping* node is an unordered set of *key/value* node *pairs*, with the restriction that each of the keys is [unique](https://yaml.org/spec/1.2.2/#node-comparison). YAML places no further restrictions on the nodes. In particular, keys may be arbitrary nodes, the same node may be used as the value of several key/value pairs and a mapping could even contain itself as a key or a value.

- Keys: Any printable characters and spaces
  - At least leading and trailing spaces are not included

  [validation - Allowed characters in map key identifier in YAML? - Stack Overflow](https://stackoverflow.com/questions/9065136/allowed-characters-in-map-key-identifier-in-yaml)

  ['T.I.L. YAML keys allow for spaces in them' by Marcus Noble](https://marcusnoble.co.uk/2021-05-11-t-i-l-yaml-keys-allow-for-spaces-in-them/)

## JSON
[JSON ⊂ YAML?](https://github.com/USTC-Hackergame/hackergame2023-writeups/blob/master/official/JSON%20%E2%8A%82%20YAML/README.md)
- 很多主流的 YAML 库仍然是 YAML 1.1 的，它没有这个性质
- Numbers, e.g. `1e2`
- 能让 YAML 1.1 与 YAML 1.2 同时报错的输入太多了，非常容易找到，例如超长的 key（1024 字符）、`\t0`、`0\t`、`{""\n:0}`、`[0,\t1]`（其中 `\t` 和`\n` 需要分别换成 tab 和换行符）等。显然 YAML 1.2 并不像自己所承诺的那样是"a strict superset of JSON"。
- one minor caveat regarding duplicate keys

  YAML 1.2 解析器在遇到重复的键时必须报错

> 不过，抛开“JSON 的超集”这个谎言不谈，YAML 还是个不错的选择，比较适合用于自己写的程序的配置文件。只要确保你用的是一个 YAML 1.2 的库，很多老生常谈的问题（例如 `country: no` 或 `port: 22:22`）都不会出现。JSON 也确实几乎都是合法的 YAML 1.2，所以不确定 YAML 该怎么写的时候可以用 JSON 的写法写，对于简单的小程序的配置文件这个需求来说够用了。

## Libraries
### C++
- [yaml-cpp: A YAML parser and emitter in C++](https://github.com/jbeder/yaml-cpp)
  - YAML 1.2
  - vcpkg
  - [Add emitting of json - Issue #941](https://github.com/jbeder/yaml-cpp/issues/941)
    - [mircodz/tojson: header only library to convert yaml and xml files to nlohmann::json](https://github.com/mircodz/tojson)

    [Emitting JSON with yaml-cpp? - Stack Overflow](https://stackoverflow.com/questions/43902941/emitting-json-with-yaml-cpp)

### Rust
- unsafe-libyaml
  - [dtolnay/serde-yaml: Strongly typed YAML library for Rust](https://github.com/dtolnay/serde-yaml) (discontinued)
    - [acatton/serde-yaml-ng: Strongly typed YAML library for Rust, serde compatible. This is an independant continuation of serde-yaml from dtolnay.](https://github.com/acatton/serde-yaml-ng)
    - [bourumir-wyngs/serde-yaml-bw: Strongly typed YAML library for Rust maintained by Bourumir Wyngs](https://github.com/bourumir-wyngs/serde-yaml-bw)
    - [cafkafk/serde-norway: Strongly typed YAML library for Rust](https://github.com/cafkafk/serde-norway) (discontinued)
    - [zim32/serde\_yaml2: Serde integration for yaml\_rust2 crate](https://github.com/zim32/serde_yaml2)
    - [sebastienrousseau/serde\_yml: Strongly typed YAML library for Rust. (a fork of Serde YAML) 🦀](https://github.com/sebastienrousseau/serde_yml) (discontinued)
      - AI

      > I worked with the owner of serde\_yml to fix some of that crate's problems. And he did accept some of my suggestions. But ultimately I lost confidence in it. The worst part wasn't even the AI-generated crap. That at least can be removed. The worst part, for me, was the obfuscated git history. The fact that he blew away serde\_yaml's history when he forked, and then made so many major changes without descriptive commit messages, means that it's very difficult to tell what has changed, and almost impossible to tell why. So I'm trying to switch to [serde-yaml-ng](https://github.com/acatton/serde-yaml-ng) now.

- [Ethiraric/yaml-rust2: A pure Rust YAML implementation.](https://github.com/Ethiraric/yaml-rust2)
- [saphyr-rs/saphyr: A set of crates dedicated to parsing YAML.](https://github.com/saphyr-rs/saphyr)
  - [serde support - Issue #1](https://github.com/saphyr-rs/saphyr/issues/1)
    - [Add serde from/to string impl by james-allan-lloyd - Pull Request #53](https://github.com/saphyr-rs/saphyr/pull/53)

[We lost serde-yaml, what's the next one? : r/rust](https://www.reddit.com/r/rust/comments/1bo5dle/we_lost_serdeyaml_whats_the_next_one/)

[Serde-yaml deprecation. alternatives? - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/serde-yaml-deprecation-alternatives/108868)

[Address serde-yaml deprecation - Issue #1770 - kube-rs/kube](https://github.com/kube-rs/kube/issues/1770)

## Tools
- [Transform YAML into JSON - Online YAML Tools](https://onlineyamltools.com/convert-yaml-to-json)
- [YAMLlint - The YAML Validator](https://www.yamllint.com/)
