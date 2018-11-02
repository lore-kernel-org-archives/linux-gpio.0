From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v2 bus+gpio 3/4] drivers: gpio: Add support for GPIOs over Moxtet bus
Date: Fri,  2 Nov 2018 11:35:38 +0100
Message-ID: <20181102103539.6077-3-marek.behun@nic.cz>
References: <20181102103539.6077-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102103539.6077-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-Id: linux-gpio@vger.kernel.org

This adds support for interpreting the input and output bits of one
device on Moxtet bus as GPIOs.
This is needed for example by the SFP cage module of Turris Mox.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 MAINTAINERS                |   1 +
 drivers/gpio/Kconfig       |   9 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-moxtet.c | 178 +++++++++++++++++++++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 drivers/gpio/gpio-moxtet.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ccc745d1b430..b8c04b98b92f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1478,6 +1478,7 @@ W:	http://mox.turris.cz
 S:	Maintained
 F:	include/linux/moxtet.h
 F:	drivers/bus/moxtet.c
+F:	drivers/gpio/gpio-moxtet.c
 
 ARM/EBSA110 MACHINE SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 833a1b51c948..6e753ce10972 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -334,6 +334,15 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+config GPIO_MOXTET
+	tristate "Turris Mox Moxtet bus GPIO expander"
+	depends on MOXTET
+	help
+	  Say yes here if you are building for the Turris Mox router.
+	  This is the driver needed for configuring the GPIOs via the Moxtet
+	  bus. For example the Mox module with SFP cage needs this driver
+	  so that phylink can use corresponding GPIOs.
+
 config GPIO_MPC5200
 	def_bool y
 	depends on PPC_MPC52xx
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 671c4477c951..044435ac45e2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
 obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
+obj-$(CONFIG_GPIO_MOXTET)	+= gpio-moxtet.o
 obj-$(CONFIG_GPIO_MPC5200)	+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)	+= gpio-mpc8xxx.o
 obj-$(CONFIG_GPIO_MSIC)		+= gpio-msic.o
diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
new file mode 100644
index 000000000000..0b0af8651443
--- /dev/null
+++ b/drivers/gpio/gpio-moxtet.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Turris Mox Moxtet GPIO expander
+ *
+ *  Copyright (C) 2018 Marek Behun <marek.behun@nic.cz>
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/moxtet.h>
+#include <linux/module.h>
+
+#define MOXTET_GPIO_NGPIOS	12
+#define MOXTET_GPIO_INPUTS	4
+
+struct moxtet_gpio_desc {
+	u16 in_mask;
+	u16 out_mask;
+};
+
+static const struct moxtet_gpio_desc descs[] = {
+	[TURRIS_MOX_MODULE_SFP] = {
+		.in_mask = 0x7,
+		.out_mask = 0x30,
+	},
+};
+
+struct moxtet_gpio_chip {
+	struct device			*dev;
+	struct gpio_chip		gpio_chip;
+	const struct moxtet_gpio_desc	*desc;
+};
+
+static int moxtet_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
+	int ret;
+
+	if (chip->desc->in_mask & BIT(offset)) {
+		ret = moxtet_device_read(chip->dev);
+	} else if (chip->desc->out_mask & BIT(offset)) {
+		ret = moxtet_device_written(chip->dev);
+		if (ret >= 0)
+			ret <<= MOXTET_GPIO_INPUTS;
+	} else {
+		return -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return (ret & BIT(offset)) ? 1 : 0;
+}
+
+static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				  int val)
+{
+	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
+	int state;
+
+	state = moxtet_device_written(chip->dev);
+	if (state < 0)
+		return;
+
+	offset -= MOXTET_GPIO_INPUTS;
+
+	if (val)
+		state |= BIT(offset);
+	else
+		state &= ~BIT(offset);
+
+	moxtet_device_write(chip->dev, state);
+}
+
+static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
+
+	if (chip->desc->in_mask & BIT(offset))
+		return 1;
+	else if (chip->desc->out_mask & BIT(offset))
+		return 0;
+	else
+		return -EINVAL;
+}
+
+static int moxtet_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int offset)
+{
+	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
+
+	if (chip->desc->in_mask & BIT(offset))
+		return 0;
+	else if (chip->desc->out_mask & BIT(offset))
+		return -ENOTSUPP;
+	else
+		return -EINVAL;
+}
+
+static int moxtet_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int offset, int val)
+{
+	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
+
+	if (chip->desc->out_mask & BIT(offset))
+		moxtet_gpio_set_value(gc, offset, val);
+	else if (chip->desc->in_mask & BIT(offset))
+		return -ENOTSUPP;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int moxtet_gpio_probe(struct device *dev)
+{
+	struct moxtet_gpio_chip *chip;
+	struct device_node *nc = dev->of_node;
+	int id;
+
+	id = to_moxtet_device(dev)->id;
+
+	if (id >= ARRAY_SIZE(descs)) {
+		dev_err(dev, "%pOF Moxtet device id 0x%x is not supported by "
+			     "gpio-moxtet driver\n", nc, id);
+		return -ENOTSUPP;
+	}
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = dev;
+	chip->gpio_chip.parent = dev;
+	chip->desc = &descs[id];
+
+	dev_set_drvdata(dev, chip);
+
+	chip->gpio_chip.label = dev_name(dev);
+	chip->gpio_chip.get_direction = moxtet_gpio_get_direction;
+	chip->gpio_chip.direction_input = moxtet_gpio_direction_input;
+	chip->gpio_chip.direction_output = moxtet_gpio_direction_output;
+	chip->gpio_chip.get = moxtet_gpio_get_value;
+	chip->gpio_chip.set = moxtet_gpio_set_value;
+	chip->gpio_chip.base = -1;
+
+	chip->gpio_chip.ngpio = MOXTET_GPIO_NGPIOS;
+
+	chip->gpio_chip.can_sleep = true;
+	chip->gpio_chip.owner = THIS_MODULE;
+
+	return devm_gpiochip_add_data(dev, &chip->gpio_chip, chip);
+}
+
+static const struct of_device_id moxtet_gpio_dt_ids[] = {
+	{ .compatible = "cznic,moxtet-gpio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, moxtet_gpio_dt_ids);
+
+static const enum turris_mox_module_id moxtet_gpio_module_table[] = {
+	TURRIS_MOX_MODULE_SFP,
+	0,
+};
+
+static struct moxtet_driver moxtet_gpio_driver = {
+	.driver = {
+		.name		= "moxtet-gpio",
+		.of_match_table	= moxtet_gpio_dt_ids,
+		.probe		= moxtet_gpio_probe,
+	},
+	.id_table = moxtet_gpio_module_table,
+};
+module_moxtet_driver(moxtet_gpio_driver);
+
+MODULE_AUTHOR("Marek Behun <marek.behun@nic.cz>");
+MODULE_DESCRIPTION("Turris Mox Moxtet GPIO expander");
+MODULE_LICENSE("GPL v2");
-- 
2.18.1
