## AMD Radeon RX 6x50 XT

Find out dGPU's ACPI path (Device Manager - Display Adapter - Right - Click Graphics Card - Properties - Details)

![image](https://user-images.githubusercontent.com/74492520/212872382-6930a9a8-b462-4f83-8e07-4e309edd3ac9.png)<br>

This RX 6650 XT's ACPI path is `_SB_.PCI0.PEG0.PEGP`

![6x50](https://user-images.githubusercontent.com/74492520/212874976-f3f4945a-b35b-47d2-b708-75eaa251f9b6.jpg)

Change the above three parts to `PCI0.PEG0.PEGP`

Save as `ACPI Machine Language Binary` and move it into ACPI folder. Enable it in OC

**NOTE:**

ONLY support AMD Radeon RX 6650/6950 XT