# Control-flow Obfuscation
## Address hiding
- Readactor: Practical Code Randomization Resilient to Memory Disclosure[^craneReadactorPracticalCode2015]

### Return address hiding
Pass a wrong return address by `call`, or store a secret value and `jmp`, then calculate the correct return address and `ret`.

Pros:
- Avoid brute-force control-flow hacking
- Anti staic analysis

See also [instruction overlapping](../ISA/README.md#instruction-overlapping).

Used by VMProtect.

## Multi-threading
- Model of Execution Trace Obfuscation Between Threads[^shaModelExecutionTrace2022]


[^craneReadactorPracticalCode2015]: Crane, S., Liebchen, C., Homescu, A., Davi, L., Larsen, P., Sadeghi, A.-R., Brunthaler, S., & Franz, M. (2015). Readactor: Practical Code Randomization Resilient to Memory Disclosure. 2015 IEEE Symposium on Security and Privacy, 763–780. https://doi.org/10.1109/SP.2015.52
[^shaModelExecutionTrace2022]: Sha, Z., Shu, H., Xiong, X., & Kang, F. (2022). Model of Execution Trace Obfuscation Between Threads. IEEE Transactions on Dependable and Secure Computing, 19(6), 4156–4171. https://doi.org/10.1109/TDSC.2021.3123159
