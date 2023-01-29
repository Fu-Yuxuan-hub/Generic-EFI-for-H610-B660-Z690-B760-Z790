## Intel I225-V

### 使用 `SSDT-DMAR.aml` （推荐）/ Use `SSDT-DMAR.aml` (recommend)

打开 `MaciASL` 然后选择 `DMAR` / Open `MaciASL` and choose `DMAR`

![image](https://user-images.githubusercontent.com/74492520/212866173-3d797bc3-0eec-4a7c-9481-a6bd55d816c3.png)

删除 `Reserved Memory Region` 字段的内容 / Delete `Reserved Memory Region` part

![image](https://user-images.githubusercontent.com/74492520/212866363-1a66e174-925b-46e4-995f-c68a8e2c8c18.png)
示例删除53-69行 最下面的68-69空白行也需要删除<br>
The example deletes lines 53-69 and the bottom blank lines 68-69 also need to be deleted

`config.plist` 设置 / `config.plist` setting
```
<dict>
	<key>ACPI</key>
	<dict>
		<key>Add</key>
		<array/>
		<key>Delete</key>
		<array>
			<dict>
				<key>All</key>
				<false/>
				<key>Comment</key>
				<string>Drop OEM DMAR Table</string>
				<key>Enabled</key>
				<true/>
				<key>OemTableId</key>
				<data>
				RURLMiAgICA=
				</data>
				<key>TableLength</key>
				<integer>0</integer>
				<key>TableSignature</key>
				<data>
				RE1BUg==
				</data>
			</dict>
		</array>
	</dict>
</dict>
```
![image](https://user-images.githubusercontent.com/74492520/212866519-babe4675-d968-4dc2-91c9-aaa0ec7dabfe.png)

`Kernel-Quirks-DisableIoMapper` 调整为 `False`<br>
Change `Kernel-Quirks-DisableIoMapper` to `False`

**此方法来自[@13469977015002](https://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1940034&highlight=i225)**<br>
**This method comes from [@13469977015002](https://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1940034&highlight=i225)**

### 使用 `SSDT-I225Ethernet.aml` + `AppleIntelI210Ethernet.kext` / Use `SSDT-I225Ethernet.aml` + `AppleIntelI210Ethernet.kext`

启用 `AppleIntelI210Ethernet.kext` 和 `SSDT-I225Ethernet.aml`(使用你的ACPI路径)<br>
Enable `AppleIntelI210Ethernet.kext` and `SSDT-I225Ethernet.aml`(Use your ACPI path)

在 `boot-args` 下添加 `e1000=0`
Add `e1000=0` to `boot-args`

**此方法来自[w7758521](https://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1943039&highlight=i225)**<br>
**This method comes from [w7758521](https://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1943039&highlight=i225)**