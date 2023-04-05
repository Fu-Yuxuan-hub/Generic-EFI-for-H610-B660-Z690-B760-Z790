# Fixing Sleep

## BIOS settings

**Disabled**

* Thunderbolt (enable if required)
* RTC wakeup (if present)
* Wake on LAN (enable if required)

**Enable**

* ErP

## OpenCore Settings

### USBMap

* Please customize the USB correctly

### ACPI

* If bluetooth doesn't work after wake up, please add ***SSDT-RHUB***.
* Jingyue motherboard please add ***SSDT-PMEE***

### DeviceProperties

* Fix double press to wake up the computer. The patch is as follows:

![Screenshot 2023-04-05 20 05 41](https://user-images.githubusercontent.com/74492520/230076717-1065454d-6cad-4017-b8a7-6219d4e30ab2.png)

**Note**: Some motherboards have two USB controllers, and the external controller has a low wake-up priority, so it needs to be pressed twice. (ASUS TUF)

### Misc

* Misc-Hibernation Mode is None

## System Settings

* All are green in Hackintool

![Screenshot 2023-04-05 20 07 02](https://user-images.githubusercontent.com/74492520/230076750-711111f9-2fd8-4bdd-84f1-1f8c1017ce3f.png)

* Settings - energy saving is all turned off (except putting the hard disk into sleep state)

![Screenshot 2023-04-05 20 09 13](https://user-images.githubusercontent.com/74492520/230076790-a296c140-1194-4011-b220-32b9745016ed.png)

**Note**: If the computer cannot go to sleep automatically, please enable power nap


## Boards that cannot sleep

* ASUS with latest BIOS (ASUS PRIME B660 with BIOS 2212)
* Some motherboards with built-in Aquantia 10GbE network card (such as GIGABYTE Z790 AORUS MASTER)
