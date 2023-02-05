### AMD RX 6600 on Ventura with MacPro or iMacPro SMBIOS

When using MacPro or iMacPro SMBIOS a lot of users have reported black screen. The simplest way to fix this is to add in DeviceProperties of config.plist properties that set Henbury framebuffer for each of the 4 ports of this GPU.

By default, Radeon framebuffer (`ATY,Radeon`) is loaded. But, in AMDRadeonX6000Framebuffer.kext >> Contents >> Info.plist we can see that AMDRadeonNavi23Controller has `ATY,Henbury` and 6600 series are Navi 23. This is why this framebuffer is selected.

The patch is added in this way:

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

**Notes:**

- PCI path to the GPU may be the same on your system but it is convenient to check it with Hackintool (app) or gfxutil (Terminal utility).
- This is not needed for Monterey.
- This is not needed for Polaris cards (RX 580).
- Henbury patch drops down significantly GeekBench 5 Metal scores.

If needed for other Navi cards, the framebuffers to be loaded are different for each family:

<table>
<tr><td>5500</td><td>ATY,Python</td></tr>
<tr><td>5700</td><td>ATY,Adder</td></tr>
<tr><td>6600</td><td>ATY,Henbury</td></tr>
<tr><td>6800</td><td>ATY,Belknap</td></tr>
<tr><td>6900</td><td>ATY,Carswell</td></tr>
</table>


**1. Alternative method to avoid black screen with MacPro or iMacPro SMBIOS**

Using SSDT-BRG0.aml fixes black screen on Ventura with SMBIOS models lacking iGPU. This SSDT allows to define a missing `pci-bridge` device. With it, the Henbury patch is no longer necessary.

As noted above, the Henbury patch drops down the GeekBench 5 scores, however with SSDT-BRG0 expected scores are got, in line with those got by many users with this graphics card.

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

Be sure of the PCI path to your dGPU, mine is `/PCI0@0/PEG0@1/PEGP@0/GFX0@0` so the SSDT has these lines: 

```
External (_SB_.PCI0.PEG0.PEGP, DeviceObj)

Scope (\_SB.PCI0.PEG0.PEGP)
```

Modify the SSDT (if needed) to be set within your system. How to chek the PCI path?

- gfxutil utility in Terminal, look for the line containing GFX0 at the end
- Hackintool >> PCIe tab >> pointer over Navi 23 line >> copy IOReg patch.

**2. Alternative method to avoid black screen with MacPro or iMacPro SMBIOS**

There are some more advanced SSDT configurations such as SSDT-VEGA.aml which, in addition to creating devices, does so by mimicking the way real Macs are configured (EGP0 and EGP1 devices instead of BRG0).

SSDT-VEGA has the same benefits as SSDT-BRG0: Henbury patch not needed and good GeekBench 5 scores.

It also requires checking the PCI path to your graphics card. In the example code I keep the same path as in the previous SSDT-BRG0.

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
