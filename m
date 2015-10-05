From: Andreas Werner <andy@wernerandy.de>
Subject: [PATCH] gpio: Add driver for MEN 16Z127 GPIO controller
Date: Mon,  5 Oct 2015 20:09:13 +0200
Message-ID: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, morbidrsa@gmail.com, Andreas Werner <andy@wernerandy.de>
List-Id: linux-gpio@vger.kernel.org

The 16Z127 is a GPIO controller on a MCB FPGA and has 32
configurable GPIOs.
The GPIOs can be configured as inputs and outputs

Signed-off-by: Andreas Werner <andy@wernerandy.de>
---
 drivers/gpio/Kconfig        |   6 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-menz127.c | 186 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/gpio/gpio-menz127.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8949b3f..329ebc4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -269,6 +269,12 @@ config GPIO_MB86S7X
 	help
 	  Say yes here to support the GPIO controller in Fujitsu MB86S70 SoCs.
 
+config GPIO_MENZ127
+	tristate "MEN 16Z127 GPIO support"
+	depends on MCB
+	help
+	 Say yes here to support the MEN 16Z127 GPIO Controller.
+
 config GPIO_MM_LANTIQ
 	bool "Lantiq Memory mapped GPIOs"
 	depends on LANTIQ && SOC_XWAY
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f79a7c4..2c48751 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_GPIO_MB86S7X)	+= gpio-mb86s7x.o
 obj-$(CONFIG_GPIO_MC33880)	+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
 obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
+obj-$(CONFIG_GPIO_MENZ127)	+= gpio-menz127.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
 obj-$(CONFIG_GPIO_MOXART)	+= gpio-moxart.o
diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
new file mode 100644
index 0000000..599e61a
--- /dev/null
+++ b/drivers/gpio/gpio-menz127.c
@@ -0,0 +1,186 @@
+/*
+ * MEN 16Z127 GPIO driver
+ *
+ * Copyright (C) 2015 MEN Mikroelektronik GmbH (www.men.de)
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the Free
+ * Software Foundation; version 2 of the License.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/mcb.h>
+#include <linux/gpio.h>
+#include <linux/err.h>
+
+#define MEN_Z127_CTRL	0x00
+#define MEN_Z127_PSR	0x04
+#define MEN_Z127_IRQR	0x08
+#define MEN_Z127_GPIODR	0x0c
+#define MEN_Z127_IER1	0x10
+#define MEN_Z127_IER2	0x14
+#define MEN_Z127_DBER	0x18
+#define MEN_Z127_ODER	0x1C
+
+struct men_z127_gpio {
+	struct gpio_chip chip;
+	void __iomem *reg_base;
+	struct mcb_device *mdev;
+	struct resource *mem;
+	spinlock_t lock;
+};
+#define to_men_z127_gpio(gc) container_of(gc, struct men_z127_gpio, chip)
+
+static void men_z127_mod_reg(struct gpio_chip *chip, u32 reg, unsigned gpio,
+			     int val)
+{
+	struct men_z127_gpio *men_z127_gpio;
+	u32 reg_val;
+
+	men_z127_gpio = to_men_z127_gpio(chip);
+
+	spin_lock(&men_z127_gpio->lock);
+	reg_val = readl(men_z127_gpio->reg_base + reg);
+
+	if (val)
+		reg_val |= BIT(gpio);
+	else
+		reg_val &= ~BIT(gpio);
+
+	writel(reg_val, men_z127_gpio->reg_base + reg);
+	spin_unlock(&men_z127_gpio->lock);
+}
+
+static void men_z127_set_reg(struct gpio_chip *chip, u32 reg, unsigned gpio)
+{
+	men_z127_mod_reg(chip, reg, gpio, 1);
+}
+
+static void men_z127_clr_reg(struct gpio_chip *chip, u32 reg, unsigned gpio)
+{
+	men_z127_mod_reg(chip, reg, gpio, 0);
+}
+
+static int men_z127_dir_output(struct gpio_chip *chip, unsigned gpio,
+			       int value)
+{
+	men_z127_set_reg(chip, MEN_Z127_GPIODR, gpio);
+	return 0;
+}
+
+static int men_z127_dir_input(struct gpio_chip *chip, unsigned gpio)
+{
+
+	men_z127_clr_reg(chip, MEN_Z127_GPIODR, gpio);
+	return 0;
+}
+
+static void men_z127_set(struct gpio_chip *chip, unsigned gpio, int value)
+{
+	if (value)
+		men_z127_set_reg(chip, MEN_Z127_CTRL, gpio);
+	else
+		men_z127_clr_reg(chip, MEN_Z127_CTRL, gpio);
+}
+
+static int men_z127_get(struct gpio_chip *chip, unsigned gpio)
+{
+	struct men_z127_gpio *men_z127_gpio;
+	u32 val;
+
+	men_z127_gpio = to_men_z127_gpio(chip);
+	val = readl(men_z127_gpio->reg_base + MEN_Z127_PSR);
+
+	return !!(val & BIT(gpio));
+}
+
+static struct gpio_chip men_z127_chip = {
+	.label = "men-z127-gpio",
+	.owner = THIS_MODULE,
+	.direction_input = men_z127_dir_input,
+	.direction_output = men_z127_dir_output,
+	.get = men_z127_get,
+	.set = men_z127_set,
+	.ngpio = 32,
+	.base = 0,
+};
+
+static int men_z127_probe(struct mcb_device *mdev,
+			  const struct mcb_device_id *id)
+{
+	struct men_z127_gpio *men_z127_gpio;
+	struct device *dev = &mdev->dev;
+	struct resource *gpio_mem;
+	int ret;
+
+	men_z127_gpio = devm_kzalloc(dev, sizeof(struct men_z127_gpio),
+				     GFP_KERNEL);
+	if (!men_z127_gpio)
+		return -ENOMEM;
+
+	gpio_mem = mcb_request_mem(mdev, dev_name(dev));
+	if (IS_ERR(gpio_mem)) {
+		dev_err(dev, "failed to request device memory");
+		return PTR_ERR(gpio_mem);
+	}
+
+	men_z127_gpio->reg_base = ioremap(gpio_mem->start,
+					  resource_size(gpio_mem));
+	if (men_z127_gpio->reg_base == NULL) {
+		ret = -ENXIO;
+		goto err_out;
+	}
+
+	spin_lock_init(&men_z127_gpio->lock);
+
+	men_z127_chip.dev = &mdev->dev;
+	men_z127_gpio->mem = gpio_mem;
+	men_z127_gpio->chip = men_z127_chip;
+	mcb_set_drvdata(mdev, men_z127_gpio);
+
+	ret = gpiochip_add(&men_z127_gpio->chip);
+	if (ret) {
+		dev_err(dev, "failed to register MEN 16Z127 GPIO controller");
+		goto err_out;
+	}
+
+	dev_info(dev, "MEN 16Z127 GPIO driver registered");
+
+	return 0;
+
+err_out:
+	mcb_release_mem(gpio_mem);
+	return ret;
+}
+
+static void men_z127_remove(struct mcb_device *mdev)
+{
+	struct men_z127_gpio *men_z127_gpio = mcb_get_drvdata(mdev);
+
+	iounmap(men_z127_gpio->reg_base);
+	mcb_release_mem(men_z127_gpio->mem);
+}
+
+static const struct mcb_device_id men_z127_ids[] = {
+	{ .device = 0x7f },
+	{ }
+};
+MODULE_DEVICE_TABLE(mcb, men_z127_ids);
+
+static struct mcb_driver men_z127_driver = {
+	.driver = {
+		.name = "z127-gpio",
+		.owner = THIS_MODULE,
+	},
+	.probe = men_z127_probe,
+	.remove = men_z127_remove,
+	.id_table = men_z127_ids,
+};
+module_mcb_driver(men_z127_driver);
+
+MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
+MODULE_DESCRIPTION("MEN 16z127 GPIO Controller");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("mcb:16z127");
-- 
2.1.4
