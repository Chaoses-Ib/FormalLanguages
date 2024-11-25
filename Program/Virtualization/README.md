# Virtualization
[Wikipedia](https://en.wikipedia.org/wiki/Virtualization)

Virtualization = program code interpreting (+ environment simulation).

OS is already an virtualizer, using CPU as its program code interpreter. But it may lack certain simulation features, like running another OS, altering some envrionment (CPU/OS) information.

Since almost every program requires some OS API, program virtualization also requires at least some OS virtualization. Every robust enough program virtualizer would eventually also be an OS virtualizer, unless the program runs on bare metal.