## AQC 107(s)/113

支持：

| Device  | Big Sur | Monterey | Ventura |
| ------- | ------- | -------- | ------- |
| AQC-107 | 是      | 是       | 是      |
| AQC-113 | 否      | 是       | 是      |

如果您正在运行 Monterey、Ventura 或更新版本，则有必要启用内核怪癖 _ForceAquantiaEthernet_。 如果它不起作用，您应该启用 config.plist 文件中包含的六个内核补丁。

> 如果您有 Gigabyte GC-AQC113C 扩展卡，需要启用的SSDT需要修改PCI路径

**注：**
如果您的主板有一个板载的 Aquantia 10GbE 端口，它很可能是原生支持的。 这意味着**不需要特殊的 SSDT**。 这也意味着我们不应启用 SSDT，也不需将其调整为板载 10GbE 控制器。 同样，大多数板载 10GbE 控制器都不需要 SSDT。