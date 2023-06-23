## Intel 2.5GbE

支持：

| Device       | Big Sur | Monterey (12.3) | Ventura |
| ------------ | ------- | --------------- | ------- |
| Intel i225-V | No      | Yes             | Yes     |
| Intel i226-V | No      | Yes             | Yes     |

您需要在 BIOS 中启用 ***VT-d*** 并在 OpenCore 中禁用 ***DisableIoMapper***。 这就可以了。

> 从 macOS Monterey 开始，Apple 的原生硬件需要 VT-d 来提供 DMA 重映射策略。 而从 Intel 600系列开始，在 DMAR 中没有 *Reserved Memory Region*，只有 *IOAPIC*。 所以启用 Intel 2.5GbE 只需要启用 *AppleVTD*。