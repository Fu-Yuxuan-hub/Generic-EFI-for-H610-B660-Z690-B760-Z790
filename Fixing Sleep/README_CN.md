# 修复睡眠

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



**注**: 某些主板拥有两个USB控制器，并且外置的控制器唤醒优先级低，所以需要按两下. (ASUS TUF)

### Misc

* Misc-Hibernation Mode 为 None

## 系统设置

* Hackintool中均为绿色
* 设置-节能全部关闭



## 不能睡眠的主板

* 最新BIOS的ASUS (ASUS PRIME B660 with BIOS 2212)
* 一些拥有内置的Aquantia 10GbE网卡的主板 (比如 GIGABYTE Z790 AORUS MASTER)









