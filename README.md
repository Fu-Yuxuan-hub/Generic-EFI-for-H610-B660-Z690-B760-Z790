<h1 align="center">General-EFI-for-600/700-Series</h1>
<h3 align="center">600/700系主板通用EFI配置文件</h3>
<br>

## 概览 / Overview

更简单的安装和使用 12/13 代黑苹果

Easier installation and use of 12/13 generation hackintosh

## 免责声明 / Disclaimer

你的保修将完全失效。如果您有任何疑虑，请在使用我的项目之前先进行一些研究。我对任何损失均不负责，包括但不限于 Kernel Panic、设备无法启动或无法正常工作、硬件损坏或数据丢失、原子弹爆炸、第三次世界大战、SCP 基金会无法避免的 CK 级现实重构等。

Your warranty is now void. Please do some research if you have any concerns before utilizing my project. I am not responsible for any loss, including but not limited to Kernel Panic, device fail to boot or can not function normally, storage damage or data loss, atomic bombing, World War III, The CK-Class Restructuring Scenario that SCP Foundation can not prevent, and so on.

## 安装前 / Before Installation

### 阅读以下资料 / Read the following reference

- [dortania&#39;s OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [dortania Getting Started with ACPI](https://dortania.github.io/OpenCore-Post-Install/)
- [daliansky/OC-little](https://github.com/daliansky/OC-little)
- [OpenCore 简体中文参考手册 (非官方)](https://oc.skk.moe)

### 需求 / Requirement

- Flash drive, 4GB or more, for the above purpose.

  一个容量大于等于 4 GB 的 U 盘

- [OCAuxiliaryTools](https://github.com/ic005k/OCAuxiliaryTools) to edit plist files on Windows/macOS.

  编辑 plist 文件的工具 [OCAuxiliaryTools](https://github.com/ic005k/OCAuxiliaryTools)

- Patience and time, especially if this is your first time Hackintosh-ing.

  耐心和时间。如果你是第一次进行黑苹果，这尤为重要

### 硬件修改 / Hardware Modification

#### 固态硬盘 / SSD

- 三星 PM981/PM981a/PM991 和 镁光 2200S **完全** 无法使用，务必更换至少一块 SSD 硬盘。

  Samusung PM981/PM981a/PM991 and Micron 2200S is not supported AT ALL. Make sure to switch at least one SSD.

#### 无线网卡 / Wireless Card

- 建议使用博通无线网卡以获得 **更好** 的性能和使用原生的关于「苹果生态」的功能

  It is recommended to use Broadcom wireless network card to obtain **Better** performance and use native functions about「Apple Ecology」

### 下载 EFI / Download EFI

- 发行版EFI请访问 [Releases](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/releases) 页面，**请勿**克隆或者下载 「main 分支」

  For the released EFI, please visit [Releases](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/releases) page. **Please do not** clone or download the 「main branch」

### EFI 调整 / EFI Adaption

#### USB 2.0, USB 3.0

- 请在安装 macOS Big Sur 11.3以及更新版本前，使用 [USBToolBox](https://github.com/USBToolBox/tool) 定制USB端口。

  Please customize the USB Port with [USBToolBox](https://github.com/USBToolBox/tool) before installing MacOS Big Sur 11.3 or later.

#### ACPI

- There are many configurations with various ACPI patches. Some Alder Lake systems use none of these patches. - Apply as needed:

  在 Alder Lake 平台上有各种 ACPI 补丁的配置。其中一些 Alder Lake 系统不使用这些补丁。 - 按需启用：

  ![截屏2023-01-10 14 25 41](https://user-images.githubusercontent.com/74492520/211483887-c93bf9eb-188c-4071-b418-41de0bad7b3d.png)
  
  * Enable *Change MC__ to MCHC* and possibly *Change ADBG to XDBG* as shown above, if you encounter relevant ACPI Errors:
  
    如果您遇到相关的 ACPI 错误，请启用 *Change MC__ to MCHC* 并尝试启用 *Change ADBG to XDBG* 如上所示：
  
    * See: [fix wake from sleep issue on ***Gigabyte*** *Z690* boards](https://www.tonymacx86.com/threads/z690-chipset-and-alder-lake-cpus.316618/page-132#post-2291256).
  
      参阅：[修复 ***Gigabyte*** *Z690* 板上的睡眠唤醒问题](https://www.tonymacx86.com/threads/z690-chipset-and-alder-lake-cpus.316618/ 第 132 页#post-2291256)。
  
    * *Change ADBG to XDBG* is related to an [ACPI error](https://www.tonymacx86.com/threads/gigabyte-z690-aero-g-i5-12600k-amd-rx-6800-xt.317179/page-25#post-2291723) on **Gigabyte** Z690 boards.
  
      *Change ADBG to XDBG* 与在**技嘉** Z690 板上的 [ACPI 错误](https://www.tonymacx86.com/threads/gigabyte-z690-aero-g-i5-12600k-amd-rx-6800-xt.317179/ page-25#post-2291723) 有关 。
  
    * *Change MC__ to MCHC* is also used on **ASUS** Z690 boards.
  
      *Change MC__ to MCHC* 也适用于 **ASUS** Z690 主板。
  
#### AMD Radeon RX 6x50 XT

* 启用 ACPI 文件夹下的 *SSDT-6x50_FakeID.aml* 或 [定制](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/blob/main/AMD%20Radeon%20RX%206x50%20XT/README_CN.md) 您的专属驱动

  Enable *SSDT-6x50_FakeID.aml* in the ACPI folder or [customize](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/blob/main/AMD%20Radeon%20RX%206x50%20XT/README.md) your exclusive driver

#### 以太网 / Ethernet

See:

| Device                 | VT-d      | OpenCore                                                     | NOTE                                                         |
| ---------------------- | --------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| AQC-107                | YES       | Enabled *ForceAquantiaEthernet*<br>Disable *DisableIoMapper* | See: [Aquantia 10GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Aquantia%2010GbE) |
| AQC-113                | YES       | Enabled *ForceAquantiaEthernet*<br/>Disable *DisableIoMapper* | See: [Aquantia 10GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Aquantia%2010GbE) |
| Intel-i225-V **Way 1** | YES       | Disable *DisableIoMapper*                                    | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |
| Intel-i225-V **Way 2** | Unlimited | Enable *AppleIGC.kext*                                       | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |
| Intel-i226-V **Way 1** | YES       | Disable *DisableIoMapper*                                    | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |
| Intel-i226-V **Way 2** | Unlimited | Enable *AppleIGC.kext*                                       | See: [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE) |

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
* iGPU～核心显卡
* Resizable BAR Support(can be enabled if you set ResizeAppleGpuBars Quirks to 0)～（如果ResizeAppleGpuBars Quirks设置为0，则可以启用）

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

## 安装后 / Post-Install

### 需求 / Requirement

- [MaciASL](https://github.com/acidanthera/MaciASL) for patching ACPI tables and editing ACPI patches.

  用于修补和编辑 ACPI 的工具 [MaciASL](https://github.com/acidanthera/MaciASL)
- [Hackintool](https://github.com/headkaze/Hackintool) for diagnosis ONLY. Most of the built-in patches are outdated.

  **仅用于** 诊断的 [Hackintool](https://github.com/headkaze/Hackintool)，大部分内置的补丁和工具已经过时、不再适用

### EFI 调整 / EFI Adaption

现在的EFI **仅仅** 能够启动，仍推荐您做最后的润色

The current EFI can **only** boot. It's recommended to put the final touches on your hack.

#### 增加额外的内核扩展 / Add extra kexts

- [AirportItlwm](https://github.com/OpenIntelWireless/itlwm) for Intel Wi-Fi
- [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) for Intel Bluetooth
- [AirportBrcmFixup](https://github.com/acidanthera/AirportBrcmFixup) for Brcm Wi-Fi
- [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM) for Brcm Bluetooth

#### 优化 ACPI （可选） / Optimizing ACPI (optional)

- [SSDT-EC-USBX.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-methods/manual.html#finding-the-acpi-path) for simpler / 更简洁
- [SSDT-PLUG-ALT.aml](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-PLUG-ALT.dsl) for simpler / 更简洁
- [SSDT-SBUS-MCHC.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html) for correct temperature, fan, voltage, ICH, etc readings / 正确的温度、风扇、电压、ICH 等读数
- [SSDT-HPET.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/irq.html) for IRQ Conflicts (rarely used)  / IRQ 冲突（极少使用）
- [SSDT-RHUB.aml](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/compiled/SSDT-RHUB.aml) for USB (rarely used)  / USB（极少使用）
- [SSDT-DMAC.aml](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/wiki/AppleVTD#step-1-add-ssdt-dmac) provides an interface between the bus and the input-output devices , share the bus with the processor to make the data transfer, speedups the memory operations by bypassing the involvement of the CPU  (rarely used) / 在总线和输入输出设备之间提供了一个接口，与处理器共享总线以进行数据传输，通过绕过CPU的参与来加快内存操作（极少使用）

## 贡献 / Contribution

#### 如果您喜欢这个项目，请考虑通过以下方式支持它：`<br>`

#### If you like this project, please consider supporting it via:

* 给它一颗星！

  Give it a star!
* 给我[买](https://ko-fi.com/fuyuxuan)一杯咖啡😝。

  [Buy](https://ko-fi.com/fuyuxuan) me a coffee😝.
* 如果您遇到任何问题或想提出建议，请提出issue。

  Opening up an issue if you encountered any problem or want to make suggestions.

## Credits

* [acidanthera](https://github.com/acidanthera) for OpenCore.
* Apple for macOS.

## Notes

* 此仓库仅用于分享和帮助安装 macOS，**请勿 **用于商业用途。

  This repo is only for sharing and helping install macOS, **not for** commercial use.
