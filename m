From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 051/182] gpio: pl061: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:21:16 +0100
Message-ID: <1449667276-32196-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34872 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbbLINVV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:21:21 -0500
Received: by lfdl133 with SMTP id l133so33908254lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:21:20 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index e041639adc14..9a61385488eb 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -60,7 +60,7 @@ struct pl061_gpio {
 
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned char gpiodir;
 
@@ -79,7 +79,7 @@ static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 		int value)
 {
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 	unsigned char gpiodir;
 
@@ -104,14 +104,14 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 
 static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
 {
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 
 	return !!readb(chip->base + (BIT(offset + 2)));
 }
 
 static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 
 	writeb(!!value << offset, chip->base + (BIT(offset + 2)));
 }
@@ -119,7 +119,7 @@ static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
 static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d);
 	unsigned long flags;
 	u8 gpiois, gpioibe, gpioiev;
@@ -209,7 +209,7 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	unsigned long pending;
 	int offset;
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(irqchip, desc);
@@ -227,7 +227,7 @@ static void pl061_irq_handler(struct irq_desc *desc)
 static void pl061_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 	u8 gpioie;
 
@@ -240,7 +240,7 @@ static void pl061_irq_mask(struct irq_data *d)
 static void pl061_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 	u8 gpioie;
 
@@ -261,7 +261,7 @@ static void pl061_irq_unmask(struct irq_data *d)
 static void pl061_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	struct pl061_gpio *chip = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 
 	spin_lock(&chip->lock);
@@ -319,7 +319,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	chip->gc.parent = dev;
 	chip->gc.owner = THIS_MODULE;
 
-	ret = gpiochip_add(&chip->gc);
+	ret = gpiochip_add_data(&chip->gc, chip);
 	if (ret)
 		return ret;
 
-- 
2.4.3

