# Control-flow Obfuscation
## Return address hiding
Pass a wrong return address by `call`, or store a secret value and `jmp`, then calculate the correct return address and `ret`.

Pros:
- Avoid brute-force control-flow hacking
- Anti staic analysis

See also [instruction overlapping](../ISA/README.md#instruction-overlapping).

Used by VMProtect.