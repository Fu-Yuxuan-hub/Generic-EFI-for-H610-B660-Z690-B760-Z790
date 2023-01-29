DefinitionBlock ("", "SSDT", 2, "E64FR", "AQC113C", 0x00000000)
{
    External (_SB_.PCI0.GPP7.UP00.DP40.UP00.DP10.AQCL, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.PCI0.GPP7.UP00.DP40.UP00.DP10.AQCL)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x06)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0xC0, 0x94, 0x00, 0x00                           // ....
                    }, 

                    "compatible", 
                    Buffer (0x24)
                    {
                        /* 0000 */  0x70, 0x63, 0x69, 0x31, 0x64, 0x36, 0x61, 0x2C,  // pci1d6a,
                        /* 0008 */  0x39, 0x34, 0x63, 0x30, 0x00, 0x70, 0x63, 0x69,  // 94c0.pci
                        /* 0010 */  0x63, 0x6C, 0x61, 0x73, 0x73, 0x2C, 0x30, 0x32,  // class,02
                        /* 0018 */  0x30, 0x30, 0x30, 0x30, 0x00, 0x50, 0x43, 0x58,  // 0000.PCX
                        /* 0020 */  0x31, 0x00, 0x00, 0x00                           // 1...
                    }, 

                    "model", 
                    "Aquantia AQC113C"
                })
            }
        }
    }
}

