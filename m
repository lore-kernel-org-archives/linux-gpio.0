From: YD Tseng <ltyu101@gmail.com>
Subject: [PATCH v2] drivers: field for new GPIO driver
Date: Wed,  7 Oct 2015 19:56:48 +0800
Message-ID: <1444219008-2680-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:36377 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054AbbJGL5A (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2015 07:57:00 -0400
Received: by pacik9 with SMTP id ik9so2246796pac.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2015 04:56:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, dbaryshkov@gmail.com
Cc: Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw

Dear all,

Sorry to bother you and really appreciate for the review.

>>A very simple memory-mapped I/O GPIO, you should use select GPIO_GENERIC #include<linux/basic_mmio_gpio.h>And see for example drivers/gpio/gpio-74xx-mmio.c on how to use this generic MMIO library right.
This GPIO controller is located behind PCI-E device, We refer to drivers/gpio/gpio-amd8111.c.

>>So the dirver should support the .set_debounce() method.
rename PT_DEBOUNCE_REG to PT_CLOCKRATE_REG.

>>Is it not VENDOR, and what is in these registers really?
>>From the code it seems it is pin control registers, and this driver should then be in drivers/pinctrl/*.
>>See for example drivers/pinctrl/intel/* for how to do that right.
rename PT_VENDOR0_REG to PT_SYNC_REG, remove PT_VENDOR1_REG

>>Too many local variable. Just used a->b->c directly.
>>Well this will be using the MMIO library anyway so most stuff go away.
Modify in the new patch.

>>What is this? Pin multiplexing? Then implement this properly using pin control.
It's only used to sync the gpio pins.(avoid reusing the same pin)
We modified some code in pt_gpio_request(), this routine will return EINVAL if a pin is used.

---

This patch adds a new GPIO driver for AMD Promontory chip.  This GPIO controller is enumerated by ACPI and the ACPI compliant hardware ID is AMDF030.

A new file is added and 2 files are modified.
drivers/gpio/gpio-amdpt.c            New file
drivers/gpio/Kconfig                       Modified file
drivers/gpio/Makefile                    Modified file

Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
---
 gpio-amdpt.patch | 56 ++++++++++++++++++++++++--------------------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/gpio-amdpt.patch b/gpio-amdpt.patch
index 228c06a..46b3ee8 100644
--- a/gpio-amdpt.patch
+++ b/gpio-amdpt.patch
@@ -1,7 +1,7 @@
 diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers/gpio/gpio-amdpt.c linux-4.2/drivers/gpio/gpio-amdpt.c
 --- linux-4.2.vanilla/drivers/gpio/gpio-amdpt.c	1969-12-31 19:00:00.000000000 -0500
-+++ linux-4.2/drivers/gpio/gpio-amdpt.c	2015-09-30 07:21:13.596121358 -0400
-@@ -0,0 +1,297 @@
++++ linux-4.2/drivers/gpio/gpio-amdpt.c	2015-05-21 07:49:24.736020310 -0400
+@@ -0,0 +1,289 @@
 +/*
 + * AMD Promontory GPIO driver
 + *
@@ -16,20 +16,18 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +#include <linux/kernel.h>
 +#include <linux/module.h>
 +#include <linux/gpio.h>
-+#include <linux/pci.h>
 +#include <linux/spinlock.h>
 +#include <linux/acpi.h>
 +#include <linux/platform_device.h>
 +
 +#define TOTAL_GPIO_PINS 8
 +
-+/* memory mapped register offsets */
++/* PCI-E MMIO register offsets */
 +#define PT_DIRECTION_REG   0x00
 +#define PT_INPUTDATA_REG   0x04
 +#define PT_OUTPUTDATA_REG  0x08
-+#define PT_DEBOUNCE_REG    0x0C
-+#define PT_VENDER0_REG     0x28
-+#define PT_VENDER1_REG     0x2C
++#define PT_CLOCKRATE_REG   0x0C
++#define PT_SYNC_REG        0x28
 +
 +struct pt_gpio_chip {
 +	struct gpio_chip         gc;
@@ -44,7 +42,6 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +{
 +	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
 +	struct platform_device *pdev;
-+	void __iomem *v_reg = pt_gpio->reg_base + PT_VENDER0_REG;
 +	unsigned long flags;
 +	u32 using_pins;
 +
@@ -54,11 +51,14 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +
 +	spin_lock_irqsave(&pt_gpio->lock, flags);
 +
-+	using_pins = readl(v_reg);
-+	if (using_pins&(1<<offset))
++	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
++	if (using_pins&(1<<offset)) {
 +		dev_warn(&pdev->dev, "PT GPIO pin %x reconfigured\n", offset);
++		spin_unlock_irqrestore(&pt_gpio->lock, flags);
++		return -EINVAL; 
++	}
 +	else
-+		writel(using_pins|(1<<offset), v_reg);
++		writel(using_pins|(1<<offset), pt_gpio->reg_base + PT_SYNC_REG);
 +
 +	spin_unlock_irqrestore(&pt_gpio->lock, flags);
 +
@@ -69,7 +69,6 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +{
 +	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
 +	struct platform_device *pdev;
-+	void __iomem *v_reg = pt_gpio->reg_base + PT_VENDER0_REG;
 +	unsigned long flags;
 +	u32 using_pins;
 +
@@ -77,9 +76,9 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +
 +	spin_lock_irqsave(&pt_gpio->lock, flags);
 +
-+	using_pins = readl(v_reg);
++	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 +	using_pins &= ~BIT(offset);
-+	writel(using_pins, v_reg);
++	writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
 +
 +	spin_unlock_irqrestore(&pt_gpio->lock, flags);
 +
@@ -90,7 +89,6 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +{
 +	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
 +	struct platform_device *pdev;
-+	void __iomem *reg = pt_gpio->reg_base + PT_OUTPUTDATA_REG;
 +	unsigned long flags;
 +	u32 data;
 +
@@ -101,11 +99,11 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +
 +	spin_lock_irqsave(&pt_gpio->lock, flags);
 +
-+	data = readl(reg);
++	data = readl(pt_gpio->reg_base + PT_OUTPUTDATA_REG);
 +	data &= ~BIT(offset);
 +	if (value)
 +		data |= BIT(offset);
-+	writel(data, reg);
++	writel(data, pt_gpio->reg_base + PT_OUTPUTDATA_REG);
 +
 +	spin_unlock_irqrestore(&pt_gpio->lock, flags);
 +}
@@ -143,7 +141,6 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
 +	struct platform_device *pdev;
 +	unsigned long flags;
-+	void __iomem *reg = pt_gpio->reg_base + PT_DIRECTION_REG;
 +	u32 data;
 +
 +	pdev = pt_gpio->pdev;
@@ -152,9 +149,9 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +
 +	spin_lock_irqsave(&pt_gpio->lock, flags);
 +
-+	data = readl(reg);
++	data = readl(pt_gpio->reg_base + PT_DIRECTION_REG);
 +	data &= ~BIT(offset);
-+	writel(data, reg);
++	writel(data, pt_gpio->reg_base + PT_DIRECTION_REG);
 +
 +	spin_unlock_irqrestore(&pt_gpio->lock, flags);
 +
@@ -167,8 +164,6 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
 +	struct platform_device *pdev;
 +	unsigned long flags;
-+	void __iomem *dir_reg = pt_gpio->reg_base + PT_DIRECTION_REG;
-+	void __iomem *output_reg = pt_gpio->reg_base + PT_OUTPUTDATA_REG;
 +	u32 data;
 +
 +	pdev = pt_gpio->pdev;
@@ -178,15 +173,15 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +
 +	spin_lock_irqsave(&pt_gpio->lock, flags);
 +
-+	data = readl(output_reg);
++	data = readl( pt_gpio->reg_base + PT_OUTPUTDATA_REG);
 +	if (value)
-+		writel(data |= BIT(offset), output_reg);
++		writel(data |= BIT(offset),  pt_gpio->reg_base + PT_OUTPUTDATA_REG);
 +	else
-+		writel(data &= ~BIT(offset), output_reg);
++		writel(data &= ~BIT(offset),  pt_gpio->reg_base + PT_OUTPUTDATA_REG);
 +
-+	data = readl(dir_reg);
++	data = readl(pt_gpio->reg_base + PT_DIRECTION_REG);
 +	data |= BIT(offset);
-+	writel(data, dir_reg);
++	writel(data, pt_gpio->reg_base + PT_DIRECTION_REG);
 +
 +	spin_unlock_irqrestore(&pt_gpio->lock, flags);
 +
@@ -200,7 +195,6 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +	acpi_handle handle = ACPI_HANDLE(dev);
 +	struct pt_gpio_chip *pt_gpio;
 +	struct resource *res_mem;
-+	void __iomem *reg;
 +	int ret = 0;
 +
 +	if (acpi_bus_get_device(handle, &acpi_dev)) {
@@ -249,10 +243,8 @@ diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers
 +	platform_set_drvdata(pdev, pt_gpio);
 +
 +	/* initialize register setting */
-+	reg = pt_gpio->reg_base + PT_VENDER0_REG;
-+	writel(0, reg);
-+	reg = pt_gpio->reg_base + PT_DEBOUNCE_REG;
-+	writel(0, reg);
++	writel(0, pt_gpio->reg_base + PT_SYNC_REG);
++	writel(0, pt_gpio->reg_base + PT_CLOCKRATE_REG);
 +
 +	dev_dbg(&pdev->dev, "PT GPIO driver loaded\n");
 +	return ret;
-- 
2.1.4

