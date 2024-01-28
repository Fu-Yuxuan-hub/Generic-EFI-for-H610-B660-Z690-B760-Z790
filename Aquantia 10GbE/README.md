## AQC 107(s)/113

Support：

| Device  | Big Sur | Monterey | Ventura | Sonoma |
| ------- | ------- | -------- | ------- | ------ |
| AQC-107 | Yes     | Yes      | Yes     | Yes    |
| AQC-113 | No      | Yes      | Yes     | Yes    |

If you're running Monterey, Ventura or newer it is necessary to enable the kernel quirk _ForceAquantiaEthernet_. 
> If you have a Gigabyte GC-AQC113C add-in-card, it is necessary to enable the *SSDT-AQUANTIA-AQC113C* and to modify the ACPI path

**NOTE:**
If your motherboard has a built-in Aquantia 10GbE port, it is most likely supported natively. This means **no special SSDT** is needed. 