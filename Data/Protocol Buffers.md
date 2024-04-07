# [Protocol Buffers](https://protobuf.dev/)
[GitHub](https://github.com/protocolbuffers/protobuf), [Wikipedia](https://en.wikipedia.org/wiki/Protocol_Buffers)

**Protocol Buffers (Protobuf)** is a free and open-source cross-platform data format used to serialize structured data.

[Language Guide (proto 3)](https://protobuf.dev/programming-guides/proto3/)
- [Streaming services vs. repeated fields - gRPC for WCF developers | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/architecture/grpc-for-wcf-developers/streaming-versus-repeated)

[Style Guide](https://protobuf.dev/programming-guides/style/)

Optional:
- [protocol buffers - How to define an optional field in protobuf 3 - Stack Overflow](https://stackoverflow.com/questions/42622015/how-to-define-an-optional-field-in-protobuf-3)
- [protocol buffers - Is it a good practice in protobuf3 using optional to check nullability? - Stack Overflow](https://stackoverflow.com/questions/69441101/is-it-a-good-practice-in-protobuf3-using-optional-to-check-nullability)

## Rust
- [prost: A Protocol Buffers implementation for the Rust Language](https://github.com/tokio-rs/prost)

  `prost-types`:
  - [How to convert a `serde_json::Value` to a `prost_types::Struct` in Rust? - Stack Overflow](https://stackoverflow.com/questions/76485311/how-to-convert-a-serde-jsonvalue-to-a-prost-typesstruct-in-rust)
  - [`serde` support for `prost-types` - Issue #852](https://github.com/tokio-rs/prost/issues/852)
  - [Deserializing JSON to prost struct - Issue #846](https://github.com/tokio-rs/prost/issues/846)
  - [prost-wkt: Prost Well-Known-Types serialization and deserialization.](https://github.com/fdeantoni/prost-wkt)
    - [Convert between `prost_wkt_types::Value` and `serde_json::Value`? - Issue #47](https://github.com/fdeantoni/prost-wkt/issues/47)
    - ~~[Inconsistent behaviour with google.protobuf.Struct - Issue #33](https://github.com/fdeantoni/prost-wkt/issues/33)~~
  
  [prost-reflect: A protobuf library extending prost with reflection support and dynamic messages.](https://github.com/andrewhickman/prost-reflect)