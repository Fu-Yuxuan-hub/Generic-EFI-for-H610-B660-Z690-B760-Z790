Changelog
==================

#### v0.9.5

* Update OpenCore to **0.9.5**
* Add support for **AMD Radeon RX 6700/6750**
* Add _config_Raptor_Lake_Re.plist_ for Intel Core Processors (14th gen)

#### v0.9.3

* Add macOS Sonoma support
* Improved `XhciPortLimit` quirk on macOS 11 to 14

#### v0.9.2

* Add *SSDT-6x50_FakeID.aml* for AMD Radeon RX 6x50

#### v0.9.0

* Add AppleIGC for Intel 2.5 GbE

#### v0.8.9

* Update OpenCore to 0.8.9
* Delete kext and SSDT about Intel 2.5 GbE. For more information, see [Intel 2.5GbE](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/tree/main/Intel%202.5GbE)
* Delete patch about Aquantia 10GbE, use [AppleVTD](https://github.com/Fu-Yuxuan-hub/General-EFI-for-H610-B660-Z690-B760-Z790/wiki/AppleVTD) to enable this.

#### v0.8.8

* Update `OpenCore` to 0.8.8
* Add Ethernet Driver
* Add `ACPI-Source` to save original `.dsl`
* Add comment
* Add CPUFriend.kext and CPUFriendDataProvider.kext
* Add ACPI-Delete about Intel i225/226-V Ethernet

#### v0.8.3

* Initial release
