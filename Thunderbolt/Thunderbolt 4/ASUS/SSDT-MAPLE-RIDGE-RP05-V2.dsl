/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/fuyuxuan/Documents/GitHub/General-EFI-for-H610-B660-Z690-B760-Z790/Thunderbolt/Thunderbolt 4/ASUS/SSDT-MAPLE-RIDGE-RP05-V2.aml, Sat Jan 28 17:40:10 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000892 (2194)
 *     Revision         0x02
 *     Checksum         0xE5
 *     OEM ID           "CASEY"
 *     OEM Table ID     "TBTMAPLE"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "CASEY", "TBTMAPLE", 0x00000000)
{
    External (_SB_.PC00.RP05, DeviceObj)
    External (_SB_.PC00.RP05.HRUS, DeviceObj)
    External (_SB_.PC00.RP05.PXSX, DeviceObj)
    External (DTGP, MethodObj)    // 5 Arguments

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.PC00.RP05)
        {
            If (CondRefOf (\_SB.PC00.RP05.PXSX))
            {
                Scope (PXSX)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (Zero)
                    }
                }
            }

            If (CondRefOf (\_SB.PC00.RP05.HRUS))
            {
                Scope (HRUS)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (Zero)
                    }
                }
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

            Device (UPSB)
            {
                Name (_ADR, Zero)  // _ADR: Address
                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    AVND,   32, 
                    BMIE,   3, 
                    Offset (0x18), 
                    PRIB,   8, 
                    SECB,   8, 
                    SUBB,   8, 
                    Offset (0x1E), 
                        ,   13, 
                    MABT,   1
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x69, 
                        0x03
                    })
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Return (SECB) /* \_SB_.PC00.RP05.UPSB.SECB */
                }

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
                    Local0 = Package (0x06)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x07)
                            {
                                "Slot-4"
                            }, 

                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             // .
                            }, 

                            "PCI-Thunderbolt", 
                            One
                        }
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

                Device (DSB0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                    Field (A1E0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   32, 
                        BMIE,   3, 
                        Offset (0x18), 
                        PRIB,   8, 
                        SECB,   8, 
                        SUBB,   8, 
                        Offset (0x1E), 
                            ,   13, 
                        MABT,   1
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (Package (0x02)
                        {
                            0x69, 
                            0x03
                        })
                    }

                    Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                    {
                        Return (SECB) /* \_SB_.PC00.RP05.UPSB.DSB0.SECB */
                    }

                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        Local0 = Package (0x06)
                            {
                                "AAPL,slot-name", 
                                Buffer (0x07)
                                {
                                    "Slot-4"
                                }, 

                                "built-in", 
                                Buffer (One)
                                {
                                     0x00                                             // .
                                }, 

                                "PCIHotplugCapable", 
                                Zero
                            }
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }

                    Device (NHI0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                        {
                            Return (Package (0x02)
                            {
                                0x69, 
                                0x03
                            })
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            Local0 = Package (0x13)
                                {
                                    "class-code", 
                                    Buffer (0x04)
                                    {
                                         0x00, 0x80, 0x08, 0x00                           // ....
                                    }, 

                                    "device-id", 
                                    Buffer (0x04)
                                    {
                                         0xEB, 0x15, 0x00, 0x00                           // ....
                                    }, 

                                    "AAPL,slot-name", 
                                    Buffer (0x07)
                                    {
                                        "Slot-4"
                                    }, 

                                    "name", 
                                    Buffer (0x23)
                                    {
                                        "Maple Ridge Thunderbolt Controller"
                                    }, 

                                    "model", 
                                    Buffer (0x2C)
                                    {
                                        "Intel JHL8540 Maple Ridge Thunderbolt 3 NHI"
                                    }, 

                                    "ThunderboltDROM", 
                                    Buffer (0x93)
                                    {
                                        /* 0000 */  0x93, 0x00, 0xBC, 0xFD, 0x45, 0x76, 0x1F, 0x87,  // ....Ev..
                                        /* 0008 */  0x80, 0x07, 0xA5, 0x9D, 0x35, 0x01, 0x86, 0x00,  // ....5...
                                        /* 0010 */  0x31, 0x00, 0x21, 0x50, 0x01, 0x1F, 0x08, 0x81,  // 1.!P....
                                        /* 0018 */  0x80, 0x02, 0x00, 0x00, 0x00, 0x00, 0x08, 0x82,  // ........
                                        /* 0020 */  0x90, 0x01, 0x00, 0x00, 0x00, 0x00, 0x08, 0x83,  // ........
                                        /* 0028 */  0x80, 0x04, 0x00, 0x00, 0x00, 0x00, 0x08, 0x84,  // ........
                                        /* 0030 */  0x90, 0x03, 0x00, 0x00, 0x00, 0x00, 0x05, 0x85,  // ........
                                        /* 0038 */  0x00, 0x00, 0x00, 0x05, 0x86, 0x50, 0x00, 0x00,  // .....P..
                                        /* 0040 */  0x02, 0x87, 0x0B, 0x88, 0x20, 0x01, 0x00, 0x64,  // .... ..d
                                        /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x89, 0x80,  // ........
                                        /* 0050 */  0x05, 0x8A, 0x50, 0x00, 0x00, 0x05, 0x8B, 0x50,  // ..P....P
                                        /* 0058 */  0x00, 0x00, 0x07, 0x01, 0x41, 0x53, 0x55, 0x53,  // ....ASUS
                                        /* 0060 */  0x00, 0x1B, 0x02, 0x50, 0x52, 0x4F, 0x41, 0x52,  // ...PROAR
                                        /* 0068 */  0x54, 0x20, 0x5A, 0x36, 0x39, 0x30, 0x20, 0x43,  // T Z690 C
                                        /* 0070 */  0x52, 0x45, 0x41, 0x54, 0x4F, 0x52, 0x20, 0x57,  // REATOR W
                                        /* 0078 */  0x49, 0x46, 0x49, 0x00, 0x0F, 0x09, 0x10, 0x04,  // IFI.....
                                        /* 0080 */  0x43, 0x10, 0xF6, 0x87, 0x31, 0x31, 0x00, 0x00,  // C...11..
                                        /* 0088 */  0x00, 0x00, 0x01, 0x08, 0x0B, 0x03, 0x81, 0x8C,  // ........
                                        /* 0090 */  0x04, 0x82, 0x8D                                 // ...
                                    }, 

                                    "device_type", 
                                    Buffer (0x17)
                                    {
                                        "Thunderbolt-Controller"
                                    }, 

                                    "linkDetails", 
                                    Buffer (0x08)
                                    {
                                         0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // ........
                                    }, 

                                    "power-save", 
                                    One, 
                                    Buffer (One)
                                    {
                                         0x00                                             // .
                                    }
                                }
                            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                            Return (Local0)
                        }
                    }
                }

                Device (DSB1)
                {
                    Name (_ADR, 0x00010000)  // _ADR: Address
                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                    Field (A1E0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   32, 
                        BMIE,   3, 
                        Offset (0x18), 
                        PRIB,   8, 
                        SECB,   8, 
                        SUBB,   8, 
                        Offset (0x1E), 
                            ,   13, 
                        MABT,   1
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (Package (0x02)
                        {
                            0x69, 
                            0x03
                        })
                    }

                    Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                    {
                        Return (SECB) /* \_SB_.PC00.RP05.UPSB.DSB1.SECB */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }

                Device (DSB2)
                {
                    Name (_ADR, 0x00020000)  // _ADR: Address
                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                    Field (A1E0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   32, 
                        BMIE,   3, 
                        Offset (0x18), 
                        PRIB,   8, 
                        SECB,   8, 
                        SUBB,   8, 
                        Offset (0x1E), 
                            ,   13, 
                        MABT,   1
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (Package (0x02)
                        {
                            0x69, 
                            0x03
                        })
                    }

                    Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                    {
                        Return (SECB) /* \_SB_.PC00.RP05.UPSB.DSB2.SECB */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    Device (XHC3)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
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
                            Local0 = Package (0x18)
                                {
                                    "AAPL,slot-name", 
                                    Buffer (0x07)
                                    {
                                        "Slot-4"
                                    }, 

                                    "built-in", 
                                    Buffer (One)
                                    {
                                         0x00                                             // .
                                    }, 

                                    "name", 
                                    Buffer (0x1F)
                                    {
                                        "Maple Ridge USB 3.1 Controller"
                                    }, 

                                    "model", 
                                    Buffer (0x22)
                                    {
                                        "Intel JHL8540 Maple Ridge USB 3.1"
                                    }, 

                                    "device_type", 
                                    Buffer (0x1F)
                                    {
                                        "USB eXtensible Host-Controller"
                                    }, 

                                    "AAPL,current-available", 
                                    0x0834, 
                                    "AAPL,current-extra", 
                                    0x0A8C, 
                                    "AAPL,current-in-sleep", 
                                    0x0A8C, 
                                    "AAPL,max-port-current-in-sleep", 
                                    0x0834, 
                                    "AAPL,device-internal", 
                                    Zero, 
                                    "AAPL,root-hub-depth", 
                                    0x1A, 
                                    "AAPL,XHC-clock-id", 
                                    One
                                }
                            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                            Return (Local0)
                        }

                        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                        {
                            Return (Package (0x02)
                            {
                                0x69, 
                                0x03
                            })
                        }

                        Device (RHUB)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Device (SSP1)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                {
                                    0xFF, 
                                    0x09, 
                                    Zero, 
                                    Zero
                                })
                                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                {
                                    ToPLD (
                                        PLD_Revision           = 0x1,
                                        PLD_IgnoreColor        = 0x1,
                                        PLD_Red                = 0x0,
                                        PLD_Green              = 0x0,
                                        PLD_Blue               = 0x0,
                                        PLD_Width              = 0x0,
                                        PLD_Height             = 0x0,
                                        PLD_UserVisible        = 0x1,
                                        PLD_Dock               = 0x0,
                                        PLD_Lid                = 0x0,
                                        PLD_Panel              = "UNKNOWN",
                                        PLD_VerticalPosition   = "UPPER",
                                        PLD_HorizontalPosition = "LEFT",
                                        PLD_Shape              = "UNKNOWN",
                                        PLD_GroupOrientation   = 0x0,
                                        PLD_GroupToken         = 0x0,
                                        PLD_GroupPosition      = 0x0,
                                        PLD_Bay                = 0x0,
                                        PLD_Ejectable          = 0x0,
                                        PLD_EjectRequired      = 0x0,
                                        PLD_CabinetNumber      = 0x0,
                                        PLD_CardCageNumber     = 0x0,
                                        PLD_Reference          = 0x0,
                                        PLD_Rotation           = 0x0,
                                        PLD_Order              = 0x0,
                                        PLD_VerticalOffset     = 0x0,
                                        PLD_HorizontalOffset   = 0x0)

                                })
                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x04)
                                    {
                                        "UsbCPortNumber", 
                                        One, 
                                        "UsbPowerSource", 
                                        One
                                    })
                                }
                            }

                            Device (SSP2)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                {
                                    0xFF, 
                                    0x09, 
                                    Zero, 
                                    Zero
                                })
                                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                {
                                    ToPLD (
                                        PLD_Revision           = 0x1,
                                        PLD_IgnoreColor        = 0x1,
                                        PLD_Red                = 0x0,
                                        PLD_Green              = 0x0,
                                        PLD_Blue               = 0x0,
                                        PLD_Width              = 0x0,
                                        PLD_Height             = 0x0,
                                        PLD_UserVisible        = 0x1,
                                        PLD_Dock               = 0x0,
                                        PLD_Lid                = 0x0,
                                        PLD_Panel              = "UNKNOWN",
                                        PLD_VerticalPosition   = "UPPER",
                                        PLD_HorizontalPosition = "LEFT",
                                        PLD_Shape              = "UNKNOWN",
                                        PLD_GroupOrientation   = 0x0,
                                        PLD_GroupToken         = 0x0,
                                        PLD_GroupPosition      = 0x0,
                                        PLD_Bay                = 0x0,
                                        PLD_Ejectable          = 0x0,
                                        PLD_EjectRequired      = 0x0,
                                        PLD_CabinetNumber      = 0x0,
                                        PLD_CardCageNumber     = 0x0,
                                        PLD_Reference          = 0x0,
                                        PLD_Rotation           = 0x0,
                                        PLD_Order              = 0x0,
                                        PLD_VerticalOffset     = 0x0,
                                        PLD_HorizontalOffset   = 0x0)

                                })
                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x04)
                                    {
                                        "UsbCPortNumber", 
                                        0x02, 
                                        "UsbPowerSource", 
                                        0x02
                                    })
                                }
                            }
                        }
                    }
                }

                Device (DSB3)
                {
                    Name (_ADR, 0x00030000)  // _ADR: Address
                    OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                    Field (A1E0, ByteAcc, NoLock, Preserve)
                    {
                        AVND,   32, 
                        BMIE,   3, 
                        Offset (0x18), 
                        PRIB,   8, 
                        SECB,   8, 
                        SUBB,   8, 
                        Offset (0x1E), 
                            ,   13, 
                        MABT,   1
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (Package (0x02)
                        {
                            0x69, 
                            0x03
                        })
                    }

                    Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                    {
                        Return (SECB) /* \_SB_.PC00.RP05.UPSB.DSB3.SECB */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }
            }
        }
    }
}

