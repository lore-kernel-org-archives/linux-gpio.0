From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc3589x: use BIT() macro
Date: Tue,  5 Apr 2016 15:10:55 +0200
Message-ID: <1459861855-1975-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33618 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023AbcDENLB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 09:11:01 -0400
Received: by mail-lf0-f50.google.com with SMTP id e190so8262396lfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 06:11:01 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This switch to use BIT(n) instead of (1 << n) which is less
to the point. Most GPIO drivers do this to avoid mistakes.
Also switch from using <linux/gpio.h> to the apropriate
<linux/gpio/driver.h> include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 4f566e6b81f1..3d84bae89067 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -10,10 +10,11 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/of.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/tc3589x.h>
+#include <linux/bitops.h>
 
 /*
  * These registers are modified under the irq bus lock and cached to avoid
@@ -39,7 +40,7 @@ static int tc3589x_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODATA0 + (offset / 8) * 2;
-	u8 mask = 1 << (offset % 8);
+	u8 mask = BIT(offset % 8);
 	int ret;
 
 	ret = tc3589x_reg_read(tc3589x, reg);
@@ -55,7 +56,7 @@ static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODATA0 + (offset / 8) * 2;
 	unsigned pos = offset % 8;
-	u8 data[] = {!!val << pos, 1 << pos};
+	u8 data[] = {!!val << pos, BIT(pos)};
 
 	tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
 }
@@ -70,7 +71,7 @@ static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
 
 	tc3589x_gpio_set(chip, offset, val);
 
-	return tc3589x_set_bits(tc3589x, reg, 1 << pos, 1 << pos);
+	return tc3589x_set_bits(tc3589x, reg, BIT(pos), BIT(pos));
 }
 
 static int tc3589x_gpio_direction_input(struct gpio_chip *chip,
@@ -100,7 +101,7 @@ static int tc3589x_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
-	int mask = 1 << (offset % 8);
+	int mask = BIT(offset % 8);
 
 	if (type == IRQ_TYPE_EDGE_BOTH) {
 		tc3589x_gpio->regs[REG_IBE][regoffset] |= mask;
@@ -165,7 +166,7 @@ static void tc3589x_gpio_irq_mask(struct irq_data *d)
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
-	int mask = 1 << (offset % 8);
+	int mask = BIT(offset % 8);
 
 	tc3589x_gpio->regs[REG_IE][regoffset] &= ~mask;
 }
@@ -176,7 +177,7 @@ static void tc3589x_gpio_irq_unmask(struct irq_data *d)
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
-	int mask = 1 << (offset % 8);
+	int mask = BIT(offset % 8);
 
 	tc3589x_gpio->regs[REG_IE][regoffset] |= mask;
 }
-- 
2.4.3

