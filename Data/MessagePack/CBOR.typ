#import "@local/ib:0.1.0": *
#title[#a[CBOR][https://cbor.io/]]
#a-badge[https://en.wikipedia.org/wiki/CBOR]

- Used by:
  - Qt

#quote(block: true)[
我是 cbor 小迷妹。不过之前调研过 cbor ，除了工具支持比较不行外（比如 firefox 自带 json 的友好解析，但别的格式就没这个待遇），还有一些 json 类似的坑，必须 cbor 一个格式有多重表达方式，列表有两种，map 可以存成 known length map, stream map,  或者 kv list （ ciborium 就是如此）；然后 cbor 也没有很好的 canonical 标准（有但是和 json 一样是个额外的不一定有多少人理的 rfc ）
]

= Libraries
== Rust
- #a[ciborium: CBOR utilities][https://github.com/enarx/ciborium]
  - #quote[We aim to be wire-compatible with other implementations in decoding, but not necessarily encoding.]
  - #a[google/coset: A set of Rust types for supporting COSE][https://github.com/google/coset]
  - Used by:
    - criterion
    - blake3
    - Dioxus
    - #a[Typst][https://github.com/typst/typst/blob/839c6f76f331dd2f30ede9affa9d734f88828d83/crates/typst-library/src/loading/cbor.rs]
    - MiniJinja CLI
- #a[cbor4ii: CBOR: Concise Binary Object Representation][https://github.com/quininer/cbor4ii]
  - Zero-copy deserialization
  - Mostly compatible with `serde_cbor`
  - Used by:
    - SWC

  #quote[来用 cbor4ii 除了没有 Value 别的都比 ciborium 香]
- #a[cbor-codec][https://crates.io/crates/cbor-codec]
  (discontinued)
  - #a[minicbor: A small CBOR codec suitable for no\_std environments.][https://github.com/twittner/minicbor]
    - #a[rust-cat: A Rust implementation of the CTA-Wave Common Access Token (CAT) specification.][https://github.com/fastly/rust-cat]
  - #a[cose-rust: Rust implementation of the protocol CBOR Object Signing and Encryption, COSE, RFC 8152.][https://github.com/tramires/cose-rust]
- #a[serde_cbor: CBOR support for serde.][https://github.com/pyfisch/cbor]
  (discontinued)
  - Support schema-less (packed) encoding
  - #a[serde_cbor_2][https://github.com/kanidm/cbor]
  - Used by:
    - Wasmer
- #a[BlockchainCommons/bc-dcbor-rust: Deterministic CBOR ("dCBOR") for Rust.][https://github.com/BlockchainCommons/bc-dcbor-rust]
- #a[trussed-dev/cbor-smol: Streamlined serde serializer/deserializer for CBOR][https://github.com/trussed-dev/cbor-smol]
- #a[iamsauravsharma/cbor\_next][https://github.com/iamsauravsharma/cbor_next]
- #a[BurntSushi/rust-cbor: CBOR (binary JSON) for Rust with automatic type based decoding and encoding.][https://github.com/BurntSushi/rust-cbor]
  (discontinued)

#t[2204]
#a[State of the art for serde-compatible CBOR encoding/decoding? : r/rust][https://www.reddit.com/r/rust/comments/u77lhv/state_of_the_art_for_serdecompatible_cbor/]
