# Virtualization
[Wikipedia](https://en.wikipedia.org/wiki/Virtualization)

Virtualization = program code interpreting + environment simulation.

OS is already an virtualizer, using CPU as its program code interpreter. But it may lack certain simulation features, like running another OS, altering some envrionment (CPU/OS) information.

Since almost every program requires some OS API, program virtualization also requires at least some OS virtualization. Every robust enough program virtualizer would eventually also be an OS virtualizer, unless the program runs on bare metal.

## Tools
- [VMware](VMware/README.md)

- VirtualBox

- [Hyper-V](Hyper-V/README.md)

- [Multipass](https://canonical.com/multipass)
  - Linux
  - WSL2

    [command line - Cannot communicate with server: Post http://localhost/v2/apps: dial unix /run/snapd.socket: connect: no such file or directory - Ask Ubuntu](https://askubuntu.com/questions/1258137/cannot-communicate-with-server-post-http-localhost-v2-apps-dial-unix-run-sn)

    ```sh
    $ multipass launch --name foo
    launch failed: cannot connect to the multipass socket
    ```
  - Windows: Hyper-V, VirtualBox
    ```pwsh
    launch failed: The Hyper-V Hypervisor is disabled. Please enable by using the following
    command in an Administrator Powershell and reboot:
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
    ```
    ```pwsh
    > Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
    Enable-WindowsOptionalFeature : 功能名称 Microsoft-Hyper-V-Hypervisor 未知。
    ```

    VirtualBox:
    ```pwsh
    > multipass launch
    [2025-02-02T00:01:32.464] [error] [crucial-whitebait] Could not unregister VM: Process failed to start: 系统找不到指定的文件。
    launch failed: Could not generate a new UUID: Process failed to start: 系统找不到指定的文件。
    ```
    [\[Windows\] Could not unregister VM: Process failed to start - Issue #2480 - canonical/multipass](https://github.com/canonical/multipass/issues/2480)

[What's the best way to run a Linux VM on a Windows host? : r/linux4noobs](https://www.reddit.com/r/linux4noobs/comments/pgeq2q/whats_the_best_way_to_run_a_linux_vm_on_a_windows/)
