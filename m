From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 086/182] gpio: zx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:29:14 +0100
Message-ID: <1449667754-1611-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34258 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLIN3S (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:29:18 -0500
Received: by lffu14 with SMTP id u14so34253490lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:29:17 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jun Nie <jun.nie@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-zx.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index ab2e54fa46cf..47c79fa65670 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -43,14 +43,9 @@ struct zx_gpio {
 	struct gpio_chip	gc;
 };
 
-static inline struct zx_gpio *to_zx(struct gpio_chip *gc)
-{
-	return container_of(gc, struct zx_gpio, gc);
-}
-
 static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 	u16 gpiodir;
 
@@ -69,7 +64,7 @@ static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
 static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
 		int value)
 {
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 	u16 gpiodir;
 
@@ -92,14 +87,14 @@ static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
 
 static int zx_get_value(struct gpio_chip *gc, unsigned offset)
 {
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 
 	return !!(readw_relaxed(chip->base + ZX_GPIO_DI) & BIT(offset));
 }
 
 static void zx_set_value(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 
 	if (value)
 		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO1);
@@ -110,7 +105,7 @@ static void zx_set_value(struct gpio_chip *gc, unsigned offset, int value)
 static int zx_irq_type(struct irq_data *d, unsigned trigger)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d);
 	unsigned long flags;
 	u16 gpiois, gpioi_epos, gpioi_eneg, gpioiev;
@@ -162,7 +157,7 @@ static void zx_irq_handler(struct irq_desc *desc)
 	unsigned long pending;
 	int offset;
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(irqchip, desc);
@@ -181,7 +176,7 @@ static void zx_irq_handler(struct irq_desc *desc)
 static void zx_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 	u16 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
 	u16 gpioie;
 
@@ -196,7 +191,7 @@ static void zx_irq_mask(struct irq_data *d)
 static void zx_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct zx_gpio *chip = to_zx(gc);
+	struct zx_gpio *chip = gpiochip_get_data(gc);
 	u16 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
 	u16 gpioie;
 
@@ -248,7 +243,7 @@ static int zx_gpio_probe(struct platform_device *pdev)
 	chip->gc.parent = dev;
 	chip->gc.owner = THIS_MODULE;
 
-	ret = gpiochip_add(&chip->gc);
+	ret = gpiochip_add_data(&chip->gc, chip);
 	if (ret)
 		return ret;
 
-- 
2.4.3

