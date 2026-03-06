#import "@local/ib:0.1.0": *
#title[Hooking]
#a-badge[https://en.wikipedia.org/wiki/Hooking]
= Libraries
C++:
- #a[microsoft/Detours: Detours is a software package for monitoring and instrumenting API calls on Windows. It is distributed in source code form.][https://github.com/microsoft/Detours]
  - x86, x64, ARM, ARM64 (Arm64EC), IA64
  - Rust
    - #a[DianaNites/detours: Rust bindings to the Microsoft Detours library.][https://github.com/DianaNites/detours]
      (discontinued)
  - #a[KNSoft.SlimDetours: An improved Detours.][https://github.com/KNSoft/KNSoft.SlimDetours]
    - Rust: #a[Berrysoft/slim-detours-sys][https://github.com/Berrysoft/slim-detours-sys]
      #a-badge[https://docs.rs/slim-detours-sys/]
      ```rust
      type GetMessageWFn =
          unsafe extern "system" fn(msg: *mut MSG, hwnd: HWND, min: u32, max: u32) -> i32;

      static TRUE_GET_MESSAGE_W: SyncUnsafeCell<GetMessageWFn> = SyncUnsafeCell::new(GetMessageW);

      unsafe extern "system" fn get_message(msg: *mut MSG, hwnd: HWND, min: u32, max: u32) -> i32 {
          if let Some(res) = unsafe { crate::runtime::run_runtime(msg, hwnd, min, max) } {
              res
          } else {
              unsafe { (*TRUE_GET_MESSAGE_W.get())(msg, hwnd, min, max) }
          }
      }

      fn detour_attach() -> Result<()> {
          let res =
              unsafe { SlimDetoursInlineHook(1, TRUE_GET_MESSAGE_W.get().cast(), get_message as _) };
          windows::core::HRESULT(res).ok()
      }

      static DETOUR_GUARD: Once = Once::new();
      // static DETOUR_GUARD: LazyLock<Result<()>> = LazyLock::new(detour_attach);

      pub fn init_hook() {
          DETOUR_GUARD.call_once(|| {
              if let Err(_e) = detour_attach() {
                  error!("Failed to hook GetMessageW: {_e:?}");
              }
          });
      }
      // pub fn init_hook() -> bool {
      //     let res = &*DETOUR_GUARD;
      //     if let Err(_e) = res {
      //         error!("Failed to hook GetMessageW: {_e:?}");
      //     }
      //     res.is_ok()
      // }
      ```
    - #a[m417z/minhook-detours: A hooking library with a MinHook-like API and a Detours-like implementation, with support for the x86, x64, and ARM64 platforms][https://github.com/m417z/minhook-detours]
      - Rust: #a[metalbear-co/minhook-detours-sys: Rust bindings to MinHook Detours (SlimDetours).][https://github.com/metalbear-co/minhook-detours-sys]
        #a-badge[https://docs.rs/minhook-detours-sys/]

- #a[TsudaKageyu/MinHook: The Minimalistic x86/x64 API Hooking Library for Windows][https://github.com/TsudaKageyu/minhook]
  - Rust: #a[Jakobzs/minhook][https://github.com/Jakobzs/minhook]

Rust:
#footnote[
#a[hooking - Keywords - crates.io: Rust Package Registry][https://crates.io/keywords/hooking]
]
- #a[detour-rs: A cross-platform detour library written in Rust][https://github.com/darfink/detour-rs]
  (discontinued)
  - x86, x64
  - #a[retour-rs: A cross-platform detour library written in Rust][https://github.com/Hpmason/retour-rs]
  - #a[Jakobzs/detour3: A cross-platform detour library written in Rust][https://github.com/Jakobzs/detour-rs]
    (discontinued)
  - #a[Crochet: A simple runtime hooking library][https://github.com/Adamaq01/crochet]
- #a[bhook: A very small and simple hook][https://github.com/mcbegamerxx954/bhook]
  - x86, x64, ARM64
- #a[Dasaav-dsv/WinHook: A next generation function hooking library for x86_64 Windows and Wine.][https://github.com/Dasaav-dsv/WinHook]
  - x64
- #a[Rukkhadevata123/min_hook_rs: Min Hook rewritten in rust][https://github.com/Rukkhadevata123/min_hook_rs]
  - x64
#md(`
- [ilhook-rs: A library that provides methods to inline hook binary codes in x86 and x86\_64 architecture](https://github.com/regomne/ilhook-rs)
- [winhook-rs: Windows API Hooking in Rust](https://github.com/SubconsciousCompute/winhook-rs)
  - Not a lib
- [ezhook: Function hooking for x86 in Rust.](https://github.com/cppio/ezhook)
- [winhooker: windows function hooking on x64](https://github.com/roeeshoshani/winhooker)
`)
