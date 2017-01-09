From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 2/3] gpio: gpio-rz: GPIO driver for Renesas RZ series
Date: Mon,  9 Jan 2017 20:31:57 +0100
Message-ID: <1483990318-26927-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33376 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763459AbdAITcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2017 14:32:12 -0500
In-Reply-To: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

From: Magnus Damm <damm@opensource.se>

This commit combines Magnus' original driver and minor fixes to
forward-port it to a more recent kernel version (v4.10)

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---------------------------------------------------------------
gpio: Renesas RZ GPIO driver V3

This patch adds a GPIO driver for the RZ series of SoCs from
Renesas. The V3 of the driver requires DT to be used.

The hardware allows control of GPIOs in blocks of up to 16 pins.
Interrupts are not included in this hardware block, if interrupts
are needed then the PFC needs to be configured to a IRQ pin function
which is handled by the GIC hardware.

Tested with yet-to-be-posted DT devices on r7s72100 and Genmai using
LEDs, DIP switches and I2C bitbang.

Signed-off-by: Magnus Damm <damm@opensource.se>

gpio: gpio-rz: Port to v4.10-rc1

Fix invalid return value in gpio remove function and change gpiochip's
"dev" field name to "parent" to compile driver against v4.10

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpio/Kconfig   |   6 ++
 drivers/gpio/Makefile  |   1 +
 drivers/gpio/gpio-rz.c | 212 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 drivers/gpio/gpio-rz.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d5d3654..e9ad7b4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -369,6 +369,12 @@ config GPIO_RCAR
 	help
 	  Say yes here to support GPIO on Renesas R-Car SoCs.
 
+config GPIO_RZ
+	tristate "Renesas RZ GPIO"
+	depends on ARM
+	help
+	  Say yes here to support GPIO on Renesas RZ SoCs.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index a7676b8..f0b2713 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RDC321X)	+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_RCAR)		+= gpio-rcar.o
+obj-$(CONFIG_GPIO_RZ)		+= gpio-rz.o
 obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
 obj-$(CONFIG_GPIO_SCH311X)	+= gpio-sch311x.o
