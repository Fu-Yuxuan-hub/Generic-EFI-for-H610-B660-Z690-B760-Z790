Generic EFI for 600/700 series motherboards
========
Generic EFI for 600/700 series motherboards, with installation settings and common kexts

English(current)<br>
[简体中文](https://github.com/Fu-Yuxuan-hub/Generic-EFI-for-H610-B660-Z690-B760-Z790/blob/main/README_CN.md)

## Disclaimer

Your warranty is now void. Please do some research if you have any concerns before utilizing my project. I am not responsible for any loss, including but not limited to Kernel Panic, device fail to boot or can not function normally, storage damage or data loss, atomic bombing, World War III, The CK-Class Restructuring Scenario that SCP Foundation can not prevent, and so on.

## Reference

- [dortania&#39;s OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [dortania Getting Started with ACPI](https://dortania.github.io/OpenCore-Post-Install/)
- [daliansky/OC-little](https://github.com/daliansky/OC-little)
- [OpenCore 简体中文参考手册 (非官方)](https://oc.skk.moe)

## Before Installation

### Requirement

- Flash drive, 4GB or more, for the above purpose.

- [OCAuxiliaryTools](https://github.com/ic005k/OCAuxiliaryTools) to edit plist files on Windows/macOS.

- Patience and time, especially if this is your first time Hackintosh-ing.

### Hardware Modification

#### SSD

- Samusung PM981/PM981a/PM991 and Micron 2200S is not supported AT ALL. Make sure to switch at least one SSD.

#### Wireless Card

- For macOS Ventura and before: It is recommended to use Broadcom wireless network card to obtain **Better** performance and use native functions.
- For macOS Sonoma and later: It is recommended to use Intel wireless network card or use Broadcom wireless network with [OpenCore Legacy Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher/pull/1077).

### EFI Modification

#### Download EFI

- Please visit [Releases](https://github.com/Fu-Yuxuan-hub/Generic-EFI-for-H610-B660-Z690-B760-Z790/releases) page, **Please do not** clone or download the 「main branch」

#### ACPI

- There are preset configurations for various ACPI patches. - Enable on demand:

  ![截屏2023-01-10 14 25 41](https://user-images.githubusercontent.com/74492520/211483887-c93bf9eb-188c-4071-b418-41de0bad7b3d.png)
  
  * Enable *Change MC__ to MCHC* and possibly *Change ADBG to XDBG* as shown above, if you encounter relevant ACPI Errors:
  
    * See: [fix wake from sleep issue on ***Gigabyte*** *Z690* boards](https://www.tonymacx86.com/threads/z690-chipset-and-alder-lake-cpus.316618/page-132#post-2291256).
  
    * *Change ADBG to XDBG* is related to an [ACPI error](https://www.tonymacx86.com/threads/gigabyte-z690-aero-g-i5-12600k-amd-rx-6800-xt.317179/page-25#post-2291723) on **Gigabyte** Z690 boards.

    * *Change MC__ to MCHC* is also used on **ASUS** Z690 boards.


* Customize SSDT (Optional)

  * [SSDT-EC-USBX.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-methods/manual.html#finding-the-acpi-path) 
  * [SSDT-PLUG-ALT.aml](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-PLUG-ALT.dsl) 
  * [SSDT-SBUS-MCHC.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html) 
  * [SSDT-HPET.aml](https://dortania.github.io/Getting-Started-With-ACPI/Universal/irq.html) 

#### AMD Radeon RX 6x50 XT

* Enable *SSDT-6x50_FakeID.aml* in the ACPI folder

### BIOS Settings

Important：

| items                                | Options | Comments                                  |
| --------------------------------- | --------- | ------------------------------------- |
| Fast Boot                         | Disabled      |                                       |
| VT-d                              | Disabled      | Enable this after installing the system to enable *AppleVTD* |
| CSM                               | Disabled      |                                       |
| CFG Lock                          | Disabled      |                                       |
| Secure Boot                       | Disabled      |                                       |
| Serial/COM Port                   | Disabled      |                                       |
| Resizable BAR Support             | Disabled      | *64bit Bar2* missing                   |
| VT-x                              | Enabled      |                                       |
| UEFI startup mode                 | Enabled      |                                       |
| Hard disk mode                    | *AHCI*   |                                       |
| Above 4G decoding                 | Enabled      |                                       |
| Hyper-Threading                   | Enabled      |                                       |
| EHCI/XHCI Hand-off                | Enabled      |                                       |
| DVMT Pre-Allocated(iGPU Memory)   | 64MB and above |                                 |

Others:

| items                        | Options | Comments                            |
| ------------------------- | --------- | ------------------------------- |
| Thunderbolt               | Disabled      |                                 |
| Intel SGX                 | Disabled      |                                 |
| Intel Platform Trust(TPM) | Disabled      |                                 |
| Parallel Port             | Disabled      |                                 |
| iGPU                      | Disabled      | *Reserved Memory Region* will appear |
| Execute Disable Bit       | Enabled          |                                 |
| Legacy RTC Device         | Enabled          |                                 |

## Contribution

#### If you like this project, please consider supporting it via:

* Give it a star!

* [Buy](https://ko-fi.com/fuyuxuan) me a coffee😝.
  * Also can [WeChat](https://github.com/Fu-Yuxuan-hub/Generic-EFI-for-H610-B660-Z690-B760-Z790/blob/main/Donation/WeChat.JPG) or [Alipay](https://github.com/Fu-Yuxuan-hub/Generic-EFI-for-H610-B660-Z690-B760-Z790/blob/main/Donation/Alipay.JPG)

* Opening up an issue if you encountered any problem or want to make suggestions.
  > Attention：Please ask questions according to the predetermined template

## Credits

* [acidanthera](https://github.com/acidanthera) for OpenCore.
* Apple for macOS.

## Attention

* This repo is only for sharing and helping install Hackintosh, **not for** commercial use.

© 杆杆只爱学习, Released under the MIT License.