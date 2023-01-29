## AMD Radeon RX 6x50 XT

找到显卡的ACPI路径（设备管理器-显示适配器-显卡右键-属性-详细信息）<br>

![image](https://user-images.githubusercontent.com/74492520/212872382-6930a9a8-b462-4f83-8e07-4e309edd3ac9.png)<br>

这张 RX 6650 XT 的ACPI路径就是`_SB_.PCI0.PEG0.PEGP`<br>

![6x50](https://user-images.githubusercontent.com/74492520/212874976-f3f4945a-b35b-47d2-b708-75eaa251f9b6.jpg)

将以上三个部分改为 `PCI0.PEG0.PEGP`<br>

保存为 `ACPI Machine Language Binary` 并且移至ACPI目录下，在OC中加载
