## dGPU Fake

仿冒 AMD Radeon Pro 系列并且注入 AAPL,slot-name, ATY,EFIVersion 和 AAPL,slot-name.

> 事实上，它并没有太多作用。它的作用不及 PP_PhmSoftPowerPlayTable

### 如何制作 PP_PhmSoftPowerPlayTable ?

#### 需求

* Windows
* [GPU-Z](https://www.techpowerup.com/download/techpowerup-gpu-z/)
* [MorePowerTool](https://www.igorslab.de/installer/MorePowerTool_Setup.exe) 

#### 操作

* 使用GPU-Z保存显卡 ROM 文件
* 使用 MorePowerTool 加载 GPU-Z 保存的 ROM 文件
* 不推荐修改任何数据，除了 Fan 标签里面的 PWM Minimum(风扇最小转速百分比)
* 点击 Write SPPT，写入注册表
* 打开注册表编辑器，打开 GPU-Z Advanced 里面提示的注册表路径，导出注册表
* 使用文本编辑器打开导出的注册表文件，找到 PP_PhmSoftPowerPlayTable 的数据，复制到新的文本文件，然后替换掉空格，逗号，斜杠，回车等特殊字符