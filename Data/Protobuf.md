# [Protocol Buffers](https://protobuf.dev/) (Protobuf)
[GitHub](https://github.com/protocolbuffers/protobuf), [Wikipedia](https://en.wikipedia.org/wiki/Protocol_Buffers)

**Protocol Buffers (Protobuf)** is a free and open-source cross-platform data format used to serialize structured data.

[Language Guide (proto 3)](https://protobuf.dev/programming-guides/proto3/)
- `optional`
  - [Why Protobuf 3 made all fields on the messages optional? - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/350443/why-protobuf-3-made-all-fields-on-the-messages-optional)
  - [How to define an optional field in protobuf 3 - Stack Overflow](https://stackoverflow.com/questions/42622015/how-to-define-an-optional-field-in-protobuf-3)
  - [Is it a good practice in protobuf3 using optional to check nullability? - Stack Overflow](https://stackoverflow.com/questions/69441101/is-it-a-good-practice-in-protobuf3-using-optional-to-check-nullability)
  - C#: [Consider exposing protobuf optional fields as nullable properties - Issue #9083 - protocolbuffers/protobuf](https://github.com/protocolbuffers/protobuf/issues/9083)

- `enum`
  - The first enum value must be zero.

- Union: `oneof`
  - > Basically, oneof is poorly named. It means "at most one of". There's always a possible null value.
  - Rust: `Option<sample_message::TestOneof>`

- [Streaming services vs. repeated fields - gRPC for WCF developers | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/architecture/grpc-for-wcf-developers/streaming-versus-repeated)

- 2D array
  
  [2D array of strings in proto3](https://groups.google.com/g/protobuf/c/15cQIumEVtI)
  ```proto
  message Embedding {
    repeated float embedding = 1;
  }

  message EmbedChunksResponse {
    repeated Embedding embeddings = 1;
  }
  ```
  - Python
    ```python
    tensors: numpy.ndarray = model.encode(request.chunks)
    embeddings = [python_server_pb2.Embedding(embedding=list(tensors[i])) for i in range(tensors.shape[0])]
    return python_server_pb2.EmbedChunksResponse(embeddings=embeddings)
    ```

  [c++ - protocol buffers - store an double array, 1D, 2D and 3D - Stack Overflow](https://stackoverflow.com/questions/6825196/protocol-buffers-store-an-double-array-1d-2d-and-3d)
  ```proto
  message DoubleMatrix {
    required uint32 rows = 1;
    required uint32 cols = 2;
    repeated double data = 3 [packed=true];
  }
  ```

[Style Guide](https://protobuf.dev/programming-guides/style/)

## Scalar value types
- `string`: UTF-8, len < u32::MAX
- `bytes`: len < u32::MAX
  - C++: `string`
  - Rust: `Vec<u8>`
  - C#/Java: `ByteString`
  - Python: `bytes`

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

- [rust-protobuf: Rust implementation of Google protocol buffers](https://github.com/stepancheg/rust-protobuf)

- [quick-protobuf: A rust implementation of protobuf parser](https://github.com/tafia/quick-protobuf)

## Python
[Python Generated Code Guide | Protocol Buffers Documentation](https://protobuf.dev/reference/python/python-generated/)

The generated code is shit.

- [How to assign to repeated field? - Stack Overflow](https://stackoverflow.com/questions/23726335/how-to-assign-to-repeated-field)
- Assign to a message: `m.CopyFrom(...)`
- [Question: How to set oneof fields in python? - Issue #5012 - protocolbuffers/protobuf](https://github.com/protocolbuffers/protobuf/issues/5012)

  `test.a.CopyFrom(...)`