Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A186B46D558;
	Tue, 15 Sep 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464095; cv=none; b=Ql2MTLF7s+fUiWuM+8Sv3o8A46vkO8OMf2nWM7hg4aZZfg2u2+XmDAeaQ+Myc8b2OI7PiekQIxNkqgX4/PLiNw+0fP5dq7LKG9NQEIqfzgFJrd7+RDkzQa4XDz505gbzon8eaXxSPvgmoMAfBqoMZV+IFgtbwVVePiqVNrlJtVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464095; c=relaxed/simple;
	bh=K74GwX0w/2kAalypJtCC/LD5vN+8zjQPpcMpYp6MyUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CyQ2XMLFkAV924FsmG75XKa2eYcPqTkB264xmTDUIXPmpsl8lJ45lQav15ytpYT5lbkICh0c5zi4bEKlpU6ZE1lFThzDL/eCwHdm/wETWi7j/sZXs16i+9IVkb8QUJcpBk7SVdrUXv38kOvhBGqHie759gsgadqlVya778e9ENM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id BDC7913F899;
	Tue, 15 Sep 2026 11:21:21 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 2/2] gpio: Support ON Semi CAT9532
Date: Tue, 15 Sep 2026 11:20:46 +0200
Message-Id: <20260915092046.931449-3-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the CAT9532 LED dimmer from On Semiconductor. Altought
marketed as an LED dimmer it is a bit limited in this regard as it
only has 2 PWM for 16 pins. As explained in the datasheet it can also
be used as an open-drain GPIO controller, and that's how it is used on
the hardware I have at hand. This chip doesn't really map to what the
gpio-regmap driver expect so it is implemented as it own driver. This
approch also allow to later add support for the LED dimmer if desired.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/gpio/Kconfig        |  10 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-cat9532.c | 173 ++++++++++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)
 create mode 100644 drivers/gpio/gpio-cat9532.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edba..05b7af675677b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1180,6 +1180,16 @@ config GPIO_ADNP
 	  enough to represent all pins, but the driver will assume a
 	  register layout for 64 pins (8 registers).
 
+config GPIO_CAT9532
+	tristate "CAT9532 GPIO support"
+	select REGMAP_I2C
+	help
+	  GPIO driver for ON Semiconductor CAT9532 LED dimmer.
+	  Say yes here to enable the GPIO driver for the CAT9532 chip.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-cat9532.
+
 config GPIO_FXL6408
 	tristate "FXL6408 I2C GPIO expander"
 	select GPIO_REGMAP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5bc..e94d2f57a1f93 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_BY_PINCTRL)		+= gpio-by-pinctrl.o
 obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
+obj-$(CONFIG_GPIO_CAT9532)		+= gpio-cat9532.o
 obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
