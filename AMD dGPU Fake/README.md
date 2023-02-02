## dGPU Fake

Fake AMD Radeon Pro Series and inject AAPL,slot-name, ATY,EFIVersion and AAPL,slot-name.

> Actually, it doesn't do much. It doesn't work as well as PP_PhmSoftPowerPlayTable

### How to make PP_PhmSoftPowerPlayTable ?

#### Requirement

* Windows
* [GPU-Z](https://www.techpowerup.com/download/techpowerup-gpu-z/)
* [MorePowerTool](https://www.igorslab.de/installer/MorePowerTool_Setup.exe) 

#### Operate

* Save your GPU ROM file with GPU-Z
* Load ROM file with MorePowerTool
* It is not recommended to modify any data, except the PWM Minimum (the minimum fan speed percentage) in the Fan tab
* Click Write SPPT to write to the registry
* Open the registry editor, open the registry path prompted in GPU-Z Advanced, and export the registry
* Use a text editor to open the exported registry file, find the data of PP_PhmSoftPowerPlayTable, copy it to a new text file, and replace special characters such as spaces, commas, slashes, and carriage returns
