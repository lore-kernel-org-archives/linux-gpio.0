From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 066/182] gpio: tc3589x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:37 +0100
Message-ID: <1449667417-467-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34295 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbbLINXm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:42 -0500
Received: by lffu14 with SMTP id u14so34144216lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 7c1537ed6dff..8f3fbf83c6e8 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -34,14 +34,9 @@ struct tc3589x_gpio {
 	u8 oldregs[CACHE_NR_REGS][CACHE_NR_BANKS];
 };
 
-static inline struct tc3589x_gpio *to_tc3589x_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct tc3589x_gpio, chip);
-}
-
 static int tc3589x_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(chip);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODATA0 + (offset / 8) * 2;
 	u8 mask = 1 << (offset % 8);
@@ -56,7 +51,7 @@ static int tc3589x_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(chip);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODATA0 + (offset / 8) * 2;
 	unsigned pos = offset % 8;
@@ -68,7 +63,7 @@ static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int val)
 {
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(chip);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODIR0 + offset / 8;
 	unsigned pos = offset % 8;
@@ -81,7 +76,7 @@ static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
 static int tc3589x_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(chip);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODIR0 + offset / 8;
 	unsigned pos = offset % 8;
@@ -102,7 +97,7 @@ static struct gpio_chip template_chip = {
 static int tc3589x_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -130,7 +125,7 @@ static int tc3589x_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 static void tc3589x_gpio_irq_lock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 
 	mutex_lock(&tc3589x_gpio->irq_lock);
 }
@@ -138,7 +133,7 @@ static void tc3589x_gpio_irq_lock(struct irq_data *d)
 static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	static const u8 regmap[] = {
 		[REG_IBE]	= TC3589x_GPIOIBE0,
@@ -167,7 +162,7 @@ static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
 static void tc3589x_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -178,7 +173,7 @@ static void tc3589x_gpio_irq_mask(struct irq_data *d)
 static void tc3589x_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct tc3589x_gpio *tc3589x_gpio = to_tc3589x_gpio(gc);
+	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(gc);
 	int offset = d->hwirq;
 	int regoffset = offset / 8;
 	int mask = 1 << (offset % 8);
@@ -277,7 +272,7 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = gpiochip_add(&tc3589x_gpio->chip);
+	ret = gpiochip_add_data(&tc3589x_gpio->chip, tc3589x_gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
 		return ret;
-- 
2.4.3

