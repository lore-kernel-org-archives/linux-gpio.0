From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 3/8] gpio: gpio-rz: GPIO driver for Renesas RZ series
Date: Mon, 16 Jan 2017 13:12:47 +0100
Message-ID: <1484568772-18137-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Magnus Damm <damm@opensource.se>

This commit combines Magnus' original driver and minor fixes to
forward-port it to a more recent kernel version (v4.10).

Compared to the original driver the set of registers used to set/get
direction is changed to extend compatibility with other RZ-Series
processors.

Signed-off-by: Magnus Damm <damm@opensource.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpio/Kconfig   |   6 ++
 drivers/gpio/Makefile  |   1 +
 drivers/gpio/gpio-rz.c | 211 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
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
+	depends on ARCH_RENESAS
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
index 0000000..ad67975
--- /dev/null
+++ b/drivers/gpio/gpio-rz.c
@@ -0,0 +1,211 @@
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
+#include <linux/gpio/driver.h>
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
+#define PORT0_NUM_REGS	1
+
+enum { REG_P, REG_PPR, REG_PM, REG_NR };
+
+struct rz_gpio_priv {
+	void __iomem *io[REG_NR];
+	struct gpio_chip gpio_chip;
+	int nreg;
+};
+
+static inline struct rz_gpio_priv *gpio_to_priv(struct gpio_chip *chip)
+{
+	return gpiochip_get_data(chip);
+}
+
+static inline u16 rz_gpio_read(struct  gpio_chip *chip, int reg)
+{
+	return ioread16(gpio_to_priv(chip)->io[reg]);
+}
+
+static inline void rz_gpio_write(struct gpio_chip *chip, int reg, u16 val)
+{
+	iowrite16(val, gpio_to_priv(chip)->io[reg]);
+}
+
+static int rz_gpio_get(struct gpio_chip *chip, unsigned gpio)
+{
+	u16 tmp = rz_gpio_read(chip, REG_PPR);
+
+	return tmp & BIT(gpio);
+}
+
+static void rz_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+{
+	u16 tmp;
+
+	if (gpio_to_priv(chip)->nreg == PORT0_NUM_REGS)
+		return;
+
+	tmp = rz_gpio_read(chip, REG_P);
+
+	if (value)
+		rz_gpio_write(chip, REG_P, tmp | BIT(gpio));
+	else
+		rz_gpio_write(chip, REG_P, tmp & ~BIT(gpio));
+}
+
+static int rz_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
+{
+	/* Set bit in PM register (input buffer enabled by PFC for the pin) */
+	rz_gpio_write(chip, REG_PM, rz_gpio_read(chip, REG_PM) | BIT(gpio));
+
+	return 0;
+}
+
+static int rz_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
+				   int value)
+{
+
+	if (gpio_to_priv(chip)->nreg == PORT0_NUM_REGS)
+		return -EINVAL;
+
+	/* Write GPIO value before selecting output mode of pin */
+	rz_gpio_set(chip, gpio, value);
+
+	/* Clear bit in PM register to enable output */
+	rz_gpio_write(chip, REG_PM, rz_gpio_read(chip, REG_PM) & BIT(gpio));
+
+	return 0;
+}
+
+static int rz_gpio_get_direction(struct gpio_chip *chip, unsigned gpio)
+{
+	if (gpio_to_priv(chip)->nreg == PORT0_NUM_REGS)
+		return 1;
+
+	return rz_gpio_read(chip, REG_PM) & BIT(gpio);
+}
+
+static int rz_gpio_request(struct gpio_chip *chip, unsigned gpio)
+{
+	return gpiochip_generic_request(chip, gpio);
+}
+
+static void rz_gpio_free(struct gpio_chip *chip, unsigned gpio)
+{
+	gpiochip_generic_free(chip, gpio);
+
+	/* Set the GPIO as an input to ensure that the next GPIO request won't
+	 * drive the GPIO pin as an output.
+	 */
+	rz_gpio_direction_input(chip, gpio);
+}
+
+static int rz_gpio_probe(struct platform_device *pdev)
+{
+	struct rz_gpio_priv *p;
+	struct resource *io[REG_NR - 1];
+	struct gpio_chip *gpio_chip;
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args args;
+	int ret, k;
+
+	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p) {
+		dev_err(&pdev->dev, "failed to allocate driver data\n");
+		return -ENOMEM;
+	}
+
+	/* As registers for each port instance are scattered in the same
+	 * address space, we have to map them singularly */
+	for (k = 0; k < REG_NR; k++) {
+		io[k] = platform_get_resource(pdev, IORESOURCE_MEM, k);
+
+		/* Port0 and JP0 are inuput only: has REG_PPR only */
+		if (!io[k])
+			break;
+
+		p->io[k] = devm_ioremap_resource(&pdev->dev, io[k]);
+		if (IS_ERR(p->io[k]))
+			return PTR_ERR(p->io[k]);
+
+		p->nreg++;
+	}
+
+	/* move REG_PPR in correct position for Port0 and JP0 */
+	if (p->nreg == PORT0_NUM_REGS) {
+		p->io[REG_PPR] = p->io[REG_P];
+		p->io[REG_P] = p->io[REG_PM] = NULL;
+	}
+
+	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
+
+	gpio_chip = &p->gpio_chip;
+	gpio_chip->get = rz_gpio_get;
+	gpio_chip->set = rz_gpio_set;
+	gpio_chip->direction_input = rz_gpio_direction_input;
+	gpio_chip->direction_output = rz_gpio_direction_output;
+	gpio_chip->get_direction = rz_gpio_get_direction;
+	gpio_chip->request = rz_gpio_request;
+	gpio_chip->free = rz_gpio_free;
+	gpio_chip->label = dev_name(&pdev->dev);
+	gpio_chip->parent = &pdev->dev;
+	gpio_chip->owner = THIS_MODULE;
+	gpio_chip->base = -1;
+	gpio_chip->ngpio = ret == 0 ? args.args[2] : RZ_GPIOS_PER_PORT;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gpio_chip, p);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add GPIO controller\n");
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "driving %d GPIOs\n", gpio_chip->ngpio);
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
