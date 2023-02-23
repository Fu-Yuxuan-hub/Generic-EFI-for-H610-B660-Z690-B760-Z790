## Intel 2.5GbE

Support：

| Device       | Big Sur | Monterey (12.3) | Ventura |
| ------------ | ------- | --------------- | ------- |
| Intel i225-V | No      | Yes             | Yes     |
| Intel i226-V | No      | Yes             | Yes     |

You need to enable ***VT-d*** in BIOS and disable ***DisableIoMapper*** in OpenCore. That is enough.

> From macOS Monterey, Apple's native hardware requires VT-d to provide a DMA remapping strategy. And starting from Intel 600 series, it found that there is no *Reserved Memory Region* in DMAR, only *IOAPIC*. So to enable Intel 2.5GbE only need to enable *AppleVTD*.



# Frequently Asked Questions

## Installation

### What's the difference between `SSDT-I225V-Ethernet` and `AppleVTD`

| Ways                | Driver                                  |
| ------------------- | --------------------------------------- |
| SSDT-I225V-Ethernet | com.apple.driver.AppleIntelI210Ethernet |
| AppleVTD            | com.apple.DriverKit-AppleEthernetE1000  |

### Why need AppleIntelI210Ethernet.kext on Ventura

Apple delete this driver on Ventura. It is in` /System/Library/Extensions/IONetworkingFamily.kext/Contents/PlugIns `
