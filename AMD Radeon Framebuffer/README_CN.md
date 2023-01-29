## AMD Radeon Framebuffer

**补丁如下**

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

将`xxxx`替换为以下内容

| dGPU        | 内容         |
| ----------- | ------------ |
| 5500 Series | ATY,Python   |
| 5700 Series | ATY,Adder    |
| 6600 Series | ATY,Henbury  |
| 6800 Series | ATY,Belknap  |
| 6900 Series | ATY,Carswell |

* **北极星核心不需要此项**