# Execution Environment
## IA-32 / Intel 64
Any program or task running on an IA-32 / Intel 64 processor is given a set of resources for executing instructions and for storing code, data, and state information. These resources make up the basic execution environment for an IA-32 / Intel 64 processor:
- Address space

- Stack

  To support procedure or subroutine calls and the passing of parameters between procedures or subroutines, a stack and stack management resources are included in the execution environment.

- Basic program execution registers
  - Eight/Sixteen general-purpose registers
  - Six segment registers (16-bit)
  - FLAGS register
  - Instruction pointer register
  
  These registers comprise a basic execution environment in which to execute a set of general-purpose instructions.

- x87 FPU registers
  - Eight x87 FPU data registers (80-bit)
  - Control register (16-bit)
  - Status register (16-bit)
  - Tag register (16-bit)
  - Opcode register (11-bit)
  - FPU instruction pointer register (48-bit)
  - FPU operand (data) pointer register (48-bit)
  
  These registers provide an execution environment for operating on single-precision, double-precision, and double extended-precision floating-point values, word integers, doubleword integers, quadword integers, and binary coded decimal values.

- Eight MMX registers (64-bit)
- Eight/Sixteen XMM registers (128-bit) and MXCSR register (32-bit)
- Eight/Sixteen YMM registers (256-bit)
- Bounds registers
  - BND0-BND3

    Each of the BND0-BND3 register stores the lower and upper bounds (64 bits each) associated with the pointer to a memory buffer. They support execution of the Intel MPX instructions.
  - BNDCFGU and BNDSTATUS

    BNDCFGU configures user mode MPX operations on bounds checking. BNDSTATUS provides additional information on the \#BR caused by an MPX operation.

In addition to the resources provided in the basic execution environment, the IA-32 architecture provides the following resources as part of its system-level architecture. They provide extensive support for operating-system and system-development software:[^sdm]
- I/O ports

- Control registers ([Wikipedia](https://en.wikipedia.org/wiki/Control_register#Control_registers_in_Intel_x86_series))
  
  The five control registers (CR0-CR4) determine the operating mode of the processor and the characteristics of the currently executing task. Intel 64 adds the task priority register (CR8).

- Memory management registers
  - Global descriptor table register (GDTR)
  - Interrupt descriptor table register (IDTR)
  - Task register (TR)
  - Local descriptor table register (LDTR)

  These registers specify the locations of data structures used in protected mode memory management.

- Debug registers

  The debug registers (DR0-DR7) control and allow monitoring of the processor’s debugging operations.

- Memory type range registers

  The MTRRs are used to assign memory types to regions of memory.

- Model-specific registers

  The processor provides a variety of model-specific registers that are used to control and report on processor performance.

- Machine check registers

  The machine check registers consist of a set of control, status, and error-reporting MSRs that are used to detect and report on hardware (machine) errors.

- Performance monitoring counters

  The performance monitoring counters allow processor performance events to be monitored.


[^sdm]: Intel® 64 and IA-32 Architectures Software Developer Manuals