From: Andreas Werner <andy@wernerandy.de>
Subject: [PATCH v2] gpio: add driver for MEN 16Z127 GPIO controller
Date: Mon, 29 Feb 2016 19:44:43 +0100
Message-ID: <8adb885e10c3b375d451830ba2612bfea09dd011.1456771093.git.andy@wernerandy.de>
References: <cover.1456771093.git.andy@wernerandy.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:52448 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753450AbcB2Sov (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 13:44:51 -0500
Content-Disposition: inline
In-Reply-To: <cover.1456771093.git.andy@wernerandy.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, morbidrsa@gmail.com, andreas.werner@men.de

The 16Z127 is a 32bit GPIO controller on a MCB FPGA.
Every single line can be configured as input and output.

Push pull and open drain are supported as well as setting
a debounce value for the input lines.

Signed-off-by: Andreas Werner <andy@wernerandy.de>
---
 drivers/gpio/Kconfig        |   7 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-menz127.c | 200 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
 create mode 100644 drivers/gpio/gpio-menz127.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9ee9fa7..9a5ba358 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -270,6 +270,13 @@ config GPIO_MB86S7X
 	help
 	  Say yes here to support the GPIO controller in Fujitsu MB86S70 SoCs.
 
+config GPIO_MENZ127
+	tristate "MEN 16Z127 GPIO support"
+	depends on MCB
+	select GPIO_GENERIC
+	help
+	 Say yes here to support the MEN 16Z127 GPIO Controller
+
 config GPIO_MM_LANTIQ
 	bool "Lantiq Memory mapped GPIOs"
 	depends on LANTIQ && SOC_XWAY
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 6f969df..42e3b00 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -59,6 +59,7 @@ obj-$(CONFIG_GPIO_MAX7300)	+= gpio-max7300.o
 obj-$(CONFIG_GPIO_MAX7301)	+= gpio-max7301.o
 obj-$(CONFIG_GPIO_MAX732X)	+= gpio-max732x.o
 obj-$(CONFIG_GPIO_MB86S7X)	+= gpio-mb86s7x.o
+obj-$(CONFIG_GPIO_MENZ127)	+= gpio-menz127.o
 obj-$(CONFIG_GPIO_MC33880)	+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
 obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
new file mode 100644
index 0000000..a68e199
--- /dev/null
+++ b/drivers/gpio/gpio-menz127.c
@@ -0,0 +1,200 @@
+/*
+ * MEN 16Z127 GPIO driver
+ *
+ * Copyright (C) 2016 MEN Mikroelektronik GmbH (www.men.de)
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the Free
+ * Software Foundation; version 2 of the License.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/mcb.h>
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+
+#define MEN_Z127_CTRL	0x00
+#define MEN_Z127_PSR	0x04
+#define MEN_Z127_IRQR	0x08
+#define MEN_Z127_GPIODR	0x0c
+#define MEN_Z127_IER1	0x10
+#define MEN_Z127_IER2	0x14
+#define MEN_Z127_DBER	0x18
+#define MEN_Z127_ODER	0x1C
+#define GPIO_TO_DBCNT_REG(gpio)	((gpio * 4) + 0x80)
+
+#define MEN_Z127_DB_MIN_US	50
+/* 16 bit compare register. Each bit represents 50us */
+#define MEN_Z127_DB_MAX_US	(0xffff * MEN_Z127_DB_MIN_US)
+#define MEN_Z127_DB_IN_RANGE(db)	((db >= MEN_Z127_DB_MIN_US) && \
+					 (db <= MEN_Z127_DB_MAX_US))
+
+struct men_z127_gpio {
+	struct gpio_chip gc;
+	void __iomem *reg_base;
+	struct mcb_device *mdev;
+	struct resource *mem;
+	spinlock_t lock;
+};
+
+static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
+			     unsigned debounce)
+{
+	struct men_z127_gpio *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->mdev->dev;
+	unsigned int rnd;
+	u32 db_en, db_cnt;
+
+	if (!MEN_Z127_DB_IN_RANGE(debounce)) {
+		dev_err(dev, "debounce value %u out of range", debounce);
+		return -EINVAL;
+	}
+
+	if (debounce > 0) {
+		/* round up or down depending on MSB-1 */
+		rnd = fls(debounce) - 1;
+
+		if (rnd && (debounce & BIT(rnd - 1)))
+			debounce = round_up(debounce, MEN_Z127_DB_MIN_US);
+		else
+			debounce = round_down(debounce, MEN_Z127_DB_MIN_US);
+
+		if (debounce > MEN_Z127_DB_MAX_US)
+			debounce = MEN_Z127_DB_MAX_US;
+
+		/* 50us per register unit */
+		debounce /= 50;
+	}
+
+	spin_lock(&priv->lock);
+
+	db_en = readl(priv->reg_base + MEN_Z127_DBER);
+
+	if (debounce == 0) {
+		db_en &= ~BIT(gpio);
+		db_cnt = 0;
+	} else {
+		db_en |= BIT(gpio);
+		db_cnt = debounce;
+	}
+
+	writel(db_en, priv->reg_base + MEN_Z127_DBER);
+	writel(db_cnt, priv->reg_base + GPIO_TO_DBCNT_REG(gpio));
+
+	spin_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int men_z127_request(struct gpio_chip *gc, unsigned gpio_pin)
+{
+	struct men_z127_gpio *priv = gpiochip_get_data(gc);
+	u32 od_en;
+
+	if (gpio_pin >= gc->ngpio)
+		return -EINVAL;
+
+	spin_lock(&priv->lock);
+	od_en = readl(priv->reg_base + MEN_Z127_ODER);
+
+	if (gpiochip_line_is_open_drain(gc, gpio_pin))
+		od_en |= BIT(gpio_pin);
+	else
+		od_en &= ~BIT(gpio_pin);
+
+	writel(od_en, priv->reg_base + MEN_Z127_ODER);
+	spin_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int men_z127_probe(struct mcb_device *mdev,
+			  const struct mcb_device_id *id)
+{
+	struct men_z127_gpio *men_z127_gpio;
+	struct device *dev = &mdev->dev;
+	int ret;
+
+	men_z127_gpio = devm_kzalloc(dev, sizeof(struct men_z127_gpio),
+				     GFP_KERNEL);
+	if (!men_z127_gpio)
+		return -ENOMEM;
+
+	men_z127_gpio->mem = mcb_request_mem(mdev, dev_name(dev));
+	if (IS_ERR(men_z127_gpio->mem)) {
+		dev_err(dev, "failed to request device memory");
+		return PTR_ERR(men_z127_gpio->mem);
+	}
+
+	men_z127_gpio->reg_base = ioremap(men_z127_gpio->mem->start,
+					  resource_size(men_z127_gpio->mem));
+	if (men_z127_gpio->reg_base == NULL) {
+		ret = -ENXIO;
+		goto err_release;
+	}
+
+	men_z127_gpio->mdev = mdev;
+	mcb_set_drvdata(mdev, men_z127_gpio);
+
+	ret = bgpio_init(&men_z127_gpio->gc, &mdev->dev, 4,
+			 men_z127_gpio->reg_base + MEN_Z127_PSR,
+			 men_z127_gpio->reg_base + MEN_Z127_CTRL,
+			 NULL,
+			 men_z127_gpio->reg_base + MEN_Z127_GPIODR,
+			 NULL, 0);
+	if (ret)
+		goto err_unmap;
+
+	men_z127_gpio->gc.set_debounce = men_z127_debounce;
+	men_z127_gpio->gc.request = men_z127_request;
+
+	ret = gpiochip_add_data(&men_z127_gpio->gc, men_z127_gpio);
+	if (ret) {
+		dev_err(dev, "failed to register MEN 16Z127 GPIO controller");
+		goto err_unmap;
+	}
+
+	dev_info(dev, "MEN 16Z127 GPIO driver registered");
+
+	return 0;
+
+err_unmap:
+	iounmap(men_z127_gpio->reg_base);
+err_release:
+	mcb_release_mem(men_z127_gpio->mem);
+	return ret;
+}
+
+static void men_z127_remove(struct mcb_device *mdev)
+{
+	struct men_z127_gpio *men_z127_gpio = mcb_get_drvdata(mdev);
+
+	gpiochip_remove(&men_z127_gpio->gc);
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
2.6.2

