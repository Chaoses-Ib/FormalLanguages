use base64::{Engine, engine::general_purpose::URL_SAFE_NO_PAD};

fn main() {
    let b = URL_SAFE_NO_PAD
        .encode(r#"{"host":"1.1.1.1","key":"5Qbwsde3unUcJBtrx9ZkvUmwFNoExHzpryHuPUdqlWM="}"#);
    dbg!(b);
}
