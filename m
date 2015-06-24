From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Wed, 24 Jun 2015 17:31:39 +0800
Message-ID: <1435138299-20561-1-git-send-email-jun.nie@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:36638 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752390AbbFXJcS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 05:32:18 -0400
Received: by pdcu2 with SMTP id u2so26878752pdc.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2015 02:32:17 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: haojian.zhuang@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: tony@atomide.com, shawn.guo@linaro.org, wan.zhijun@zte.com.cn, jason.liu@linaro.org, Jun Nie <jun.nie@linaro.org>

Add ZTE zx296702 GPIO controller support

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpio/Kconfig         |   6 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-zx296702.c | 324 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)
 create mode 100644 drivers/gpio/gpio-zx296702.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index caefe80..aba5226 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -970,6 +970,12 @@ config GPIO_MC33880
 	  SPI driver for Freescale MC33880 high-side/low-side switch.
 	  This provides GPIO interface supporting inputs and outputs.
 
+config GPIO_ZX296702
+	bool "ZTE ZX296702 GPIO support"
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the ZTE ZX296702 GPIO device
+
 endmenu
 
 menu "USB GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f71bb97..c26d81e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -112,3 +112,4 @@ obj-$(CONFIG_GPIO_XILINX)	+= gpio-xilinx.o
 obj-$(CONFIG_GPIO_XTENSA)	+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)	+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)		+= gpio-zynq.o
