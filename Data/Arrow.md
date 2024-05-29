# [Apache Arrow](https://arrow.apache.org/)
The columnar format has some key features:
- Data adjacency for sequential access (scans)
- O(1) (constant-time) random access
- SIMD and vectorization-friendly
- Relocatable without "pointer swizzling", allowing for true zero-copy access in shared memory

[DBMS Musings: An analysis of the strengths and weaknesses of Apache Arrow](https://dbmsmusings.blogspot.com/2018/03/an-analysis-of-strengths-and-weaknesses.html)

## Struct
[Struct Layout](https://arrow.apache.org/docs/format/Columnar.html#struct-layout)
> Physically, a struct array has one child array for each field. The child arrays are independent and need not be adjacent to each other in memory. A struct array also has a validity bitmap to encode top-level validity information.

[Arrow and Parquet Part 2: Nested and Hierarchical Data using Structs and Lists | Apache Arrow](https://arrow.apache.org/blog/2022/10/08/arrow-parquet-encoding-part-2/)

[What's the advantage of using multiple columns than just a single column in Apache Arrow? - Stack Overflow](https://stackoverflow.com/questions/73621064/whats-the-advantage-of-using-multiple-columns-than-just-a-single-column-in-apac)

How to make fields adjacent to each other? Serialization and UInt8 array?