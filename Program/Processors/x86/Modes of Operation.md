# Modes of Operation
[^sdm]

## IA-32
- Real-address mode  
	The processor is placed in real-address mode following power-up or a reset. This mode implements the programming environment of the Intel 8086 processor with extensions (such as the ability to switch to protected or system management mode).
- Protected mode  
	Among the capabilities of protected mode is *virtual-8086 mode*, the ability to directly execute “real-address mode” 8086 software in a protected, multi-tasking environment.
- System management mode

## Intel 64
- ...
- IA-32e
	- Compatibility mode  
		Compatibility mode permits most legacy 16-bit and 32-bit applications to run without re-compilation under a 64-bit operating system. Legacy applications that run in Virtual 8086 mode or use hardware task management will not work in this mode. 
	- 64-bit mode  
		64-bit mode is enabled by the 64-bit operating system on a code-segment basis. Its default address size is 64 bits and its default operand size is 32 bits. The default operand size can be overridden on an instruction-by-instruction basis using a REX opcode prefix in conjunction with an operand size override prefix.

[^sdm]: Intel® 64 and IA-32 Architectures Software Developer Manuals