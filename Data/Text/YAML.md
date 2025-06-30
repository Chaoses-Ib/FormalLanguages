# [YAML](https://yaml.org/)
[Wikipedia](https://en.wikipedia.org/wiki/YAML)

> YAML (/ˈjæməl/, rhymes with camel) was first proposed by Clark Evans in 2001, who designed it together with Ingy döt Net and Oren Ben-Kiki. Originally YAML was said to mean **Yet Another Markup Language**, because it was released in an era that saw a proliferation of markup languages for presentation and connectivity (HTML, XML, SGML, etc). Its initial name was intended as a tongue-in-cheek reference to the technology landscape, referencing its purpose as a markup language with the yet another construct, but it was then repurposed as **YAML Ain't Markup Language**, a recursive acronym, to distinguish its purpose as data-oriented, rather than document markup.

[YAML Test Matrix Overview](https://matrix.yaml.info/)
> YAML 的生态很糟糕。不仅很多库是 YAML 1.1 的，不容易知道每个使用 YAML 的地方是否按 YAML 1.2 解析，而且几乎没有完全符合 YAML 1.2 标准的库。这个网站展示了各种语言的 YAML 库分别能通过多少 YAML 1.2 的测试样例，可以看到错误是很多的。

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
