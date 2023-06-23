## Intel 2.5GbE

Support：

| macOS                      | AppleVTD | Fake | Drop OEM DMAR Table | Boot-args                        |
| :------------------------- | -------- | ---- | ------------------- | -------------------------------- |
| Ventura (13.0+)            | YES      | NO   | NO                  | NO / e1000=0(with SSDT and kext) |
| Monterey (12.3+)           | YES      | NO   | NO                  | NO / e1000=0(with SSDT and kext) |
| Monterey (12.0-12.2.1)     | YES      | NO   | NO                  | dk.e1000=0                       |
| Big Sur (11.4+)            | YES / NO | NO   | YES / NO            | dk.e1000=0                       |
| Big Sur (11.0-11.3)        | YES / NO | YES  | YES / NO            | dk.e1000=0                       |
| Catalina (10.15.0-10.15.7) | YES / NO | YES  | YES / NO            | dk.e1000=0                       |

> From macOS Monterey, Apple's native hardware requires VT-d to provide a DMA remapping strategy. And starting from Intel 600 series, it found that there is no *Reserved Memory Region* in DMAR, only *IOAPIC*. So to enable Intel 2.5GbE only need to enable *AppleVTD*.

