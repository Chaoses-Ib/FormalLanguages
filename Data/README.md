# Data Exchange Languages
[Comparison of data-serialization formats - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_data-serialization_formats)

[Rust serialization benchmark](https://github.com/djkoloski/rust_serialization_benchmark)

[ludocode/schemaless-benchmarks: Benchmarks for Schemaless Data Serialization Libraries](https://github.com/ludocode/schemaless-benchmarks)

[Comparison of schemaless byte-oriented binary serialization format](https://gist.github.com/lifthrasiir/323bb7e33f7f650a8937)

[Binary protocol - Issue #432 - graphql/graphql-spec](https://github.com/graphql/graphql-spec/issues/432)

[Overwhelmed by the vast variety of serialization formats. Which to use when? - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/overwhelmed-by-the-vast-variety-of-serialization-formats-which-to-use-when/88440)

## Languages
- [→MessagePack / CBOR](MessagePack.md)
  - Schema-less
- [→Protocol Buffers (Protobuf)](Protobuf.md)
- [→Apache Arrow](Arrow.md)
- [BARE Message Encoding](https://baremessages.org/)
  - Schema
  - Rust: [serde\_bare - crates.io: Rust Package Registry](https://crates.io/crates/serde_bare/0.5.0)
- Lite2: A Schemaless Zero-Copy Serialization Format[^chenLite2SchemalessZeroCopy2024]
  - Schema-less
- [→HTTP multipart forms](https://github.com/Chaoses-Ib/Networks/blob/main/Application/HTTP/Upload/README.md#multipart-forms)

[→Text Data Languages](Text/README.md)

[→Binary JSON](Text/JSON/Binary.md)

### Rust
- [Bincode](https://github.com/bincode-org/bincode)
  - [Serialization specification](https://github.com/bincode-org/bincode/blob/trunk/docs/spec.md)
    - Schema
      - [How to compatible with data schema changes? - Issue #642](https://github.com/bincode-org/bincode/issues/642)
  - Used by Servo
  - JS
    - [4t145/bincode-ts: A library to decode/encode bincode to JavaScript/TypeScript object.](https://github.com/4t145/bincode-ts)
    - [timfish/bincode-typescript: Generates TypeScript bincode serialisation code from Rust structs and enums](https://github.com/timfish/bincode-typescript)
- [SoftbearStudios/bitcode: A binary encoder/decoder for Rust](https://github.com/SoftbearStudios/bitcode)
  - Schema
- [jamesmunns/postcard: A no\_std + serde compatible message library for Rust](https://github.com/jamesmunns/postcard)
  - Schema
- [paritytech/parity-scale-codec: Lightweight, efficient, binary serialization and deserialization codec](https://github.com/paritytech/parity-scale-codec)
  - Schema
- [DLHN : Blazing fast and small data serialization format](https://dlhn.org/)
  - Schema-less
  - Rust: [otake84/dlhn: DLHN implementation for Rust](https://github.com/otake84/dlhn)
- [yasammez/nachricht: A self-describing data interchange format](https://github.com/yasammez/nachricht)
  - Schema-less

  [Introducing nachricht: a self-describing binary data-interchange format that uses backreferences to save bytes on wire : r/rust](https://www.reddit.com/r/rust/comments/lc9aeo/introducing_nachricht_a_selfdescribing_binary/)
- [khonsulabs/pot: A concise, self-describing binary format written in Rust for Serde](https://github.com/khonsulabs/pot)
  - Schema-less

    > While still being self-describing, Pot's main space-saving feature is not repeating symbols/identifiers more than one time while serializing. When serializing arrays of structures, this can make a major difference.
- [only-cliches/NoProto: Flexible, Fast & Compact Serialization with RPC](https://github.com/only-cliches/NoProto)
- [nurmohammed840/databuf.rs: Structured data serialization library](https://github.com/nurmohammed840/databuf.rs)
- [speedy](https://github.com/koute/speedy)
- [Abomonation: A mortifying serialization library for Rust](https://github.com/TimelyDataflow/abomonation)

axum:
- [matteopolak/axum-codec: A multi-codec extractor and response writer for Axum.](https://github.com/matteopolak/axum-codec)
  - MessagePack: defaults to serialize with names, deserialize with `human_readable`

  [axum-codec: support encode/decode for multiple formats with automatic content-type resolution in axum : r/rust](https://www.reddit.com/r/rust/comments/1e08gb1/axumcodec_support_encodedecode_for_multiple/)
- [gengteng/axum-serde: axum-serde is a library that provides multiple serde-based extractors and responders for the Axum web framework.](https://github.com/gengteng/axum-serde)
- [axum-msgpack: MsgPack Extractor/Response](https://github.com/loehde/axum-msgpack)


[^chenLite2SchemalessZeroCopy2024]: Chen, T., Guan, X., Shuai, S., Huang, C., & Aibin, M. (2024). Lite2: A Schemaless Zero-Copy Serialization Format. Computers, 13(4), Article 4. https://doi.org/10.3390/computers13040089
