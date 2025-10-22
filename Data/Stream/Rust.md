# Rust
## Tokio
- [tokio-rs/bytes: Utilities for working with bytes](https://github.com/tokio-rs/bytes)
  - `Vec<u8>`
  - [`BytesMut`](https://docs.rs/bytes/latest/bytes/struct.BytesMut.html)
    - `BufMut::put_*` panic if `self` does not have enough capacity to contain `src`.
      
      [Fix BytesMut growth documentation. by sfackler - Pull Request #321](https://github.com/tokio-rs/bytes/pull/321)
      > One key difference from `Vec<u8>` is that most operations **do not implicitly grow the buffer**.
      > This means that calling `my_bytes.put("helloworld");`
      > could panic if `my_bytes` does not have enough capacity. Before
      > writing to the buffer, ensure that there is enough remaining capacity by
      > calling `my_bytes.remaining_mut()`. In general, avoiding calls to `reserve`
      > is preferable.
      > 
      > The only exception is `extend` which implicitly reserves required capacity.
    - [`chunk_mut` should not allocate - Issue #518](https://github.com/tokio-rs/bytes/issues/518)
  
  - `tokio::read_buf()` only calls `chunk_mut()`, which will reserve 64 bytes (effectively x2) if there is no space.
    ```rust
    let mut buf = BytesMut::with_capacity(LEN_MIN).limit(len);
    while match socket.read_buf(&mut buf).await {
        // EOF/enough
        Ok(0) => buf.has_remaining_mut(),
        Ok(_) => true,
        // Not enough
        Err(_) => return,
    } {}
    // Or:
    loop {
        match socket.read_buf(&mut buf).await {
            // EOF
            Ok(0) if buf.has_remaining_mut() => (),
            // Enough
            Ok(0) => break,
            Ok(_) => (),
            // Not enough
            Err(_) => return,
        }
    }
    ```
    [Please provide a `read_buf_exact` helper - Issue #7127 - tokio-rs/tokio](https://github.com/tokio-rs/tokio/issues/7127)

- [`tokio_util::codec`](https://docs.rs/tokio-util/latest/tokio_util/codec/index.html)
  - Length-delimited
    - Reserve memory of length after decoding head ([length_delimited.rs](https://github.com/tokio-rs/tokio/blob/f490029b8fc4552d54b527fc0052fb539e493ebf/tokio-util/src/codec/length_delimited.rs#L555))
  - AnyDelimiter
  - Lines

[How do you read a message of unknown size with tokio? : r/learnprogramming](https://www.reddit.com/r/learnprogramming/comments/15wo57k/how_do_you_read_a_message_of_unknown_size_with/)