diff --git a/drivers/gpio/gpio-cat9532.c b/drivers/gpio/gpio-cat9532.c
new file mode 100644
index 0000000000000..973ff74a15b89
--- /dev/null
+++ b/drivers/gpio/gpio-cat9532.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+struct cat9532 {
+	struct regmap *regmap;
+	struct gpio_chip gpio;
+
+	spinlock_t lock;
+	unsigned int direction;
+};
+
+#define CAT9532_REG_INPUT0	0
+#define CAT9532_REG_LS0		6
+
+/* Set output to Hi-Z, LED is OFF */
+#define CAT9532_LED_OUT_HIZ	0
+/* Set output low  */
+#define CAT9532_LED_OUT_LOW	1
+#define CAT9532_LED_OUT_MASK	3
+
+static const struct regmap_config cat9532_regmap_cfg = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 9,
+	/*
+	 * Auto increment can be enabled by setting bit 4 in the
+	 * register address, but we don't really need bulk access.
+	 */
+	.use_single_read = true,
+	.use_single_write = true,
+	.can_sleep = true,
+};
+
+static int cat9532_gpio_get_direction(struct gpio_chip *chip,
+					unsigned int offset)
+{
+	struct cat9532 *cat9532 = container_of(chip, struct cat9532, gpio);
+
+	scoped_guard(spinlock, &cat9532->lock)
+		if (cat9532->direction & BIT(offset))
+			return GPIO_LINE_DIRECTION_OUT;
+		else
+			return GPIO_LINE_DIRECTION_IN;
+}
+
+static int cat9532_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int offset)
+{
+	struct cat9532 *cat9532 = container_of(chip, struct cat9532, gpio);
+	unsigned int reg = CAT9532_REG_LS0 + (offset >> 2);
+	unsigned int shift = (offset & 3) << 1;
+	int err;
+
+	err = regmap_update_bits(cat9532->regmap, reg,
+				 CAT9532_LED_OUT_MASK << shift,
+				 CAT9532_LED_OUT_HIZ << shift);
+	if (err < 0)
+		return err;
+
+	scoped_guard(spinlock, &cat9532->lock)
+		cat9532->direction &= ~BIT(offset);
+
+	return 0;
+}
+
+static int cat9532_gpio_get(struct gpio_chip *chip,
+			    unsigned int offset)
+{
+	struct cat9532 *cat9532 = container_of(chip, struct cat9532, gpio);
+	unsigned int reg = CAT9532_REG_INPUT0 + (offset >> 3);
+	unsigned int mask = BIT(offset & 7);
+	unsigned int val;
+	int err;
+
+	err = regmap_read(cat9532->regmap, reg, &val);
+	if (err < 0)
+		return err;
+
+	return !!(val & mask);
+}
+
+static int cat9532_gpio_set(struct gpio_chip *chip,
+			    unsigned int offset, int value)
+{
+	struct cat9532 *cat9532 = container_of(chip, struct cat9532, gpio);
+	unsigned int reg = CAT9532_REG_LS0 + (offset >> 2);
+	unsigned int shift = (offset & 3) << 1;
+	unsigned int val;
+
+	val = value ? CAT9532_LED_OUT_HIZ : CAT9532_LED_OUT_LOW;
+	return regmap_update_bits(cat9532->regmap, reg,
+				  CAT9532_LED_OUT_MASK << shift,
+				  val << shift);
+}
+
+static int cat9532_gpio_direction_output(struct gpio_chip *chip,
+					 unsigned int offset, int value)
+{
+	struct cat9532 *cat9532 = container_of(chip, struct cat9532, gpio);
+	int err;
+
+	err = cat9532_gpio_set(chip, offset, value);
+	if (err < 0)
+		return err;
+
+	scoped_guard(spinlock, &cat9532->lock)
+		cat9532->direction |= BIT(offset);
+
+	return 0;
+}
+
+static int cat9532_i2c_probe(struct i2c_client *client)
+{
+	struct cat9532 *cat9532;
+	struct gpio_chip *chip;
+
+	cat9532 = devm_kzalloc(&client->dev, sizeof(*cat9532), GFP_KERNEL);
+	if (!cat9532)
+		return -ENOMEM;
+
+	spin_lock_init(&cat9532->lock);
+
+	cat9532->regmap = devm_regmap_init_i2c(client, &cat9532_regmap_cfg);
+	if (IS_ERR(cat9532->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(cat9532->regmap),
+				     "failed to initialize regmap\n");
+
+	chip = &cat9532->gpio;
+	chip->label = "cat9532";
+	chip->parent = &client->dev;
+	chip->owner = THIS_MODULE;
+	chip->can_sleep = true;
+	chip->base = -1;
+	chip->ngpio = 16;
+
+	chip->get_direction = cat9532_gpio_get_direction;
+	chip->direction_input = cat9532_gpio_direction_input;
+	chip->direction_output = cat9532_gpio_direction_output;
+	chip->get = cat9532_gpio_get;
+	chip->set = cat9532_gpio_set;
+
+	return devm_gpiochip_add_data(&client->dev, chip, cat9532);
+}
+
+static const struct i2c_device_id cat9532_i2c_id[] = {
+	{ "cat9532" },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, cat9532_i2c_id);
+
+static const struct of_device_id cat9532_of_match[] = {
+	{ .compatible = "onnn,cat9532" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cat9532_of_match);
+
+static struct i2c_driver cat9532_i2c_driver = {
+	.driver = {
+		.name = "gpio-cat9532",
+		.of_match_table = cat9532_of_match,
+	},
+	.probe = cat9532_i2c_probe,
+	.id_table = cat9532_i2c_id,
+};
+module_i2c_driver(cat9532_i2c_driver);
+
+MODULE_DESCRIPTION("On Semiconductor CAT9532 GPIO driver");
+MODULE_AUTHOR("Alban Bedel <alban.bedel@lht.dlh.de>");
+MODULE_LICENSE("GPL");
-- 
2.39.5

