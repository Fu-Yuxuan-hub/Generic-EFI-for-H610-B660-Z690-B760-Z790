# AppleIGC

Intel 2.5G Ethernet driver for macOS. Based on the Intel igc implementation in Linux commit 0bf913e07b377cfc288cfe488ca30b7d67059d8a. 

In theory, it will have better performance than the AppleEthernetE1000 driver implemented in user space. It's also more stable for me, since macOS Monterey's AppleEthernetE1000 on i226-V immediately causes a kernel panic.

Only test on macOS Monterey 12.6.1 with Intel i226-V for days. 
It should work on other versions macOS and all igc compliant devices(i225, i226 and others) whose PCI id may not be filled in the IOPCIMatch. (You can fill it out yourself to test.) Use at your own risk.

## Known Issues
- Only work in auto-negotiation mode. "Force mode currently not supported." (from `igc_ethtool_set_link_ksettings()` in igc_ethtool.c)
