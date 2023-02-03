## Fixing Sleep

* Before we start, please confirm that you have mapped your USB currently.

### BIOS Setting

* 700 Series motherboard: After sleep, if your hacintosh is still running and freezes, you shoule enable **ErP** in BIOS.

### ACPI

* If the bluetooth is abnormal after waking up, you need add **SSDT-RHUB** in OpenCore.

### DeviceProperties

* Fix double press to wake up. The patch as follows:

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

**NOTE**: Some motherboards have two USB controllers, and the external USB controller has a lower wake-up priority and needs to be pressed twice. (ASUS TUF)

### Cannot sleep motherboard

* New ASUS BIOS has a RTC mistake (ASUS PRIME B660 with BIOS 2212)
* Some built-in Aquantia 10GbE Ethernet (such as GIGABYTE Z790 AORUS MASTER)









