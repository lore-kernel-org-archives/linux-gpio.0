From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 1/2] gpio: Add a driver for Cadence GPIO controller
Date: Wed, 29 Mar 2017 18:04:18 +0200
Message-ID: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42501 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752264AbdC2QEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2017 12:04:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Simon Hatliff <hatliff@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

Add a driver for Cadence GPIO controller.
Even though this driver is pretty simple, I was not able to use the
generic GPIO infrastructure because it needs custom ->request()/->free()
implementation and ->direction_output() requires modifying 2 different
registers while the generic implementation only modifies the dirin (or
dirout) register. Other than that, the implementation is rather
straightforward.

Note that irq support has not been tested.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/gpio/Kconfig        |   7 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-cadence.c | 334 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 342 insertions(+)
 create mode 100644 drivers/gpio/gpio-cadence.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d5d36549ecc1..3f5cf6670fd6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -143,6 +143,13 @@ config GPIO_BRCMSTB
 	help
 	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
 
+config GPIO_CADENCE
+	tristate "Cadence GPIO support"
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to enable support for Cadence GPIO controller.
+
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
 	depends on ARCH_CLPS711X || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a7676b82de6f..9c1ae8a30d3f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_GPIO_AXP209)	+= gpio-axp209.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
+obj-$(CONFIG_GPIO_CADENCE)	+= gpio-cadence.o
 obj-$(CONFIG_GPIO_CLPS711X)	+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_CS5535)	+= gpio-cs5535.o
 obj-$(CONFIG_GPIO_CRYSTAL_COVE)	+= gpio-crystalcove.o
diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
new file mode 100644
index 000000000000..fbf323ad2eec
--- /dev/null
+++ b/drivers/gpio/gpio-cadence.c
@@ -0,0 +1,334 @@
+/*
+ * Copyright 2017 Cadence
+ *
+ * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define CDNS_GPIO_BYPASS_MODE		0x0
+#define CDNS_GPIO_DIRECTION_MODE	0x4
+#define CDNS_GPIO_OUTPUT_EN		0x8
+#define CDNS_GPIO_OUTPUT_VALUE		0xc
+#define CDNS_GPIO_INPUT_VALUE		0x10
+#define CDNS_GPIO_IRQ_MASK		0x14
+#define CDNS_GPIO_IRQ_EN		0x18
+#define CDNS_GPIO_IRQ_DIS		0x1c
+#define CDNS_GPIO_IRQ_STATUS		0x20
+#define CDNS_GPIO_IRQ_TYPE		0x24
+#define CDNS_GPIO_IRQ_VALUE		0x28
+#define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
+
+struct cdns_gpio_chip {
+	struct gpio_chip base;
+	struct irq_chip irqchip;
+	struct clk *pclk;
+	void __iomem *regs;
+};
+
+static inline struct cdns_gpio_chip *to_cdns_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct cdns_gpio_chip, base);
+}
+
+static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+
+	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
+		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
+
+	return 0;
+}
+
+static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+
+	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) | BIT(offset),
+		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
+}
+
+static int cdns_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+	u32 val = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+
+	return !!(val & BIT(offset));
+}
+
+static int cdns_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+
+	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE) |
+		  BIT(offset),
+		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+
+	return 0;
+}
+
+static int cdns_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+	u32 val;
+
+	if (ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE) & BIT(offset))
+		val = ioread32(cgpio->regs + CDNS_GPIO_INPUT_VALUE);
+	else
+		val = ioread32(cgpio->regs + CDNS_GPIO_OUTPUT_VALUE);
+
+	return !!(val & BIT(offset));
+}
+
+static void cdns_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+	u32 val = ioread32(cgpio->regs + CDNS_GPIO_OUTPUT_VALUE);
+
+	val &= ~(*mask);
+	val |= (*bits) & (*mask);
+
+	iowrite32(val, cgpio->regs + CDNS_GPIO_OUTPUT_VALUE);
+}
+
+static void cdns_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+	u32 val = ioread32(cgpio->regs + CDNS_GPIO_OUTPUT_VALUE);
+
+	if (value)
+		val |= BIT(offset);
+	else
+		val &= ~BIT(offset);
+
+	iowrite32(val, cgpio->regs + CDNS_GPIO_OUTPUT_VALUE);
+}
+
+static int cdns_gpio_direction_out(struct gpio_chip *chip, unsigned int offset,
+				   int value)
+{
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+
+	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE) &
+		  ~BIT(offset),
+		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+	cdns_gpio_set(chip, offset, value);
+	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_OUTPUT_EN) | BIT(offset),
+		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+
+	return 0;
+}
+
+static void cdns_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+
+	iowrite32(d->hwirq, cgpio->regs + CDNS_GPIO_IRQ_DIS);
+}
+
+static void cdns_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+
+	iowrite32(BIT(d->hwirq), cgpio->regs + CDNS_GPIO_IRQ_EN);
+}
+
+static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
+	u32 int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE);
+	u32 int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE);
+	u32 mask = BIT(d->hwirq);
+
+	int_type &= ~mask;
+	int_value &= ~mask;
+
+	if (type == IRQ_TYPE_LEVEL_HIGH) {
+		int_type |= mask;
+		int_value |= mask;
+	} else if (type == IRQ_TYPE_LEVEL_LOW) {
+		int_type |= mask;
+	} else if (type & IRQ_TYPE_EDGE_BOTH) {
+		u32 any_edge;
+
+		int_type &= ~mask;
+
+		any_edge = ioread32(cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE);
+		any_edge &= ~mask;
+
+		if (type == IRQ_TYPE_EDGE_BOTH)
+			any_edge |= mask;
+		else if (IRQ_TYPE_EDGE_RISING)
+			int_value |= mask;
+
+		iowrite32(any_edge, cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE);
+	} else {
+		return -EINVAL;
+	}
+
+	iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
+	iowrite32(int_value, cgpio->regs + CDNS_GPIO_IRQ_VALUE);
+
+	return 0;
+}
+
+static irqreturn_t cdns_gpio_irq_handler(int irq, void *dev)
+{
+	struct cdns_gpio_chip *cgpio = dev;
+	unsigned long status;
+	int hwirq;
+
+	/*
+	 * FIXME: If we have an edge irq that is masked we might lose it
+	 * since reading the STATUS register clears all IRQ flags.
+	 * We could store the status of all masked IRQ in the cdns_gpio_chip
+	 * struct but we then have no way to re-trigger the interrupt when
+	 * it is unmasked.
+	 */
+	status = ioread32(cgpio->regs + CDNS_GPIO_IRQ_STATUS) &
+		 ioread32(cgpio->regs + CDNS_GPIO_IRQ_MASK);
+
+	for_each_set_bit(hwirq, &status, 32) {
+		int irq = irq_find_mapping(cgpio->base.irqdomain, hwirq);
+
+		handle_nested_irq(irq);
+	}
+
+	return status ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static int cdns_gpio_probe(struct platform_device *pdev)
+{
+	struct cdns_gpio_chip *cgpio;
+	struct resource *res;
+	int ret, irq;
+
+	cgpio = devm_kzalloc(&pdev->dev, sizeof(*cgpio), GFP_KERNEL);
+	if (!cgpio)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	cgpio->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(cgpio->regs))
+		return PTR_ERR(cgpio->regs);
+
+	cgpio->base.label = dev_name(&pdev->dev);
+	cgpio->base.ngpio = 32;
+	cgpio->base.parent = &pdev->dev;
+	cgpio->base.base = -1;
+	cgpio->base.owner = THIS_MODULE;
+	cgpio->base.request = cdns_gpio_request;
+	cgpio->base.free = cdns_gpio_free;
+	cgpio->base.get_direction = cdns_gpio_get_direction;
+	cgpio->base.direction_input = cdns_gpio_direction_in;
+	cgpio->base.get = cdns_gpio_get;
+	cgpio->base.direction_output = cdns_gpio_direction_out;
+	cgpio->base.set = cdns_gpio_set;
+	cgpio->base.set_multiple = cdns_gpio_set_multiple;
+
+	cgpio->pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(cgpio->pclk)) {
+		ret = PTR_ERR(cgpio->pclk);
+		dev_err(&pdev->dev,
+			"Failed to retrieve peripheral clock, %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(cgpio->pclk);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to enable the peripheral clock, %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->base, cgpio);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
+		goto err_disable_clk;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq >= 0) {
+		cgpio->irqchip.name = dev_name(&pdev->dev);
+		cgpio->irqchip.irq_mask = cdns_gpio_irq_mask;
+		cgpio->irqchip.irq_unmask = cdns_gpio_irq_unmask;
+		cgpio->irqchip.irq_set_type = cdns_gpio_irq_set_type;
+
+		ret = gpiochip_irqchip_add_nested(&cgpio->base,
+						  &cgpio->irqchip, 0,
+						  handle_simple_irq,
+						  IRQ_TYPE_NONE);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Could not connect irqchip to gpiochip, %d\n",
+				ret);
+			goto err_disable_clk;
+		}
+
+		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+						cdns_gpio_irq_handler,
+						IRQF_ONESHOT,
+						dev_name(&pdev->dev), cgpio);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"Failed to register irq handler, %d\n", ret);
+			goto err_disable_clk;
+		}
+	}
+
+	platform_set_drvdata(pdev, cgpio);
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(cgpio->pclk);
+
+	return 0;
+}
+
+static int cdns_gpio_remove(struct platform_device *pdev)
+{
+	struct cdns_gpio_chip *cgpio = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(cgpio->pclk);
+
+	return 0;
+}
+
+static const struct of_device_id cdns_of_ids[] = {
+	{ .compatible = "cdns,gpio-r1p02" },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver cdns_gpio_driver = {
+	.driver = {
+		.name = "cdns-gpio",
+		.of_match_table = cdns_of_ids,
+	},
+	.probe = cdns_gpio_probe,
+	.remove = cdns_gpio_remove,
+};
+module_platform_driver(cdns_gpio_driver);
+
+MODULE_AUTHOR("Boris Brezillon <boris.brezillon@free-electrons.com>");
+MODULE_DESCRIPTION("Cadence GPIO driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cdns-gpio");
-- 
2.7.4

