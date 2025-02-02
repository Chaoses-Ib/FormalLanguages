# Hyper-V
[Wikipedia](https://en.wikipedia.org/wiki/Hyper-V)
- 2008-06

## Installation
[Install Hyper-V | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/install-hyper-v?pivots=windows-server)
- Server Manager
  - Hyper-V is a "role", not a "feature"
- `Install-WindowsFeature -Name Hyper-V -IncludeManagementTools`

## Hyper-V Manager
- `C:\Windows\System32\virtmgmt.msc` (`C:\Windows\System32\vmcompute.exe`)
- 默认开启 Secure Boot
- 强行关闭是可能失败的

[Windows10 Hyper-v The server encountered an error while creating New Virtual Machine. Failed to access configuration store 0x80070003 - Microsoft Q&A](https://learn.microsoft.com/en-us/answers/questions/92017/windows10-hyper-v-the-server-encountered-an-error)

## Data
- `C:\ProgramData\Microsoft\Windows\Hyper-V`
