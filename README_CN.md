600/700 系列主板通用 EFI 配置文件
========
提供给 600/700 系列主板使用的通用 EFI，附带安装时的设置以及常用的 kext

[English]()<br>
简体中文 (当前)


## 免责声明 

你的保修将完全失效。如果您有任何疑虑，请在使用我的项目之前先进行一些研究。我对任何损失均不负责，包括但不限于 Kernel Panic、设备无法启动或无法正常工作、硬件损坏或数据丢失、原子弹爆炸、第三次世界大战、SCP 基金会无法避免的 CK 级现实重构等。

## 重要的参考资料
- [dortania&#39;s OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [dortania Getting Started with ACPI](https://dortania.github.io/OpenCore-Post-Install/)
- [daliansky/OC-little](https://github.com/daliansky/OC-little)
- [OpenCore 简体中文参考手册 (非官方)](https://oc.skk.moe)

## 安装前

### 需求

- 一个容量大于等于 4 GB 的 U 盘

- 编辑 plist 文件的工具 [OCAuxiliaryTools](https://github.com/ic005k/OCAuxiliaryTools)

- 耐心和时间。如果你是第一次进行黑苹果，这尤为重要

### 硬件修改 

#### 固态硬盘 

- 三星 PM981/PM981a/PM991 和 镁光 2200S **完全** 无法使用，务必更换至少一块 SSD 硬盘。

#### 无线网卡

- 建议使用博通无线网卡以获得 **更好** 的性能和使用原生的关于「苹果生态」的功能
  >在 macOS Sonoma 中，Apple 已经删除了 *IO80211FamilyLegacy*，这导致博通无线网卡已经无法在 macOS Sonoma 中使用

### EFI 调整

#### 下载 EFI

- 请访问 [Releases](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/releases) 页面，**请勿** 克隆或者下载 「main 分支」

#### ACPI

- 预置有各种 ACPI 补丁的配置。 - 按需启用：

  ![截屏2023-01-10 14 25 41](https://user-images.githubusercontent.com/74492520/211483887-c93bf9eb-188c-4071-b418-41de0bad7b3d.png)
  
  * 如果您遇到 ACPI 错误，请尝试启用 *Change MC__ to MCHC* 或 *Change ADBG to XDBG*。如上所示：
  
    * 参阅：[修复 ***Gigabyte*** *Z690* 板上的睡眠唤醒问题](https://www.tonymacx86.com/threads/z690-chipset-and-alder-lake-cpus.316618/page-132#post-2291256)。
  
    * *Change ADBG to XDBG* 可修复 **技嘉** Z690 板上的 [ACPI 错误](https://www.tonymacx86.com/threads/gigabyte-z690-aero-g-i5-12600k-amd-rx-6800-xt.317179/page-25#post-2291723)。
  
    * *Change MC__ to MCHC* 也适用于 **ASUS** Z690 主板。
  
#### AMD Radeon RX 6x50 XT

* 启用 ACPI 文件夹下的 *SSDT-6x50_FakeID.aml* 

#### 以太网

| Device                 | VT-d      | OpenCore                                                     | NOTE                                                         |
| ---------------------- | --------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| AQC-107                | YES       | Enabled *ForceAquantiaEthernet*<br>Disable *DisableIoMapper* | See: [Aquantia 10GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Aquantia%2010GbE) |
| AQC-113                | YES       | Enabled *ForceAquantiaEthernet*<br/>Disable *DisableIoMapper* | See: [Aquantia 10GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Aquantia%2010GbE) |
| Intel-i225-V **Way 1** | YES       | Disable *DisableIoMapper*                                    | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |
| Intel-i225-V **Way 2** | Unlimited | Enable *AppleIGC.kext*                                       | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |
| Intel-i226-V **Way 1** | YES       | Disable *DisableIoMapper*                                    | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |
| Intel-i226-V **Way 2** | Unlimited | Enable *AppleIGC.kext*                                       | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |

### BIOS设置 

重要：

| 项                                | 启用/禁用 | 备注                                  |
| --------------------------------- | --------- | ------------------------------------- |
| Fast Boot                         | 禁用      |                                       |
| VT-d                              | 禁用      | 安装系统后启用此项，以启用 *AppleVTD* |
| CSM                               | 禁用      |                                       |
| CFG Lock                          | 禁用      |                                       |
| Secure Boot                       | 禁用      |                                       |
| Serial/COM Port                   | 禁用      |                                       |
| Resizable BAR Support             | 禁用      | *64bit Bar2* 缺失                     |
| VT-x                              |           |                                       |
| UEFI startup mode                 |           |                                       |
| Hard disk mode                    |           | *AHCI*                                |
| Above 4G decoding                 |           |                                       |
| Hyper-Threading                   |           |                                       |
| EHCI/XHCI Hand-off                |           |                                       |
| OS type: Windows 8.1/10 UEFI Mode |           |                                       |
| DVMT Pre-Allocated(iGPU Memory)   |           | 64MB and above                        |

其他

| 项                        | 启用/禁用 | 备注                            |
| ------------------------- | --------- | ------------------------------- |
| Thunderbolt               | 禁用      |                                 |
| Intel SGX                 | 禁用      |                                 |
| Intel Platform Trust(TPM) | 禁用      |                                 |
| Parallel Port             | 禁用      |                                 |
| iGPU                      | 禁用      | 会出现 *Reserved Memory Region* |
| Execute Disable Bit       |           |                                 |
| Legacy RTC Device         |           |                                 |
