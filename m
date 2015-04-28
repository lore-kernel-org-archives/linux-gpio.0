From: <kamlakant.patel@broadcom.com>
Subject: [PATCH 2/2] gpio: xlp: GPIO controller for Netlogic XLP SoCs
Date: Tue, 28 Apr 2015 20:10:45 +0530
Message-ID: <1430232045-5114-3-git-send-email-kamlakant.patel@broadcom.com>
References: <1430232045-5114-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:62044 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965882AbbD1Ols (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2015 10:41:48 -0400
In-Reply-To: <1430232045-5114-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

Add GPIO controller driver for Netlogic XLP MIPS64 SOCs.

This driver is instantiated by device tree and supports interrupts
for GPIOs.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
---
 drivers/gpio/Kconfig    |   11 ++
 drivers/gpio/Makefile   |    1 +
 drivers/gpio/gpio-xlp.c |  425 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 437 insertions(+), 0 deletions(-)
 create mode 100644 drivers/gpio/gpio-xlp.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index caefe80..483c4dc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -488,6 +488,17 @@ config GPIO_XILINX
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
+config GPIO_XLP
+	tristate "Netlogic XLP GPIO support"
+	depends on CPU_XLP
+	select GPIOLIB_IRQCHIP
+	help
+	  This driver provides support for GPIO interface on Netlogic XLP MIPS64
+	  SoCs. Currently supported XLP variants are XLP8XX, XLP3XX, XLP2XX,
+	  XLP9XX and XLP5XX.
+
+	  If unsure, say N.
+
 config GPIO_XTENSA
 	bool "Xtensa GPIO32 support"
 	depends on XTENSA
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f71bb97..8a846a3 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -109,6 +109,7 @@ obj-$(CONFIG_GPIO_WM8994)	+= gpio-wm8994.o
 obj-$(CONFIG_GPIO_XGENE)	+= gpio-xgene.o
 obj-$(CONFIG_GPIO_XGENE_SB)	+= gpio-xgene-sb.o
 obj-$(CONFIG_GPIO_XILINX)	+= gpio-xilinx.o
+obj-$(CONFIG_GPIO_XLP)		+= gpio-xlp.o
 obj-$(CONFIG_GPIO_XTENSA)	+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)	+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)		+= gpio-zynq.o
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
new file mode 100644
index 0000000..8532697
--- /dev/null
+++ b/drivers/gpio/gpio-xlp.c
@@ -0,0 +1,425 @@
+/*
+ * Copyright (C) 2003-2015 Broadcom Corporation
+ * All Rights Reserved
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/gpio.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+
+/*
+ * XLP GPIO has multiple 32 bit registers for each feature where each register
+ * controls 32 pins. So, pins up to 64 require 2 32-bit registers and up to 96
+ * require 3 32-bit registers for each feature.
+ * Here we only define offset of the first register for each feature. Offset of
+ * the registers for pins greater than 32 can be calculated as following(Use
+ * GPIO_INT_STAT as example):
+ *
+ * offset = (gpio / XLP_GPIO_REGSZ) * 4;
+ * reg_addr = addr + offset;
+ *
+ * where addr is base address of the that feature register and gpio is the pin.
+ */
+#define GPIO_OUTPUT_EN		0x00
+#define GPIO_PADDRV		0x08
+#define GPIO_INT_EN00		0x18
+#define GPIO_INT_EN10		0x20
+#define GPIO_INT_EN20		0x28
+#define GPIO_INT_EN30		0x30
+#define GPIO_INT_POL		0x38
+#define GPIO_INT_TYPE		0x40
+#define GPIO_INT_STAT		0x48
+
+#define GPIO_9XX_BYTESWAP	0X00
+#define GPIO_9XX_CTRL		0X04
+#define GPIO_9XX_OUTPUT_EN	0x14
+#define GPIO_9XX_PADDRV		0x24
+/*
+ * Only for 4 interrupt enable reg are defined for now,
+ * total reg available are 12.
+ */
+#define GPIO_9XX_INT_EN00	0x44
+#define GPIO_9XX_INT_EN10	0x54
+#define GPIO_9XX_INT_EN20	0x64
+#define GPIO_9XX_INT_EN30	0x74
+#define GPIO_9XX_INT_POL	0x104
+#define GPIO_9XX_INT_TYPE	0x114
+#define GPIO_9XX_INT_STAT	0x124
+
+#define GPIO_3XX_INT_EN00	0x18
+#define GPIO_3XX_INT_EN10	0x20
+#define GPIO_3XX_INT_EN20	0x28
+#define GPIO_3XX_INT_EN30	0x30
+#define GPIO_3XX_INT_POL	0x78
+#define GPIO_3XX_INT_TYPE	0x80
+#define GPIO_3XX_INT_STAT	0x88
+
+/* Interrupt type register mask */
+#define XLP_GPIO_IRQ_TYPE_LVL	0x0
+#define XLP_GPIO_IRQ_TYPE_EDGE	0x1
+
+/* Interrupt polarity register mask */
+#define XLP_GPIO_IRQ_POL_HIGH	0x0
+#define XLP_GPIO_IRQ_POL_LOW	0x1
+
+#define XLP_GPIO_REGSZ		32
+#define XLP_GPIO_IRQ_BASE	768
+#define XLP_MAX_NR_GPIO		96
+
+/* XLP variants supported by this driver */
+enum {
+	XLP_GPIO_VARIANT_XLP832 = 1,
+	XLP_GPIO_VARIANT_XLP316,
+	XLP_GPIO_VARIANT_XLP208,
+	XLP_GPIO_VARIANT_XLP980,
+	XLP_GPIO_VARIANT_XLP532
+};
+
+struct xlp_gpio_priv {
+	struct gpio_chip chip;
+	DECLARE_BITMAP(gpio_enabled_mask, XLP_MAX_NR_GPIO);
+	void __iomem *gpio_intr_en;	/* pointer to first intr enable reg */
+	void __iomem *gpio_intr_stat;	/* pointer to first intr status reg */
+	void __iomem *gpio_intr_type;	/* pointer to first intr type reg */
+	void __iomem *gpio_intr_pol;	/* pointer to first intr polarity reg */
+	void __iomem *gpio_out_en;	/* pointer to first output enable reg */
+	void __iomem *gpio_paddrv;	/* pointer to first pad drive reg */
+	spinlock_t lock;
+};
+
+static struct xlp_gpio_priv *gpio_chip_to_xlp_priv(struct gpio_chip *gc)
+{
+	return container_of(gc, struct xlp_gpio_priv, chip);
+}
+
+static int xlp_gpio_get_reg(void __iomem *addr, unsigned gpio)
+{
+	u32 pos, regset;
+
+	pos = gpio % XLP_GPIO_REGSZ;
+	regset = (gpio / XLP_GPIO_REGSZ) * 4;
+	return !!(readl(addr + regset) & BIT(pos));
+}
+
+static void xlp_gpio_set_reg(void __iomem *addr, unsigned gpio, int state)
+{
+	u32 value, pos, regset;
+
+	pos = gpio % XLP_GPIO_REGSZ;
+	regset = (gpio / XLP_GPIO_REGSZ) * 4;
+	value = readl(addr + regset);
+
+	if (state)
+		value |= BIT(pos);
+	else
+		value &= ~BIT(pos);
+
+	writel(value, addr + regset);
+}
+
+static void xlp_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	xlp_gpio_set_reg(priv->gpio_intr_en, d->hwirq, 0x0);
+	__clear_bit(d->hwirq, priv->gpio_enabled_mask);
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void xlp_gpio_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	xlp_gpio_set_reg(priv->gpio_intr_en, d->hwirq, 0x0);
+	xlp_gpio_set_reg(priv->gpio_intr_stat, d->hwirq, 0x1);
+	__clear_bit(d->hwirq, priv->gpio_enabled_mask);
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void xlp_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	xlp_gpio_set_reg(priv->gpio_intr_en, d->hwirq, 0x1);
+	__set_bit(d->hwirq, priv->gpio_enabled_mask);
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static int xlp_gpio_set_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+	int pol, irq_type;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		irq_type = XLP_GPIO_IRQ_TYPE_EDGE;
+		pol = XLP_GPIO_IRQ_POL_HIGH;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_type = XLP_GPIO_IRQ_TYPE_EDGE;
+		pol = XLP_GPIO_IRQ_POL_LOW;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_type = XLP_GPIO_IRQ_TYPE_LVL;
+		pol = XLP_GPIO_IRQ_POL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_type = XLP_GPIO_IRQ_TYPE_LVL;
+		pol = XLP_GPIO_IRQ_POL_LOW;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	xlp_gpio_set_reg(priv->gpio_intr_type, d->hwirq, irq_type);
+	xlp_gpio_set_reg(priv->gpio_intr_pol, d->hwirq, pol);
+
+	return 0;
+}
+
+static struct irq_chip xlp_gpio_irq_chip = {
+	.name		= "XLP-GPIO",
+	.irq_mask_ack	= xlp_gpio_irq_mask_ack,
+	.irq_disable	= xlp_gpio_irq_disable,
+	.irq_set_type	= xlp_gpio_set_irq_type,
+	.irq_unmask	= xlp_gpio_irq_unmask,
+	.flags		= IRQCHIP_ONESHOT_SAFE,
+};
+
+static irqreturn_t xlp_gpio_generic_handler(int irq, void *data)
+{
+	struct xlp_gpio_priv *priv = data;
+	int gpio, regoff;
+	u32 gpio_stat;
+
+	regoff = -1;
+	gpio_stat = 0;
+	for_each_set_bit(gpio, priv->gpio_enabled_mask, XLP_MAX_NR_GPIO) {
+		if (regoff != gpio / XLP_GPIO_REGSZ) {
+			regoff = gpio / XLP_GPIO_REGSZ;
+			gpio_stat = readl(priv->gpio_intr_stat + regoff * 4);
+		}
+		if (gpio_stat & BIT(gpio % XLP_GPIO_REGSZ))
+			generic_handle_irq(irq_find_mapping(
+						priv->chip.irqdomain, gpio));
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
+{
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+
+	BUG_ON(gpio >= gc->ngpio);
+	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x1);
+
+	return 0;
+}
+
+static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned gpio)
+{
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+
+	BUG_ON(gpio >= gc->ngpio);
+	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x0);
+
+	return 0;
+}
+
+static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
+{
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+
+	BUG_ON(gpio >= gc->ngpio);
+	return xlp_gpio_get_reg(priv->gpio_paddrv, gpio);
+}
+
+static void xlp_gpio_set(struct gpio_chip *gc, unsigned gpio, int state)
+{
+	struct xlp_gpio_priv *priv = gpio_chip_to_xlp_priv(gc);
+
+	BUG_ON(gpio >= gc->ngpio);
+	xlp_gpio_set_reg(priv->gpio_paddrv, gpio, state);
+}
+
+static const struct of_device_id xlp_gpio_of_ids[] = {
+	{
+		.compatible = "netlogic,xlp832-gpio",
+		.data	    = (void *)XLP_GPIO_VARIANT_XLP832,
+	},
+	{
+		.compatible = "netlogic,xlp316-gpio",
+		.data	    = (void *)XLP_GPIO_VARIANT_XLP316,
+	},
+	{
+		.compatible = "netlogic,xlp208-gpio",
+		.data	    = (void *)XLP_GPIO_VARIANT_XLP208,
+	},
+	{
+		.compatible = "netlogic,xlp980-gpio",
+		.data	    = (void *)XLP_GPIO_VARIANT_XLP980,
+	},
+	{
+		.compatible = "netlogic,xlp532-gpio",
+		.data	    = (void *)XLP_GPIO_VARIANT_XLP532,
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, xlp_gpio_of_ids);
+
+static int xlp_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_chip *gc;
+	struct resource *iores;
+	struct xlp_gpio_priv *priv;
+	const struct of_device_id *of_id;
+	void __iomem *gpio_base;
+	int irq_base, irq, err;
+	int ngpio;
+	u32 soc_type;
+
+	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!iores)
+		return -ENODEV;
+
+	priv = devm_kzalloc(&pdev->dev,	sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	gpio_base = devm_ioremap_resource(&pdev->dev, iores);
+	if (IS_ERR(gpio_base))
+		return PTR_ERR(gpio_base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	of_id = of_match_device(xlp_gpio_of_ids, &pdev->dev);
+	if (!of_id) {
+		dev_err(&pdev->dev, "Failed to get soc type!\n");
+		return -ENODEV;
+	}
+
+	soc_type = (uintptr_t) of_id->data;
+
+	switch (soc_type) {
+	case XLP_GPIO_VARIANT_XLP832:
+		priv->gpio_out_en = gpio_base + GPIO_OUTPUT_EN;
+		priv->gpio_paddrv = gpio_base + GPIO_PADDRV;
+		priv->gpio_intr_stat = gpio_base + GPIO_INT_STAT;
+		priv->gpio_intr_type = gpio_base + GPIO_INT_TYPE;
+		priv->gpio_intr_pol = gpio_base + GPIO_INT_POL;
+		priv->gpio_intr_en = gpio_base + GPIO_INT_EN00;
+		ngpio = 41;
+		break;
+	case XLP_GPIO_VARIANT_XLP208:
+	case XLP_GPIO_VARIANT_XLP316:
+		priv->gpio_out_en = gpio_base + GPIO_OUTPUT_EN;
+		priv->gpio_paddrv = gpio_base + GPIO_PADDRV;
+		priv->gpio_intr_stat = gpio_base + GPIO_3XX_INT_STAT;
+		priv->gpio_intr_type = gpio_base + GPIO_3XX_INT_TYPE;
+		priv->gpio_intr_pol = gpio_base + GPIO_3XX_INT_POL;
+		priv->gpio_intr_en = gpio_base + GPIO_3XX_INT_EN00;
+
+		ngpio = (soc_type == XLP_GPIO_VARIANT_XLP208) ? 42 : 57;
+		break;
+	case XLP_GPIO_VARIANT_XLP980:
+	case XLP_GPIO_VARIANT_XLP532:
+		priv->gpio_out_en = gpio_base + GPIO_9XX_OUTPUT_EN;
+		priv->gpio_paddrv = gpio_base + GPIO_9XX_PADDRV;
+		priv->gpio_intr_stat = gpio_base + GPIO_9XX_INT_STAT;
+		priv->gpio_intr_type = gpio_base + GPIO_9XX_INT_TYPE;
+		priv->gpio_intr_pol = gpio_base + GPIO_9XX_INT_POL;
+		priv->gpio_intr_en = gpio_base + GPIO_9XX_INT_EN00;
+
+		ngpio = (soc_type == XLP_GPIO_VARIANT_XLP980) ? 66 : 67;
+		break;
+	default:
+		dev_err(&pdev->dev, "Unknown Processor type!\n");
+		return -ENODEV;
+	}
+
+	bitmap_zero(priv->gpio_enabled_mask, XLP_MAX_NR_GPIO);
+
+	gc = &priv->chip;
+
+	gc->base = 0;
+	gc->dev = &pdev->dev;
+	gc->ngpio = ngpio;
+	gc->of_node = pdev->dev.of_node;
+	gc->direction_output = xlp_gpio_dir_output;
+	gc->direction_input = xlp_gpio_dir_input;
+	gc->set = xlp_gpio_set;
+	gc->get = xlp_gpio_get;
+
+	spin_lock_init(&priv->lock);
+
+	err = devm_request_irq(&pdev->dev, irq, xlp_gpio_generic_handler,
+			IRQ_TYPE_NONE, pdev->name, priv);
+	if (err)
+		return err;
+
+	irq_base = irq_alloc_descs(-1, XLP_GPIO_IRQ_BASE, gc->ngpio, 0);
+	if (irq_base < 0) {
+		dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
+		return err;
+	}
+
+	err = gpiochip_add(gc);
+	if (err < 0)
+		goto out_free_desc;
+
+	err = gpiochip_irqchip_add(gc, &xlp_gpio_irq_chip, irq_base,
+				handle_level_irq, IRQ_TYPE_NONE);
+	if (err) {
+		dev_err(&pdev->dev, "Could not connect irqchip to gpiochip!\n");
+		goto out_gpio_remove;
+	}
+
+	dev_info(&pdev->dev, "registered %d GPIOs\n", gc->ngpio);
+
+	return 0;
+
+out_gpio_remove:
+	gpiochip_remove(gc);
+out_free_desc:
+	irq_free_descs(irq_base, gc->ngpio);
+	return err;
+}
+
+static struct platform_driver xlp_gpio_driver = {
+	.driver		= {
+		.name	= "xlp-gpio",
+		.of_match_table = xlp_gpio_of_ids,
+	},
+	.probe		= xlp_gpio_probe,
+};
+module_platform_driver(xlp_gpio_driver);
+
+MODULE_AUTHOR("Kamlakant Patel <kamlakant.patel@broadcom.com>");
+MODULE_AUTHOR("Ganesan Ramalingam <ganesanr@broadcom.com>");
+MODULE_DESCRIPTION("Netlogic XLP GPIO Driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.1

