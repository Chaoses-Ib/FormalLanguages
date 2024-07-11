# IDA
[IbIDA](https://github.com/Chaoses-Ib/BinaryAnalysis)

## Versions
[IDA updates and releases](https://hex-rays.com/products/ida/news/).

[fckilfkscwusoopguhi7i6yg3l6tknaz7lrumvlhg5mvtxzxbbxlimid.onion](http://fckilfkscwusoopguhi7i6yg3l6tknaz7lrumvlhg5mvtxzxbbxlimid.onion/)
- [\[分享\]IDA 版本历代记-资源下载-看雪-安全社区|安全招聘|kanxue.com](https://bbs.kanxue.com/thread-277984.htm)

v8.3:
- [IDA Pro 8.3 (x86, x86\_64) - 『逆向资源区』 - 吾爱破解 - LCG - LSG |安卓破解|病毒分析|www.52pojie.cn](https://www.52pojie.cn/thread-1861384-1-1.html)

## Security
- [IdaMeme: Crashes ida on static analyses.](https://github.com/Azvanzed/IdaMeme)

  Massive chained JMPs at the entry point will result in stack overflow and high peak memory usage.
  - 8k → 4M (default `SizeOfStackReserve`), 2.5G
  - 20k → <40M, 5G

  Also work on Ghidra's Auto Analysis, though it won't crash.
  - 20k → ?, >2.2G

  [\[Source\] IdaMeme](https://www.unknowncheats.me/forum/anti-cheat-bypass/578797-idameme.html)

- [The Dukes R&D Finds a New Anti-Analysis Technique](https://unit42.paloaltonetworks.com/unit42-the-dukes-rd-finds-a-new-anti-analysis-technique/)

  > The less obvious reason is that it takes advantage of a bug in the popular IDA disassembler that was recently fixed in the latest version of IDA. Figure 2 shows the DLL opened in a recent (but not the latest) version of IDA, specifically version 6.9.160222. The exports tab shows the only exported function is DllEntryPoint and does not display any of the other functions with blank names.

  > The release notes for this version of IDA were posted on August 8, 2016, which was two days before the attack delivered the payload leveraging the technique. We believe this threat group either found this bug in IDA that caused the bug fix or the group monitors IDA release notes for bug fixes to figure out how to make analysis difficult. While we cannot know for certain, we believe the latter to be the more plausible explanation due to the sequential order of the IDA release notes and the attack date. Also, the latter would suggest that the group is able to quickly find anti-analysis opportunities and deploy the techniques within their toolset.