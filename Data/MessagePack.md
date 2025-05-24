# [MessagePack: It's like JSON. but fast and small.](https://msgpack.org/index.html)
[Wikipedia](https://en.wikipedia.org/wiki/MessagePack)

- [Spec](https://github.com/msgpack/msgpack/blob/master/spec.md)
- Schema-less
  - Best schema-less binary format overall at the moment?
  - Keys will be repeated for array of objects
- MIME: `application/vnd.msgpack`

  [MIME type - Issue #194 - msgpack/msgpack](https://github.com/msgpack/msgpack/issues/194)

[Hacker News](https://news.ycombinator.com/item?id=4981376), [2025-01](https://news.ycombinator.com/item?id=42663047)
> Anyone who has tried to store binary data in JSON knows that MessagePack does indeed have a use case. And anyone who is working with browsers knows that JSON/JS is the king there.

> Within the space of {schema-ful, schemaless} x {binary, text}, protobuf, {BSON, MessagePack}, JSON each occupy a distinct position. The position (schema-ful, text) is not very meaningful combination in practice and not covered by these, whereas the position (schema-less, binary) is a valid practical use case supported by {BSON, MessagePack}. For example, you don't know the schema before-hand but still want to minimize data size.

## Libraries
### Rust
- [msgpack-rust: MessagePack implementation for Rust / msgpack.org\[Rust\]](https://github.com/3Hren/msgpack-rust) (`rmp`, inactive)
  - Problematic
  - Defaults to without names ([`with_struct_tuple()`](https://docs.rs/rmp-serde/latest/rmp_serde/encode/struct.Serializer.html#method.with_struct_tuple))
    - [`to_vec_named()`](https://docs.rs/rmp-serde/latest/rmp_serde/encode/fn.to_vec_named.html)
    - [Struct with named fields can be deserialized from sequence - Issue #206 - 3Hren/msgpack-rust](https://github.com/3Hren/msgpack-rust/issues/206)
    - [Can't handle `#[serde(tag = "someKey")]` for structure while Deserialization - Issue #318 - 3Hren/msgpack-rust](https://github.com/3Hren/msgpack-rust/issues/318)
  - [Serde `#[serde(skip_serializing_if="Option::is_none")]` fails - Issue #86 - 3Hren/msgpack-rust](https://github.com/3Hren/msgpack-rust/issues/86)
  - [Why are almost all older versions yanked? - Issue #346 - 3Hren/msgpack-rust](https://github.com/3Hren/msgpack-rust/issues/346)
  - ~~[Why serialize newtype struct as array? - Issue #129 - 3Hren/msgpack-rust](https://github.com/3Hren/msgpack-rust/issues/129)~~

  > MessagePack can efficiently store binary data. However, Serde's standard derived implementations *do not* use binary representations by default. Serde prefers to represent types like `&[u8; N]` or `Vec<u8>` as arrays of objects of arbitrary/unknown type, and not as slices of bytes. This creates about a 50% overhead in storage size.
  > 
  > Wrap your data in [`serde_bytes`](https://lib.rs/crates/serde_bytes) to store blobs quickly and efficiently. Alternatively, [configure an override in `rmp_serde` to force use of byte slices](https://docs.rs/rmp-serde/latest/rmp_serde/encode/struct.Serializer.html#method.with_bytes).
- [codx-dev/msgpacker: MessagePack serializer implementation for Rust / msgpack.org\[Rust\]](https://github.com/codx-dev/msgpacker)
- [jsoverson/wasm-msgpack: MessagePack serialization implementation for Rust optimized for embedded/no\_std environments](https://github.com/jsoverson/wasm-msgpack)
- [facet-msgpack - crates.io: Rust Package Registry](https://crates.io/crates/facet-msgpack)
- [otake84/messagepack-rs: messagepack-rs is pure Rust MessagePack implementation.](https://github.com/otake84/messagepack-rs) (discontinued)

### JS
- [kriszyp/msgpackr: Ultra-fast MessagePack implementation with extension for record and structural cloning / msgpack.org\[JavaScript/NodeJS\]](https://github.com/kriszyp/msgpackr)
  - Fastest
  - `undefined` will be encoded to `D4 00 00` (empty fixext 1), while `null` will be encoded to `C0` (nil)
  - `pack()` is buggy with HMR, may include previous results
  - [Could be made more treeshakeable - Issue #65 - kriszyp/msgpackr](https://github.com/kriszyp/msgpackr/issues/65)
  - [performance reduction (Node.js vs Browser) - Issue #52 - kriszyp/msgpackr](https://github.com/kriszyp/msgpackr/issues/52)
- [msgpack/msgpack-javascript: @msgpack/msgpack - MessagePack for JavaScript / msgpack.org\[ECMA-262/JavaScript/TypeScript\]](https://github.com/msgpack/msgpack-javascript)
- [ygoe/msgpack.js: A minimal yet complete MessagePack implementation for JavaScript. msgpack.org\[JavaScript\]](https://github.com/ygoe/msgpack.js) (`@ygoe/msgpack`, inactive)
- [kawanet/msgpack-lite: Fast Pure JavaScript MessagePack Encoder and Decoder / msgpack.org\[JavaScript\]](https://github.com/kawanet/msgpack-lite) (discontinued)

## Tools
- [msgpack visualizer](https://sugendran.github.io/msgpack-visualizer/)
  - Unknown type 0xd4
- [Online msgpack converter](https://msgpack.solder.party/)

## CBOR
[Wikipedia](https://en.wikipedia.org/wiki/CBOR)
  
[CBOR relationship with msgpack - Issue #258 - msgpack/msgpack](https://github.com/msgpack/msgpack/issues/258)
> In 2013, when we gave up trying to drag msgpack into a standardization process, we used the opportunity to clean up the msgpack format, so CBOR is not byte-for-byte compatible to msgpack. (It is close enough that some early CBOR implementations were derived from msgpack implementations.)

[Indeed. MessagePack should be replaced with CBOR in new protocols, as CBOR is a ... | Hacker News](https://news.ycombinator.com/item?id=14067747)
