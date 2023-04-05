# 修复睡眠

* 在开始前，请确认您已经正确的定制了USB

## BIOS 设置

**禁用**

* 雷雳（如果需要请启用）
* RTC唤醒（如果存在）
* 网络唤醒（如果需要请启用）

**启用**

* ErP

## OpenCore 设置

### USBMap

* 请正确定制 USB

### ACPI

* 如果唤醒后蓝牙无法工作，请添加 ***SSDT-RHUB***。
* 精粤主板请添加 ***SSDT-PMEE***

### DeviceProperties

* 修复按两下唤醒主机。补丁如下：

![截屏2023-04-05 20 05 41](https://user-images.githubusercontent.com/74492520/230076717-1065454d-6cad-4017-b8a7-6219d4e30ab2.png)

**注**: 某些主板拥有两个USB控制器，并且外置的控制器唤醒优先级低，所以需要按两下. (ASUS TUF)

### Misc

* Misc-Hibernation Mode 为 None

## 系统设置

* Hackintool中均为绿色

![截屏2023-04-05 20 07 02](https://user-images.githubusercontent.com/74492520/230076750-711111f9-2fd8-4bdd-84f1-1f8c1017ce3f.png)

* 设置-节能全部关闭（除使硬盘进入睡眠状态）

![截屏2023-04-05 20 09 13](https://user-images.githubusercontent.com/74492520/230076790-a296c140-1194-4011-b220-32b9745016ed.png)

**注**：如果主机无法自动进入睡眠，请启用电能小憩


## 不能睡眠的主板

* 最新BIOS的ASUS (ASUS PRIME B660 with BIOS 2212)
* 一些拥有内置的Aquantia 10GbE网卡的主板 (比如 GIGABYTE Z790 AORUS MASTER)
