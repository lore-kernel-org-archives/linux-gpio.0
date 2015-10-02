From: YD Tseng <ltyu101@gmail.com>
Subject: [PATCH] drivers: field for new GPIO driver
Date: Fri,  2 Oct 2015 11:05:05 +0800
Message-ID: <1443755105-7708-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:36602 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750988AbbJBDHQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2015 23:07:16 -0400
Received: by pacik9 with SMTP id ik9so10408738pac.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2015 20:07:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, dbaryshkov@gmail.com
Cc: Yd_Tseng@asmedia.com.tw, TungYu_Lu@asmedia.com.tw


Dear all,
 
>> Is this hardware really different or can the old driver be augmented to handle both?
This hardware is different.  We design a new silicon for AMD.

This patch adds a new GPIO driver for AMD Promontory chip.  This GPIO controller is enumerated by ACPI and the ACPI compliant hardware ID is AMDF030.
 
A new file is added and 2 files are modified.
drivers/gpio/gpio-amdpt.c            New file
drivers/gpio/Kconfig                       Modified file
drivers/gpio/Makefile                    Modified file


Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
---
 gpio-amdpt.patch | 329 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 329 insertions(+)
 create mode 100644 gpio-amdpt.patch

diff --git a/gpio-amdpt.patch b/gpio-amdpt.patch
new file mode 100644
index 0000000..228c06a
--- /dev/null
+++ b/gpio-amdpt.patch
@@ -0,0 +1,329 @@
diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers/gpio/gpio-amdpt.c linux-4.2/drivers/gpio/gpio-amdpt.c
--- linux-4.2.vanilla/drivers/gpio/gpio-amdpt.c	1969-12-31 19:00:00.000000000 -0500
+++ linux-4.2/drivers/gpio/gpio-amdpt.c	2015-09-30 07:21:13.596121358 -0400
@@ -0,0 +1,297 @@
+/*
+ * AMD Promontory GPIO driver
+ *
+ * Copyright (C) 2015 ASMedia Technology Inc.
+ * Author: YD Tseng <yd_tseng@asmedia.com.tw>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/pci.h>
+#include <linux/spinlock.h>
+#include <linux/acpi.h>
+#include <linux/platform_device.h>
+
+#define TOTAL_GPIO_PINS 8
+
+/* memory mapped register offsets */
+#define PT_DIRECTION_REG   0x00
+#define PT_INPUTDATA_REG   0x04
+#define PT_OUTPUTDATA_REG  0x08
+#define PT_DEBOUNCE_REG    0x0C
+#define PT_VENDER0_REG     0x28
+#define PT_VENDER1_REG     0x2C
+
+struct pt_gpio_chip {
+	struct gpio_chip         gc;
+	struct platform_device   *pdev;
+	void __iomem             *reg_base;
+	spinlock_t               lock;
+};
+
+#define to_pt_gpio(c)	container_of(c, struct pt_gpio_chip, gc)
+
+static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
+{
+	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct platform_device *pdev;
+	void __iomem *v_reg = pt_gpio->reg_base + PT_VENDER0_REG;
+	unsigned long flags;
+	u32 using_pins;
+
+	pdev = pt_gpio->pdev;
+
+	dev_dbg(&pdev->dev, "pt_gpio_request offset=%x\n", offset);
+
+	spin_lock_irqsave(&pt_gpio->lock, flags);
+
+	using_pins = readl(v_reg);
+	if (using_pins&(1<<offset))
+		dev_warn(&pdev->dev, "PT GPIO pin %x reconfigured\n", offset);
+	else
+		writel(using_pins|(1<<offset), v_reg);
+
+	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+
+	return 0;
+}
+
+static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
+{
+	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct platform_device *pdev;
+	void __iomem *v_reg = pt_gpio->reg_base + PT_VENDER0_REG;
+	unsigned long flags;
+	u32 using_pins;
+
+	pdev = pt_gpio->pdev;
+
+	spin_lock_irqsave(&pt_gpio->lock, flags);
+
+	using_pins = readl(v_reg);
+	using_pins &= ~BIT(offset);
+	writel(using_pins, v_reg);
+
+	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+
+	dev_dbg(&pdev->dev, "pt_gpio_free offset=%x\n", offset);
+}
+
+static void pt_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct platform_device *pdev;
+	void __iomem *reg = pt_gpio->reg_base + PT_OUTPUTDATA_REG;
+	unsigned long flags;
+	u32 data;
+
+	pdev = pt_gpio->pdev;
+
+	dev_dbg(&pdev->dev, "pt_gpio_set_value offset=%x, value=%x\n", offset,
+		value);
+
+	spin_lock_irqsave(&pt_gpio->lock, flags);
+
+	data = readl(reg);
+	data &= ~BIT(offset);
+	if (value)
+		data |= BIT(offset);
+	writel(data, reg);
+
+	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+}
+
+static int pt_gpio_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct platform_device *pdev;
+	unsigned long flags;
+	u32 data;
+
+	pdev = pt_gpio->pdev;
+
+	spin_lock_irqsave(&pt_gpio->lock, flags);
+
+	/* configure as output */
+	if ((readl(pt_gpio->reg_base + PT_DIRECTION_REG)>>offset)&0x1)
+		data = readl(pt_gpio->reg_base + PT_OUTPUTDATA_REG);
+	else	/* configure as input */
+		data = readl(pt_gpio->reg_base + PT_INPUTDATA_REG);
+
+	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+
+	data >>= offset;
+	data &= 1;
+
+	dev_dbg(&pdev->dev, "pt_gpio_get_value offset=%x, value=%x\n", offset,
+		data);
+
+	return data;
+}
+
+static int pt_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct platform_device *pdev;
+	unsigned long flags;
+	void __iomem *reg = pt_gpio->reg_base + PT_DIRECTION_REG;
+	u32 data;
+
+	pdev = pt_gpio->pdev;
+
+	dev_dbg(&pdev->dev, "pt_gpio_dirction_input offset=%x\n", offset);
+
+	spin_lock_irqsave(&pt_gpio->lock, flags);
+
+	data = readl(reg);
+	data &= ~BIT(offset);
+	writel(data, reg);
+
+	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+
+	return 0;
+}
+
+static int pt_gpio_direction_output(struct gpio_chip *gc,
+					unsigned offset, int value)
+{
+	struct pt_gpio_chip *pt_gpio = to_pt_gpio(gc);
+	struct platform_device *pdev;
+	unsigned long flags;
+	void __iomem *dir_reg = pt_gpio->reg_base + PT_DIRECTION_REG;
+	void __iomem *output_reg = pt_gpio->reg_base + PT_OUTPUTDATA_REG;
+	u32 data;
+
+	pdev = pt_gpio->pdev;
+
+	dev_dbg(&pdev->dev, "pt_gpio_direction_output offset=%x, value=%x\n",
+		offset, value);
+
+	spin_lock_irqsave(&pt_gpio->lock, flags);
+
+	data = readl(output_reg);
+	if (value)
+		writel(data |= BIT(offset), output_reg);
+	else
+		writel(data &= ~BIT(offset), output_reg);
+
+	data = readl(dir_reg);
+	data |= BIT(offset);
+	writel(data, dir_reg);
+
+	spin_unlock_irqrestore(&pt_gpio->lock, flags);
+
+	return 0;
+}
+
+static int pt_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct acpi_device *acpi_dev;
+	acpi_handle handle = ACPI_HANDLE(dev);
+	struct pt_gpio_chip *pt_gpio;
+	struct resource *res_mem;
+	void __iomem *reg;
+	int ret = 0;
+
+	if (acpi_bus_get_device(handle, &acpi_dev)) {
+		dev_err(dev, "PT GPIO device node not found\n");
+		return -ENODEV;
+	}
+
+	pt_gpio = devm_kzalloc(dev, sizeof(struct pt_gpio_chip), GFP_KERNEL);
+	if (!pt_gpio)
+		return -ENOMEM;
+
+	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res_mem) {
+		dev_err(&pdev->dev, "Failed to get MMIO resource for PT GPIO.\n");
+		return -EINVAL;
+	}
+	pt_gpio->reg_base = devm_ioremap_resource(dev, res_mem);
+	if (IS_ERR(pt_gpio->reg_base)) {
+		dev_err(&pdev->dev, "Failed to map MMIO resource for PT GPIO.\n");
+		return PTR_ERR(pt_gpio->reg_base);
+	}
+
+	pt_gpio->pdev = pdev;
+	spin_lock_init(&pt_gpio->lock);
+
+	pt_gpio->gc.label            = pdev->name;
+	pt_gpio->gc.owner            = THIS_MODULE;
+	pt_gpio->gc.dev              = dev;
+	pt_gpio->gc.request          = pt_gpio_request;
+	pt_gpio->gc.free             = pt_gpio_free;
+	pt_gpio->gc.direction_input  = pt_gpio_direction_input;
+	pt_gpio->gc.direction_output = pt_gpio_direction_output;
+	pt_gpio->gc.get              = pt_gpio_get_value;
+	pt_gpio->gc.set              = pt_gpio_set_value;
+	pt_gpio->gc.base             = -1;
+	pt_gpio->gc.ngpio            = TOTAL_GPIO_PINS;
+#if defined(CONFIG_OF_GPIO)
+	pt_gpio->gc.of_node          = pdev->dev.of_node;
+#endif
+	ret = gpiochip_add(&pt_gpio->gc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register GPIO lib\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pt_gpio);
+
+	/* initialize register setting */
+	reg = pt_gpio->reg_base + PT_VENDER0_REG;
+	writel(0, reg);
+	reg = pt_gpio->reg_base + PT_DEBOUNCE_REG;
+	writel(0, reg);
+
+	dev_dbg(&pdev->dev, "PT GPIO driver loaded\n");
+	return ret;
+}
+
+static int pt_gpio_remove(struct platform_device *pdev)
+{
+	struct pt_gpio_chip *pt_gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&pt_gpio->gc);
+
+	return 0;
+}
+
+static const struct acpi_device_id pt_gpio_acpi_match[] = {
+	{ "AMDF030", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);
+
+static struct platform_driver pt_gpio_driver = {
+	.driver = {
+		.name = "pt-gpio",
+		.acpi_match_table = ACPI_PTR(pt_gpio_acpi_match),
+	},
+	.probe = pt_gpio_probe,
+	.remove = pt_gpio_remove,
+};
+
+static int __init pt_gpio_init(void)
+{
+	return platform_driver_register(&pt_gpio_driver);
+}
+
+static void __exit pt_gpio_exit(void)
+{
+	platform_driver_unregister(&pt_gpio_driver);
+}
+
+module_init(pt_gpio_init);
+module_exit(pt_gpio_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("YD Tseng <yd_tseng@asmedia.com.tw>");
+MODULE_DESCRIPTION("AMD Promontory GPIO Driver");
+MODULE_ALIAS("platform:pt-gpio");
diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers/gpio/Kconfig linux-4.2/drivers/gpio/Kconfig
--- linux-4.2.vanilla/drivers/gpio/Kconfig	2015-08-30 14:34:09.000000000 -0400
+++ linux-4.2/drivers/gpio/Kconfig	2015-09-03 13:00:50.341364000 -0400
@@ -120,6 +120,13 @@ config GPIO_ALTERA
 
 	  If driver is built as a module it will be called gpio-altera.
 
+config GPIO_AMDPT
+	tristate "AMD Promontory GPIO support"
+	depends on PCI && ACPI
+	help
+	  driver for GPIO functionality on Promontory IOHub
+	  Require ACPI ASL code to enumerate as a platform device.
+
 config GPIO_BCM_KONA
 	bool "Broadcom Kona GPIO"
 	depends on OF_GPIO && (ARCH_BCM_MOBILE || COMPILE_TEST)
diff -uprN -X linux-4.2.vanilla/Documentation/dontdiff linux-4.2.vanilla/drivers/gpio/Makefile linux-4.2/drivers/gpio/Makefile
--- linux-4.2.vanilla/drivers/gpio/Makefile	2015-08-30 14:34:09.000000000 -0400
+++ linux-4.2/drivers/gpio/Makefile	2015-09-03 11:39:17.833086000 -0400
@@ -19,6 +19,7 @@ obj-$(CONFIG_GPIO_ADP5520)	+= gpio-adp55
 obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
 obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
+obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
-- 
2.1.4

