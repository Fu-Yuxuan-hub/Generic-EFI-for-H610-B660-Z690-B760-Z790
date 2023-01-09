<h1 align="center">General-EFI-for-600/700-Series</h1>
<h3 align="center">600/700系主板通用EFI配置文件</h3>
<br>

## 概览 / Overview

辅助快速安装黑苹果的模板

Template for Quick installation of Hackintosh

## 免责声明 / Disclaimer

你的保修将完全失效。如果您有任何疑虑，请在使用我的项目之前先进行一些研究。我对任何损失均不负责，包括但不限于 Kernel Panic、设备无法启动或无法正常工作、硬件损坏或数据丢失、原子弹爆炸、第三次世界大战、SCP 基金会无法避免的 CK 级现实重构等。

Your warranty is now void. Please do some research if you have any concerns before utilizing my project. I am not responsible for any loss, including but not limited to Kernel Panic, device fail to boot or can not function normally, storage damage or data loss, atomic bombing, World War III, The CK-Class Restructuring Scenario that SCP Foundation can not prevent, and so on.

## 必读参考资料 / Refrence

- [dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [dortania's OpenCore Post Install Guide](https://dortania.github.io/OpenCore-Post-Install/)
- [dortania Getting Started with ACPI](https://dortania.github.io/OpenCore-Post-Install/)
- [dortania opencore multiboot](https://github.com/dortania/OpenCore-Multiboot)
- [WhateverGreen Intel HD Manual](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md)
- `Configuration.pdf` and `Differences.pdf` in each OpenCore releases.
- [daliansky/OC-little](https://github.com/daliansky/OC-little)
- [OpenCore 简体中文参考手册 (非官方)](https://oc.skk.moe)
- [修复Gigabyte Z690板上的睡眠唤醒问题](https://www.tonymacx86.com/threads/z690-chipset-and-alder-lake-cpus.316618/page-132)

**务必阅读上述参考资料**

**No seriously, PLEASE read those.**

## Requirement / 需求和依赖

### Basic / 基本需求

- A macOS machine (optional): to create the macOS installer and build the EFI.
  一台已经安装好 macOS 的机器，用于制作 macOS 安装器和编译本项目
- Flash drive, 16GB or more, for the above purpose.
  一个容量大于等于 16 GiB 的 U 盘
- [PlistEDPlus](https://github.com/ic005k/PlistEDPlus) to edit plist files on Windows.
  编辑 plist 文件的工具 [PlistEDPlus](https://github.com/ic005k/PlistEDPlus)
- [ProperTree](https://github.com/corpnewt/ProperTree) to edit plist files on Windows/macOS.
  编辑 plist 文件的工具 [ProperTree](https://github.com/corpnewt/ProperTree)
- [MaciASL](https://github.com/acidanthera/MaciASL) for patching ACPI tables and editing ACPI patches.
  用于修补和编辑 ACPI 的工具 [MaciASL](https://github.com/acidanthera/MaciASL)
- [HackinTool](https://github.com/headkaze/Hackintool) for diagnosis ONLY. Most of the built-in patches are outdated.
  **仅用于** 诊断的 [HackinTool](https://github.com/headkaze/Hackintool)，大部分内置的补丁和工具已经过时、不再适用
- Patience and time, especially if this is your first time Hackintosh-ing.
  耐心和时间。如果你是第一次进行黑苹果，这尤为重要

### 硬件修改 / Hardware Modification

#### 固态硬盘 / SSD

三星 PM981/PM981a/PM991 和 镁光 2200S **完全** 无法使用，务必更换至少一块 SSD 硬盘。

Samusung PM981/PM981a/PM991 and Micron 2200S is not supported AT ALL. Make sure to switch at least one SSD.

#### 无线网卡 / Wireless Card

It is recommended to use Broadcom wireless network card to obtain **Better** performance and use native functions about「Apple Ecology」(I mean, 100x FASTER!)

建议使用博通无线网卡以获得 **更好** 的性能和使用原生的关于「苹果生态」的功能（更好，指速度快 **100 倍**）

### 修改BIOS设置 / BIOS Settings

禁用 / Disabled
* Fast Boot～快速启动
* VT-d(can be enabled if you set DisableIoMapper Quirks to YES)～VT-d（如果DisableIOMapper Quirks设置为YES，则可以启用）
* CSM～CSM 兼容性支持模块
* Thunderbolt (Temporarily disabled)～雷雳（暂时禁用）
* Intel SGX～英特尔SGX
* Intel Platform Trust～英特尔平台信任
* CFG Lock(MSR 0xE2 write protection)～CFG锁（MSR 0xE2写保护）（必须关闭，如果找不到该选项，则在OpenCore的config-内核-> Quirks下启用与CFG Lock相关选项）
* Secure Boot～安全启动
* Parallel Port～并口
* Serial/COM Port～串行/COM端口
* Resizable BAR Support

启用 / Enabled
* VT-x～VT-x
* UEFI启动模式。请不要使用Legacy（UEFI startup mode. Please don't use Legacy）
* 硬盘模式改AHCI。不能用IDE和RST RAID。（Hard disk mode changed to AHCI. IDE and RST Raid cannot be used）
* Above 4G decoding～大于4G地址空间解码
* Hyper-Threading～超线程
* Execute Disable Bit～执行禁用位
* EHCI/XHCI Hand-off～EHCI / XHCI接手控制
* OS type: Windows 8.1/10 UEFI Mode～操作系统类型：Windows 8.1 / 10 UEFI模式
* DVMT Pre-Allocated(iGPU Memory): DVMT预分配（iGPU内存）：64MB及以上 （64MB and above）
* Legacy RTC Device～传统RTC设备

## 其他信息 / Other Information

OpenCore关于Kernel的Quirks XhciPortLimit 在macOS Big Sur 11.3及更新版本中失效。

OpenCore Quirks XhciPortLimit for Kernel is invalid in macOS Big Sur 11.3 and later.

请在安装 macOS Big Sur 11.3以及更新版本前，定制USB端口。

Please customize the USB Port before installing MacOS Big Sur 11.3 or later.

在安装完 macOS Big Sur 11.3以及更新版本后，请禁用config-Kernel-Quirks-XhciPortLimit 。

After installing macOS Big Sur 11.3 and later, disable config-Kernel-Quirks-XhciPortLimit .           

如果您遇到相关的ACPI错误，请启用*将MC__更改为MCHC，*并可能将*ADBG更改为XDBG*

If you get ACPI Errors,please enable change *MC__ to MCHC*
 

## End / 结语
This EFI supports `macOS Catalina`,`macOS Big Sur`,`macOS Monterey` and `macOS Ventura Beta`       

本项目所提供的EFI支持`macOS Catalina`,`macOS Big Sur`,`macOS Monterey`和`macOS Ventura Beta`


Welcome to submit [Issue](https://github.com/Fu-Yuxuan-hub/General-EFI-for-600-Series/issues) and [Pull request](https://github.com/Fu-Yuxuan-hub/General-EFI-for-600-Series/pulls)

欢迎各位积极提交[Issue](https://github.com/Fu-Yuxuan-hub/General-EFI-for-600-Series/issues)和[Pull request](https://github.com/Fu-Yuxuan-hub/General-EFI-for-600-Series/pulls)

