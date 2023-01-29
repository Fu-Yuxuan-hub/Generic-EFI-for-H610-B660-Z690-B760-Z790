## AQC 107(s)/113

Support：

| Device  | Big Sur | Monterey | Ventura |
| ------- | ------- | -------- | ------- |
| AQC-107 | Yes     | Yes      | Yes     |
| AQC-113 | No      | Yes      | Yes     |

If you're running Monterey, Ventura or newer it is necessary to enable the kernel quirk _ForceAquantiaEthernet_. If it does not work, you shoule enable the six kernel patches that are included in config.plist files. 
> If you have a Gigabyte GC-AQC113C add-in-card, it is necessary to enable the SSDT shown below and to modify the PCI path 

**NOTE:**
If your motherboard has a built-in Aquantia 10GbE port, it is most likely supported natively. This means **no special SSDT** is needed. This also means we should not enable the SSDT shown below nor attempt to adapt it for the on-board 10GbE controller. Again, no SSDT is needed for most on-board 10GbE controllers.