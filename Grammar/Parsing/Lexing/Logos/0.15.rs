impl<'s> ::logos::Logos<'s> for WildcardToken {
    type Error = ();
    type Extras = ();
    type Source = str;
    fn lex(lex: &mut ::logos::Lexer<'s, Self>) {
        use logos::internal::{CallbackResult, LexerInternal, SkipCallbackResult};
        type Lexer<'s> = ::logos::Lexer<'s, WildcardToken>;
        fn _end<'s>(lex: &mut Lexer<'s>) {
            lex.end()
        }
        fn _error<'s>(lex: &mut Lexer<'s>) {
            lex.bump_unchecked(1);
            lex.error();
        }
        static COMPACT_TABLE_0: [u8; 256] = [
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        ];
        macro_rules! _fast_loop {
            ($lex:ident, $test:ident, $miss:expr) => {
                while let Some(arr) =  $lex.read:: < &[u8;
                16]>(){
                    if$test(arr[0]){
                        if$test(arr[1]){
                            if$test(arr[2]){
                                if$test(arr[3]){
                                    if$test(arr[4]){
                                        if$test(arr[5]){
                                            if$test(arr[6]){
                                                if$test(arr[7]){
                                                    if$test(arr[8]){
                                                        if$test(arr[9]){
                                                            if$test(arr[10]){
                                                                if$test(arr[11]){
                                                                    if$test(arr[12]){
                                                                        if$test(arr[13]){
                                                                            if$test(arr[14]){
                                                                                if$test(arr[15]){
                                                                                    $lex.bump_unchecked(16);
                                                                                    continue;
                                                                                }$lex.bump_unchecked(15);
                                                                                return$miss;
                                                                            }$lex.bump_unchecked(14);
                                                                            return$miss;
                                                                        }$lex.bump_unchecked(13);
                                                                        return$miss;
                                                                    }$lex.bump_unchecked(12);
                                                                    return$miss;
                                                                }$lex.bump_unchecked(11);
                                                                return$miss;
                                                            }$lex.bump_unchecked(10);
                                                            return$miss;
                                                        }$lex.bump_unchecked(9);
                                                        return$miss;
                                                    }$lex.bump_unchecked(8);
                                                    return$miss;
                                                }$lex.bump_unchecked(7);
                                                return$miss;
                                            }$lex.bump_unchecked(6);
                                            return$miss;
                                        }$lex.bump_unchecked(5);
                                        return$miss;
                                    }$lex.bump_unchecked(4);
                                    return$miss;
                                }$lex.bump_unchecked(3);
                                return$miss;
                            }$lex.bump_unchecked(2);
                            return$miss;
                        }$lex.bump_unchecked(1);
                        return$miss;
                    }return$miss;
                }while$lex.test($test){
                    $lex.bump_unchecked(1);
                }$miss
            };
        }
        #[inline]
        fn goto3_ctx3_x<'s>(lex: &mut Lexer<'s>) {
            lex.set(Ok(WildcardToken::Text));
        }
        #[inline]
        fn pattern0(byte: u8) -> bool {
            COMPACT_TABLE_0[byte as usize] & 1 > 0
        }
        #[inline]
        fn goto4_ctx3_x<'s>(lex: &mut Lexer<'s>) {
            _fast_loop!(lex, pattern0, goto3_ctx3_x(lex));
        }
        #[inline]
        fn goto5_at1<'s>(lex: &mut Lexer<'s>) {
            match lex.read_at::<&[u8; 1usize]>(1usize) {
                Some([128u8..=191u8]) => {
                    lex.bump_unchecked(2usize);
                    goto4_ctx3_x(lex)
                }
                _ => _error(lex),
            }
        }
        #[inline]
        fn goto7_at1<'s>(lex: &mut Lexer<'s>) {
            match lex.read_at::<&[u8; 2usize]>(1usize) {
                Some([128u8..=191u8, 128u8..=191u8]) => {
                    lex.bump_unchecked(3usize);
                    goto4_ctx3_x(lex)
                }
                _ => _error(lex),
            }
        }
        #[inline]
        fn goto6_at1<'s>(lex: &mut Lexer<'s>) {
            match lex.read_at::<&[u8; 2usize]>(1usize) {
                Some([160u8..=191u8, 128u8..=191u8]) => {
                    lex.bump_unchecked(3usize);
                    goto4_ctx3_x(lex)
                }
                _ => _error(lex),
            }
        }
        #[inline]
        fn goto1_x<'s>(lex: &mut Lexer<'s>) {
            lex.set(Ok(WildcardToken::Any));
        }
        #[inline]
        fn goto2_x<'s>(lex: &mut Lexer<'s>) {
            lex.set(Ok(WildcardToken::Star));
        }
        #[inline]
        fn goto9_at1<'s>(lex: &mut Lexer<'s>) {
            match lex.read_at::<&[u8; 3usize]>(1usize) {
                Some([144u8..=191u8, 128u8..=191u8, 128u8..=191u8]) => {
                    lex.bump_unchecked(4usize);
                    goto4_ctx3_x(lex)
                }
                _ => _error(lex),
            }
        }
        #[inline]
        fn goto8_at1<'s>(lex: &mut Lexer<'s>) {
            match lex.read_at::<&[u8; 2usize]>(1usize) {
                Some([128u8..=159u8, 128u8..=191u8]) => {
                    lex.bump_unchecked(3usize);
                    goto4_ctx3_x(lex)
                }
                _ => _error(lex),
            }
        }
        #[inline]
        fn goto11_at1<'s>(lex: &mut Lexer<'s>) {
            match lex.read_at::<&[u8; 3usize]>(1usize) {
                Some([128u8..=143u8, 128u8..=191u8, 128u8..=191u8]) => {
                    lex.bump_unchecked(4usize);
                    goto4_ctx3_x(lex)
                }
                _ => _error(lex),
            }
        }
        #[inline]
        fn goto10_at1<'s>(lex: &mut Lexer<'s>) {
            match lex.read_at::<&[u8; 3usize]>(1usize) {
                Some([128u8..=191u8, 128u8..=191u8, 128u8..=191u8]) => {
                    lex.bump_unchecked(4usize);
                    goto4_ctx3_x(lex)
                }
                _ => _error(lex),
            }
        }
        #[inline]
        fn goto13<'s>(lex: &mut Lexer<'s>) {
            enum Jump {
                __,
                J5,
                J4,
                J7,
                J6,
                J1,
                J2,
                J9,
                J8,
                J11,
                J10,
            }
            const LUT: [Jump; 256] = {
                use Jump::*;
                [
                    J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4,
                    J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4,
                    J4, J4, J2, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4,
                    J4, J4, J4, J1, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4,
                    J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4,
                    J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4, J4,
                    J4, J4, J4, J4, J4, J4, J4, J4, __, __, __, __, __, __, __, __, __, __, __, __,
                    __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
                    __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
                    __, __, __, __, __, __, __, __, __, __, __, __, __, __, J5, J5, J5, J5, J5, J5,
                    J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5, J5,
                    J5, J5, J5, J5, J6, J7, J7, J7, J7, J7, J7, J7, J7, J7, J7, J7, J7, J8, J7, J7,
                    J9, J10, J10, J10, J11, __, __, __, __, __, __, __, __, __, __, __,
                ]
            };
            let byte = match lex.read::<u8>() {
                Some(byte) => byte,
                None => return _end(lex),
            };
            match LUT[byte as usize] {
                Jump::J5 => goto5_at1(lex),
                Jump::J4 => {
                    lex.bump_unchecked(1usize);
                    goto4_ctx3_x(lex)
                }
                Jump::J7 => goto7_at1(lex),
                Jump::J6 => goto6_at1(lex),
                Jump::J1 => {
                    lex.bump_unchecked(1usize);
                    goto1_x(lex)
                }
                Jump::J2 => {
                    lex.bump_unchecked(1usize);
                    goto2_x(lex)
                }
                Jump::J9 => goto9_at1(lex),
                Jump::J8 => goto8_at1(lex),
                Jump::J11 => goto11_at1(lex),
                Jump::J10 => goto10_at1(lex),
                Jump::__ => _error(lex),
            }
        }
        goto13(lex)
    }
}