diff --git a/drivers/gpio/gpio-rz.c b/drivers/gpio/gpio-rz.c
new file mode 100644
index 0000000..b48fa05
--- /dev/null
+++ b/drivers/gpio/gpio-rz.c
@@ -0,0 +1,212 @@
+/*
+ * RZ GPIO Support - Ports
+ *
+ *  Copyright (C) 2013 Magnus Damm
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; version 2 of the
+ * License.
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define RZ_GPIOS_PER_PORT 16
+
+enum { REG_PSR, REG_PPR, REG_PMSR, REG_NR };
+
+struct rz_gpio_priv {
+	void __iomem *io[REG_NR];
+	struct gpio_chip gpio_chip;
+};
+
+static inline u32 rz_gpio_read_ppr(struct rz_gpio_priv *p, int offs)
+{
+	unsigned long msk = BIT(offs % RZ_GPIOS_PER_PORT);
+	unsigned int offset = (offs / RZ_GPIOS_PER_PORT) * 4;
+
+	return ioread32(p->io[REG_PPR] + offset) & msk;
+}
+
+static inline void rz_gpio_write(struct rz_gpio_priv *p, int reg, int offs,
+				 bool value)
+{
+	unsigned long msk = BIT(offs % RZ_GPIOS_PER_PORT);
+	unsigned int offset = (offs / RZ_GPIOS_PER_PORT) * 4;
+
+	/* upper 16 bits contain mask and lower 16 actual value */
+	iowrite32(value ? (msk | (msk << 16)) : (msk << 16),
+		  p->io[reg] + offset);
+}
+
+static inline struct rz_gpio_priv *gpio_to_priv(struct gpio_chip *chip)
+{
+	return container_of(chip, struct rz_gpio_priv, gpio_chip);
+}
+
+static int rz_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	/* Set bit in PM register via PMSR to disable output */
+	rz_gpio_write(gpio_to_priv(chip), REG_PMSR, offset, true);
+	return 0;
+}
+
+static int rz_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	/* Get bit from PPR register to determine pin state */
+	return rz_gpio_read_ppr(gpio_to_priv(chip), offset);
+}
+
+static void rz_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	/* Set bit in P register via PSR to control output */
+	rz_gpio_write(gpio_to_priv(chip), REG_PSR, offset, !!value);
+}
+
+static int rz_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+				   int value)
+{
+	/* Write GPIO value to output before selecting output mode of pin */
+	rz_gpio_set(chip, offset, value);
+
+	/* Clear bit in PM register via PMSR to enable output */
+	rz_gpio_write(gpio_to_priv(chip), REG_PMSR, offset, false);
+	return 0;
+}
+
+static int rz_gpio_request(struct gpio_chip *chip, unsigned offset)
+{
+	return pinctrl_request_gpio(chip->base + offset);
+}
+
+static void rz_gpio_free(struct gpio_chip *chip, unsigned offset)
+{
+	pinctrl_free_gpio(chip->base + offset);
+
+	/* Set the GPIO as an input to ensure that the next GPIO request won't
+	* drive the GPIO pin as an output.
+	*/
+	rz_gpio_direction_input(chip, offset);
+}
+
+static int rz_gpio_probe(struct platform_device *pdev)
+{
+	struct rz_gpio_priv *p;
+	struct resource *io[3];
+	struct gpio_chip *gpio_chip;
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args args;
+	unsigned int k, nr;
+	int ret;
+
+	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p) {
+		dev_err(&pdev->dev, "failed to allocate driver data\n");
+		return -ENOMEM;
+	}
+
+	for (k = 0; k < REG_NR; k++)
+		io[k] = platform_get_resource(pdev, IORESOURCE_MEM, k);
+
+	/* In case of 3 resources PSR, PPR and PMSR order is expected */
+	if (io[REG_PSR] && io[REG_PPR] && io[REG_PMSR]) {
+		nr = REG_NR;
+	} else {
+		/* A single resource is also acceptable (PPR only) */
+		if (io[0] && !io[1] && !io[2]) {
+			nr = 1;
+		} else {
+			dev_err(&pdev->dev, "missing IOMEM\n");
+			return -EINVAL;
+		}
+	}
+
+	for (k = 0; k < nr; k++) {
+		p->io[k] = devm_ioremap_resource(&pdev->dev, io[k]);
+		if (IS_ERR(p->io[k]))
+			return PTR_ERR(p->io[k]);
+	}
+
+	/* If only 1 resource is available it must be PPR */
+	if (nr == 1) {
+		io[REG_PPR] = io[0];
+		p->io[REG_PPR] = p->io[0];
+		io[0] = NULL;
+		p->io[0] = NULL;
+	}
+
+	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
+
+	gpio_chip = &p->gpio_chip;
+	gpio_chip->direction_input = rz_gpio_direction_input;
+	gpio_chip->get = rz_gpio_get;
+	gpio_chip->direction_output = rz_gpio_direction_output;
+	gpio_chip->set = rz_gpio_set;
+	gpio_chip->request = rz_gpio_request;
+	gpio_chip->free = rz_gpio_free;
+	gpio_chip->label = dev_name(&pdev->dev);
+	gpio_chip->parent = &pdev->dev;
+	gpio_chip->owner = THIS_MODULE;
+	gpio_chip->base = -1;
+	gpio_chip->ngpio = ret == 0 ? args.args[2] : RZ_GPIOS_PER_PORT;
+
+	ret = gpiochip_add(gpio_chip);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add GPIO controller\n");
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "driving %d GPIOs\n", gpio_chip->ngpio);
+	return 0;
+}
+
+static int rz_gpio_remove(struct platform_device *pdev)
+{
+	struct rz_gpio_priv *p = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&p->gpio_chip);
+	return 0;
+}
+
+static const struct of_device_id rz_gpio_dt_ids[] = {
+	{ .compatible = "renesas,gpio-rz", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rz_gpio_dt_ids);
+
+static struct platform_driver rz_gpio_device_driver = {
+	.probe		= rz_gpio_probe,
+	.remove		= rz_gpio_remove,
+	.driver		= {
+		.name	= "gpio_rz",
+		.of_match_table = rz_gpio_dt_ids,
+		.owner		= THIS_MODULE,
+	}
+};
+
+static int __init rz_gpio_init(void)
+{
+	return platform_driver_register(&rz_gpio_device_driver);
+}
+postcore_initcall(rz_gpio_init);
+
+static void __exit rz_gpio_exit(void)
+{
+	platform_driver_unregister(&rz_gpio_device_driver);
+}
+module_exit(rz_gpio_exit);
+
+MODULE_AUTHOR("Magnus Damm");
+MODULE_DESCRIPTION("Renesas RZ Port GPIO Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

