## AQC 107(s)/113

支持：

| Device  | Big Sur | Monterey | Ventura | Sonoma |
| ------- | ------- | -------- | ------- | ------ |
| AQC-107 | 是      | 是       | 是      | 是      |
| AQC-113 | 否      | 是       | 是      | 是      ｜

如果您正在运行 Monterey 及更新版本，则需要启用 Kernel-Quirks-_ForceAquantiaEthernet_。 
> 如果您使用 Gigabyte GC-AQC113C 扩展卡，则需要启用 *SSDT-AQUANTIA-AQC113C* 并修改 APCI 路径

**注意：**
如果您的主板有一个板载的 Aquantia 10GbE 网络端口，则它是原生支持的，这意味着**不需要特殊的 SSDT**。