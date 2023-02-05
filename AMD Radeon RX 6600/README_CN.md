###  MacPro 或 iMacPro SMBIOS 的 Ventura 上的 AMD RX 6600

在使用 MacPro 或 iMacPro SMBIOS 时，很多用户都报告黑屏。解决此问题的最简单方法是添加 config.plist 属性的 DeviceProperties，为该 GPU 的 4 个端口中的每一个设置 Henbury 帧缓冲区。

默认情况下，`ATY,Radeon`加载 Radeon 帧缓冲区 ( )。但是，在AMDRadeonX6000Framebuffer.kext >> Contents >> Info.plist中我们可以看到AMDRadeonNavi23Controller有`ATY,Henbury`，而6600系列是Navi 23。这就是选择这个framebuffer的原因。

补丁是这样添加的：

``` xml
<key>DeviceProperties</key>
    <dict>
        <key>Add</key>
        <dict>
            <key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)</key>
            <dict>
                <key>@0,name</key>
                <string>ATY,Henbury</string>
                <key>@1,name</key>
                <string>ATY,Henbury</string>
                <key>@2,name</key>
                <string>ATY,Henbury</string>
                <key>@3,name</key>
                <string>ATY,Henbury</string>
            </dict>
        </dict>
        <key>Delete</key>
        <dict/>
    </dict>
```

**注：**

- GPU 的 PCI 路径在您的系统上可能相同，但使用 Hackintool（应用程序）或 gfxutil（终端实用程序）检查它很方便。
- Monterey 不需要这样做。
- Polaris 卡 (RX 580) 不需要这样做。
- Henbury 补丁明显降低了 GeekBench 5 Metal 分数。

如果其他 Navi 卡需要，每个系列要加载的帧缓冲区都不同：

<table>
<tr><td>5500</td><td>ATY,Python</td></tr>
<tr><td>5700</td><td>ATY,Adder</td></tr>
<tr><td>6600</td><td>ATY,Henbury</td></tr>
<tr><td>6800</td><td>ATY,Belknap</td></tr>
<tr><td>6900</td><td>ATY,Carswell</td></tr>
</table>



**1. 使用 MacPro 或 iMacPro SMBIOS 避免黑屏的替代方法**

使用 SSDT-BRG0.aml 修复了 Ventura 上的黑屏，SMBIOS 模型缺少 iGPU。此 SSDT 允许定义丢失的`pci-bridge`设备。有了它，Henbury 补丁就不再需要了。

如上所述，Henbury 补丁降低了 GeekBench 5 分数，但是使用 SSDT-BRG0 获得了预期分数，与许多使用此显卡的用户获得的分数一致。

SSDT-BRG0:

```c++
/*
 * This table provides an example of creating a missing ACPI device
 * to ensure early DeviceProperty application. In this example
 * a GPU device is created for a platform having an extra PCI
 * bridge in the path - PCI0.PEG0.PEGP.BRG0.GFX0:
 * PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
 * Such tables are particularly relevant for macOS 11.0 and newer.
 */

DefinitionBlock ("", "SSDT", 2, "ACDT", "BRG0", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        /*
         * This is a PCI bridge device present on PEGP.
         * Normally seen as pci-bridge in I/O Registry.
         */
        Device (BRG0)
        {
            Name (_ADR, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            /*
             * This is an actual GPU device present on the bridge.
             * Normally seen as display in I/O Registry.
             */
            Device (GFX0)
            {
                Name (_ADR, Zero)  // _ADR: Address
            }
        }
    }
}
```

确保你的 dGPU 的 PCI 路径，我的是`/PCI0@0/PEG0@1/PEGP@0/GFX0@0`所以 SSDT 有这些行：

```
External (_SB_.PCI0.PEG0.PEGP, DeviceObj)

Scope (\_SB.PCI0.PEG0.PEGP)
```

- 修改要在系统中设置的 SSDT（如果需要）。如何查看PCI路径？
  - 终端中的 gfxutil 实用程序，在末尾查找包含 GFX0 的行
  - Hackintool >> PCIe 选项卡 >> Navi 23 行上的指针 >> 复制 IOReg 补丁。

**2. 使用 MacPro 或 iMacPro SMBIOS 避免黑屏的替代方法**

有一些更高级的 SSDT 配置，例如 SSDT-VEGA.aml，除了创建设备外，它还通过模仿真实 Mac 的配置方式（EGP0 和 EGP1 设备而不是 BRG0）来实现。

SSDT-VEGA 具有与 SSDT-BRG0 相同的优势：不需要 Henbury 补丁和良好的 GeekBench 5 分数。

它还需要检查图形卡的 PCI 路径。在示例代码中，我保留了与之前 SSDT-BRG0 相同的路径。

```c++
DefinitionBlock ("", "SSDT", 2, "HACK", "VEGA", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Scope (PEG0)
            {
                Scope (PEGP)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (EGP0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Device (EGP1)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (GFX0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                        }

                        Device (HDAU)
                        {
                            Name (_ADR, One)  // _ADR: Address
                        }
                    }
                }
            }
        }
    }
}  
```
