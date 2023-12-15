# Application Binary Interface
An **application binary interface** (**ABI**) is an interface between two binary program modules. It defines how data structures or computational routines are accessed in machine code, which is a low-level, hardware-dependent format.[^wiki]

- C
- [Component Object Model](https://github.com/Chaoses-Ib/Windows/blob/main/Applications/API/COM/README.md)
- .NET
  - [Assembly file format](https://learn.microsoft.com/en-us/dotnet/standard/assembly/file-format)
  - [CLR ABI](https://github.com/dotnet/runtime/blob/main/docs/design/coreclr/botr/clr-abi.md)
- JVM

## Comparison

<table>
<thead>
  <tr>
    <th>ABI</th>
    <th>优点</th>
    <th>缺点</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>C</td>
    <td>

- 支持广泛
  
  可以使用 C/C++、.NET、Rust、Go 实现
</ul>
    </td>
    <td>

- 依赖于具体架构，需要为每个架构单独编译和分发
- 使用 C/C++ 实现时会依赖 CRT
  - 动态链接 CRT
  
    需要确保安装有相应的 VC++ 运行时（VC++ 2015 后向后兼容，支持 VC++ 2015~2022 只需要安装 VC++ 2022 运行时）
  - 静态链接 CRT
  
    会造成一定的体积膨胀，增大内存占用
</ul>
    </td>
  </tr>
  <tr>
    <td>COM</td>
    <td>

- 面向对象，比 C 更适合描述复杂系统
- 语言中立
  
  可以使用 C++、.NET、Rust 实现
- 支持跨 32/64 位调用，尽管会损失一定性能
</ul>
    </td>
    <td>

- 尽管支持跨 32/64 位调用，但不支持跨架构
- 有一定学习门槛，且与 Windows 绑定，有经验的开发者较少
- 使用 C++ 实现时会依赖 CRT
</ul>
    </td>
  </tr>
  <tr>
    <td>.NET Framework</td>
    <td>

- 可以跨架构
- 开发成本相对较低
</ul>
    </td>
    <td>

- 限制于 C#、C++/CLI、IronPython 等 .NET 语言
- 不使用非托管代码时性能会弱于原生程序
</ul>
    </td>
  </tr>
  <tr>
    <td>.NET Standard</td>
    <td>

- 可以跨架构
- 开发成本相对较低
- 跨平台
- 跨 .NET 实现
</ul>
    </td>
    <td>

- 限制于 C#、C++/CLI、IronPython 等 .NET 语言
- 不使用非托管代码时性能会弱于原生程序
- 不支持 WPF 和 WinForms
</ul>
    </td>
  </tr>
</tbody>
</table>

[^wiki]: [Application binary interface - Wikipedia](https://en.wikipedia.org/wiki/Application_binary_interface)