+obj-$(CONFIG_GPIO_ZX296702)	+= gpio-zx296702.o
diff --git a/drivers/gpio/gpio-zx296702.c b/drivers/gpio/gpio-zx296702.c
new file mode 100644
index 0000000..26ef6d0
--- /dev/null
+++ b/drivers/gpio/gpio-zx296702.c
@@ -0,0 +1,324 @@
+/*
+ * Copyright (C) 2015 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define ZX_GPIO_DIR	0x00
+#define ZX_GPIO_IVE	0x04
+#define ZX_GPIO_IV	0x08
+#define ZX_GPIO_IEP	0x0C
+#define ZX_GPIO_IEN	0x10
+#define ZX_GPIO_DI	0x14
+#define ZX_GPIO_DO1	0x18
+#define ZX_GPIO_DO0	0x1C
+#define ZX_GPIO_DO	0x20
+
+#define ZX_GPIO_IM	0x28
+#define ZX_GPIO_IE	0x2C
+
+#define ZX_GPIO_MIS	0x30
+#define ZX_GPIO_IC	0x34
+
+#define ZX_GPIO_NR	16
+
+struct zx_gpio {
+	spinlock_t		lock;
+
+	void __iomem		*base;
+	struct gpio_chip	gc;
+	bool			uses_pinctrl;
+};
+
+static inline struct zx_gpio *to_zx(struct gpio_chip *gc)
+{
+	return container_of(gc, struct zx_gpio, gc);
+}
+
+static int zx_gpio_request(struct gpio_chip *gc, unsigned offset)
+{
+	struct zx_gpio *chip = to_zx(gc);
+	int gpio = gc->base + offset;
+
+	if (chip->uses_pinctrl)
+		return pinctrl_request_gpio(gpio);
+	return 0;
+}
+
+static void zx_gpio_free(struct gpio_chip *gc, unsigned offset)
+{
+	struct zx_gpio *chip = to_zx(gc);
+	int gpio = gc->base + offset;
+
+	if (chip->uses_pinctrl)
+		pinctrl_free_gpio(gpio);
+}
+
+static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	struct zx_gpio *chip = to_zx(gc);
+	unsigned long flags;
+	unsigned char gpiodir;
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	spin_lock_irqsave(&chip->lock, flags);
+	gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
+	gpiodir &= ~BIT(offset);
+	writew_relaxed(gpiodir, chip->base + ZX_GPIO_DIR);
+	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
+		int value)
+{
+	struct zx_gpio *chip = to_zx(gc);
+	unsigned long flags;
+	unsigned char gpiodir;
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	spin_lock_irqsave(&chip->lock, flags);
+	gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
+	gpiodir |= BIT(offset);
+	writew_relaxed(gpiodir, chip->base + ZX_GPIO_DIR);
+
+	if (value)
+		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO1);
+	else
+		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO0);
+	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static int zx_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	struct zx_gpio *chip = to_zx(gc);
+
+	return !!(readw_relaxed(chip->base + ZX_GPIO_DI) & BIT(offset));
+}
+
+static void zx_set_value(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct zx_gpio *chip = to_zx(gc);
+
+	if (value)
+		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO1);
+	else
+		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO0);
+}
+
+static int zx_irq_type(struct irq_data *d, unsigned trigger)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct zx_gpio *chip = to_zx(gc);
+	int offset = irqd_to_hwirq(d);
+	unsigned long flags;
+	u8 gpiois, gpioi_epos, gpioi_eneg, gpioiev;
+	u8 bit = BIT(offset);
+
+	if (offset < 0 || offset >= ZX_GPIO_NR)
+		return -EINVAL;
+
+	spin_lock_irqsave(&chip->lock, flags);
+
+	gpioiev = readw_relaxed(chip->base + ZX_GPIO_IV);
+	gpiois = readw_relaxed(chip->base + ZX_GPIO_IVE);
+	gpioi_epos = readw_relaxed(chip->base + ZX_GPIO_IEP);
+	gpioi_eneg = readw_relaxed(chip->base + ZX_GPIO_IEN);
+
+	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+		gpiois |= bit;
+		if (trigger & IRQ_TYPE_LEVEL_HIGH)
+			gpioiev |= bit;
+		else
+			gpioiev &= ~bit;
+	} else
+		gpiois &= ~bit;
+
+	if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
+		gpioi_epos |= bit;
+		gpioi_eneg |= bit;
+	} else {
+		if (trigger & IRQ_TYPE_EDGE_RISING) {
+			gpioi_epos |= bit;
+			gpioi_eneg &= ~bit;
+		} else if (trigger & IRQ_TYPE_EDGE_FALLING) {
+			gpioi_eneg |= bit;
+			gpioi_epos &= ~bit;
+		}
+	}
+
+	writew_relaxed(gpiois, chip->base + ZX_GPIO_IVE);
+	writew_relaxed(gpioi_epos, chip->base + ZX_GPIO_IEP);
+	writew_relaxed(gpioi_eneg, chip->base + ZX_GPIO_IEN);
+	writew_relaxed(gpioiev, chip->base + ZX_GPIO_IV);
+	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static void zx_irq_handler(unsigned irq, struct irq_desc *desc)
+{
+	unsigned long pending;
+	int offset;
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct zx_gpio *chip = to_zx(gc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(irqchip, desc);
+
+	pending = readw_relaxed(chip->base + ZX_GPIO_MIS);
+	writew_relaxed(pending, chip->base + ZX_GPIO_IC);
+	if (pending) {
+		for_each_set_bit(offset, &pending, ZX_GPIO_NR)
+			generic_handle_irq(irq_find_mapping(gc->irqdomain,
+							    offset));
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static void zx_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct zx_gpio *chip = to_zx(gc);
+	u8 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
+	u8 gpioie;
+
+	spin_lock(&chip->lock);
+	gpioie = readw_relaxed(chip->base + ZX_GPIO_IM) | mask;
+	writew_relaxed(gpioie, chip->base + ZX_GPIO_IM);
+	gpioie = readw_relaxed(chip->base + ZX_GPIO_IE) & ~mask;
+	writew_relaxed(gpioie, chip->base + ZX_GPIO_IE);
+	spin_unlock(&chip->lock);
+}
+
+static void zx_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct zx_gpio *chip = to_zx(gc);
+	u8 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
+	u8 gpioie;
+
+	spin_lock(&chip->lock);
+	gpioie = readw_relaxed(chip->base + ZX_GPIO_IM) & ~mask;
+	writew_relaxed(gpioie, chip->base + ZX_GPIO_IM);
+	gpioie = readw_relaxed(chip->base + ZX_GPIO_IE) | mask;
+	writew_relaxed(gpioie, chip->base + ZX_GPIO_IE);
+	spin_unlock(&chip->lock);
+}
+
+static struct irq_chip zx_irqchip = {
+	.name		= "zx",
+	.irq_mask	= zx_irq_mask,
+	.irq_unmask	= zx_irq_unmask,
+	.irq_set_type	= zx_irq_type,
+};
+
+static int zx_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct zx_gpio *chip;
+	struct resource *res;
+	int irq, id, ret;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (chip == NULL)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	chip->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(chip->base))
+		return PTR_ERR(chip->base);
+
+	spin_lock_init(&chip->lock);
+	if (of_property_read_bool(dev->of_node, "gpio-ranges"))
+		chip->uses_pinctrl = true;
+
+	id = of_alias_get_id(dev->of_node, "gpio");
+	chip->gc.request = zx_gpio_request;
+	chip->gc.free = zx_gpio_free;
+	chip->gc.direction_input = zx_direction_input;
+	chip->gc.direction_output = zx_direction_output;
+	chip->gc.get = zx_get_value;
+	chip->gc.set = zx_set_value;
+	chip->gc.base = ZX_GPIO_NR * id;
+	chip->gc.ngpio = ZX_GPIO_NR;
+	chip->gc.label = dev_name(dev);
+	chip->gc.dev = dev;
+	chip->gc.owner = THIS_MODULE;
+
+	ret = gpiochip_add(&chip->gc);
+	if (ret)
+		return ret;
+
+	/*
+	 * irq_chip support
+	 */
+	writew_relaxed(0xffff, chip->base + ZX_GPIO_IM);
+	writew_relaxed(0, chip->base + ZX_GPIO_IE);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "invalid IRQ\n");
+		return -ENODEV;
+	}
+
+	ret = gpiochip_irqchip_add(&chip->gc, &zx_irqchip,
+				   0, handle_simple_irq,
+				   IRQ_TYPE_NONE);
+	if (ret) {
+		dev_info(dev, "could not add irqchip\n");
+		return ret;
+	}
+	gpiochip_set_chained_irqchip(&chip->gc, &zx_irqchip,
+				     irq, zx_irq_handler);
+
+	platform_set_drvdata(pdev, chip);
+	dev_info(dev, "ZX GPIO chip registered\n");
+
+	return 0;
+}
+
+#if defined(CONFIG_OF)
+static const struct of_device_id zx_gpio_match[] = {
+	{
+		.compatible = "zte,zx296702-gpio",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, zx_gpio_match);
+#endif
+
+static struct platform_driver zx_gpio_driver = {
+	.probe		= zx_gpio_probe,
+	.driver = {
+		.name	= "zx_gpio",
+		.of_match_table = of_match_ptr(zx_gpio_match),
+	},
+};
+
+module_platform_driver(zx_gpio_driver)
+
+MODULE_AUTHOR("Jun Nie <jun.nie@linaro.org>");
+MODULE_DESCRIPTION("ZTE ZX296702 GPIO driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1

