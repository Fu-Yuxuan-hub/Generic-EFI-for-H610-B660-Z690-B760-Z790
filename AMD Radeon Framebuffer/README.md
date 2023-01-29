## AMD Radeon Framebuffer

**The patch is as follows**

```
<key>DeviceProperties</key>
    <dict>
        <key>Add</key>
        <dict>
            <key>dGPU PciRoot path</key>
            <dict>
                <key>@0,name</key>
                <string>xxxx</string>
                <key>@1,name</key>
                <string>xxxx</string>
                <key>@2,name</key>
                <string>xxxx</string>
                <key>@3,name</key>
                <string>xxxx</string>
            </dict>
        </dict>
        <key>Delete</key>
        <dict/>
    </dict>
```

Replace `xxxx` with the following

| dGPU        | Content              |
| ----------- | -------------------- |
| 5500 Series | ATY,Python / ATY,Boa |
| 5700 Series | ATY,Adder            |
| 6600 Series | ATY,Henbury          |
| 6800 Series | ATY,Belknap          |
| 6900 Series | ATY,Carswell         |

**NOTE:**

This is not needed for Polaris cards