# Binary JSON
[Binary Formats are Better Than JSON in Browsers!](https://adamfaulkner.github.io/binary_formats_are_better_than_json_in_browsers.html) ([Hacker News](https://news.ycombinator.com/item?id=43978476))

[A space-efficiency benchmark of JSON-compatible serialization specifications](https://benchmark.sourcemeta.com/)
> Q1: How do JSON-compatible schema-less binary serialization specifications compare to JSON in terms of space-efficiency?
> 
> The median size reduction of the selection of schema-less binary serialization specifications listed in Table 7 is 9.1% and the average size reductions of the selection of schema-less binary serialization specifications listed in Table 7 is 8.2% for the selection of input data set.
>
> There exists schema-less binary serialization specifications that are space-efficient in comparison to JSON. Based on our findings, we conclude that using MessagePack on Tier 1 Minified < 100 bytes and Tier 2 Minified ≥ 100 < 1000 bytes JSON documents, Smile on Tier 3 Minified ≥ 1000 bytes JSON documents, and FlexBuffers on JSON documents with high-redundancy of textual values increases space-efficiency.

- MessagePack ≈ CBOR < Smile < UBJSON < 100% < FlexBuffers < BSON

> Q2: How do JSON-compatible schema-driven binary serialization specifications compare to JSON and JSON-compatible schema-less binary serialization specifications in terms of space-efficiency?
> 
> The schema-driven binary serialization specifications listed in Table 6 tend to be more space-efficient than the schema-less binary serialization specifications listed in Table 7 and JSON [17] in most cases. Based on our findings, we conclude that ASN.1 PER Unaligned [57] and Apache Avro (unpacked) [27] are space-efficient in comparison to schema-less binary serialization specifications in almost all cases as they provide over 70% median size reductions and over 65% average size reductions in comparison to JSON [17].[^viottiBenchmarkJSONcompatibleBinary2022]

[jviotti/binary-json-size-benchmark: See https://benchmark.sourcemeta.com for the latest version of this benchmark](https://github.com/jviotti/binary-json-size-benchmark)

[🔥Comparing Binary JSON formats 🎯 - DEV Community](https://dev.to/loiclefevre/comparing-binary-json-formats-27e3)

[Binary Data in JSON String. Something better than Base64 - Stack Overflow](https://stackoverflow.com/questions/1443158/binary-data-in-json-string-something-better-than-base64)

## Formats
- JSON + [binary-to-text encoding](../Binary.md) (Base64) (+ Compression)
- [MessagePack / CBOR](../../MessagePack/README.md)
- BSON ([Wikipedia](https://en.wikipedia.org/wiki/BSON))
  - From MongoDB

  > Compared to JSON, BSON is designed to be efficient both in storage space and scan-speed. Large elements in a BSON document are prefixed with a length field to facilitate scanning. In some cases, BSON will use more space than JSON due to the length prefixes and explicit array indices.
- UBJSON ([Wikipedia](https://en.wikipedia.org/wiki/UBJSON))
- Smile ([Wikipedia](https://en.wikipedia.org/wiki/Smile_(data_interchange_format)))
- [sourcemeta/jsonbinpack: A binary JSON serialization format based on JSON Schema 2020-12 with a strong focus on space-efficiency](https://github.com/sourcemeta/jsonbinpack)


[^viottiBenchmarkJSONcompatibleBinary2022]: Viotti, J. C., & Kinderkhedia, M. (2022). A Benchmark of JSON-compatible Binary Serialization Specifications (No. arXiv:2201.03051). arXiv. https://doi.org/10.48550/arXiv.2201.03051
