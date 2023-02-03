## 修复睡眠

* 在开始前，请确认您已经正确的定制了USB

### BIOS 设置

* 700 系列主板: 在睡眠后，如果您的电脑不会睡眠并死机，请在BIOS中启用 **ErP**。

### ACPI

* 如果唤醒后蓝牙不正常，您需要在OpenCore中添加 **SSDT-RHUB**。

### DeviceProperties

* 修复需要按两下唤醒。补丁如下：

```
<dict>
	<key>DeviceProperties</key>
	<dict>
		<key>Add</key>
		<dict>
			<key>USB Device Path</key>
			<dict>
				<key>acpi-wake-type</key>
				<integer>1</integer>
			</dict>
		</dict>
	</dict>
</dict>

```

**注**: 某些主板拥有两个USB控制器，并且外置的控制器唤醒优先级低，所以需要按两下. (ASUS TUF)

### 不能睡眠的主板

* 最新BIOS的ASUS (ASUS PRIME B660 with BIOS 2212)
* 一些拥有内置的Aquantia 10GbE网卡的主板 (比如 GIGABYTE Z790 AORUS MASTER)









