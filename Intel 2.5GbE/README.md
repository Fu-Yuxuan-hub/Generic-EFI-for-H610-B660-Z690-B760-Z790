## Intel 2.5GbE

### Method One

Open `MaciASL` and choose `DMAR`

![image](https://user-images.githubusercontent.com/74492520/212866173-3d797bc3-0eec-4a7c-9481-a6bd55d816c3.png)

Delete `Reserved Memory Region` part

![image](https://user-images.githubusercontent.com/74492520/212866363-1a66e174-925b-46e4-995f-c68a8e2c8c18.png)
The example deletes lines 53-69 and the bottom blank lines 68-69 also need to be deleted

`config.plist` setting:
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
Change `Kernel-Quirks-DisableIoMapper` to `False`

**This method comes from [@13469977015002](https://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1940034&highlight=i225)**

### Method Two

Enable `AppleIntelI210Ethernet.kext` and `SSDT-I225Ethernet.aml`(Use your ACPI path) and add `e1000=0` to `boot-args`

> If you have two i225-V, you need to use two different `SSDT-I225Ethernet.aml`. (Use different ACPI path)

**This method comes from [@w7758521](https://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1943039&highlight=i225)**