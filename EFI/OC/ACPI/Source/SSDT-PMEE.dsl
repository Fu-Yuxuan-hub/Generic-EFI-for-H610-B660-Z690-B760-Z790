DefinitionBlock ("", "SSDT", 2, "YUXUAN", "PMEE", 0x00000000)
{
    External (_SB_.PC00.XHCI.PMEE, FieldUnitObj)
    External (XPTS,MethodObj)

    Scope (\)
    {
        Name (TMPV, Zero)
        Method (_PTS, 1, Notserialized)
        {
            If ((Arg0 >= 0x03))
            {
                \TMPV = \_SB.PC00.XHCI.PMEE
                \_SB.PC00.XHCI.PMEE = Zero
            }
            
            If ((Arg0 == 0x03))
            {
                \_SB.PC00.XHCI.PMEE = TMPV
            }
            
            \XPTS (Arg0)       
        }    
    }
}
