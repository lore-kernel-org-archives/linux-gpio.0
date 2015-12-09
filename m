From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 011/182] gpio: altera: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:14:11 +0100
Message-ID: <1449666851-30263-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33973 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104AbbLINOS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:14:18 -0500
Received: by lbbcs9 with SMTP id cs9so29652778lbb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:14:17 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tien Hock Loh <thloh@altera.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Tien Hock Loh <thloh@altera.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 84a20af01a9a..2aeaebd1c6e7 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -42,11 +42,6 @@ struct altera_gpio_chip {
 	int mapped_irq;
 };
 
-static struct altera_gpio_chip *to_altera(struct gpio_chip *gc)
-{
-	return container_of(gc, struct altera_gpio_chip, mmchip.gc);
-}
-
 static void altera_gpio_irq_unmask(struct irq_data *d)
 {
 	struct altera_gpio_chip *altera_gc;
@@ -54,7 +49,7 @@ static void altera_gpio_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 intmask;
 
-	altera_gc = to_altera(irq_data_get_irq_chip_data(d));
+	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	mm_gc = &altera_gc->mmchip;
 
 	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
@@ -72,7 +67,7 @@ static void altera_gpio_irq_mask(struct irq_data *d)
 	unsigned long flags;
 	u32 intmask;
 
-	altera_gc = to_altera(irq_data_get_irq_chip_data(d));
+	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	mm_gc = &altera_gc->mmchip;
 
 	spin_lock_irqsave(&altera_gc->gpio_lock, flags);
@@ -92,7 +87,7 @@ static int altera_gpio_irq_set_type(struct irq_data *d,
 {
 	struct altera_gpio_chip *altera_gc;
 
-	altera_gc = to_altera(irq_data_get_irq_chip_data(d));
+	altera_gc = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 
 	if (type == IRQ_TYPE_NONE)
 		return 0;
@@ -145,7 +140,7 @@ static void altera_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	unsigned int data_reg;
 
 	mm_gc = to_of_mm_gpio_chip(gc);
-	chip = container_of(mm_gc, struct altera_gpio_chip, mmchip);
+	chip = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 	data_reg = readl(mm_gc->regs + ALTERA_GPIO_DATA);
@@ -165,7 +160,7 @@ static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 	unsigned int gpio_ddr;
 
 	mm_gc = to_of_mm_gpio_chip(gc);
-	chip = container_of(mm_gc, struct altera_gpio_chip, mmchip);
+	chip = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 	/* Set pin as input, assumes software controlled IP */
@@ -186,7 +181,7 @@ static int altera_gpio_direction_output(struct gpio_chip *gc,
 	unsigned int data_reg, gpio_ddr;
 
 	mm_gc = to_of_mm_gpio_chip(gc);
-	chip = container_of(mm_gc, struct altera_gpio_chip, mmchip);
+	chip = gpiochip_get_data(gc);
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 	/* Sets the GPIO value */
@@ -215,7 +210,7 @@ static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 	unsigned long status;
 	int i;
 
-	altera_gc = to_altera(irq_desc_get_handler_data(desc));
+	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
 	irqdomain = altera_gc->mmchip.gc.irqdomain;
@@ -244,7 +239,7 @@ static void altera_gpio_irq_leveL_high_handler(struct irq_desc *desc)
 	unsigned long status;
 	int i;
 
-	altera_gc = to_altera(irq_desc_get_handler_data(desc));
+	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
 	irqdomain = altera_gc->mmchip.gc.irqdomain;
@@ -292,7 +287,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->mmchip.gc.owner		= THIS_MODULE;
 	altera_gc->mmchip.gc.parent		= &pdev->dev;
 
-	ret = of_mm_gpiochip_add(node, &altera_gc->mmchip);
+	ret = of_mm_gpiochip_add_data(node, &altera_gc->mmchip, altera_gc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
 		return ret;
-- 
2.4.3

