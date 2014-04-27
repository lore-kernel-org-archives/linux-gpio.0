From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH 4/4] gpio: pl061: use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 02:00:50 +0200
Message-ID: <1398556850-27751-5-git-send-email-javier@dowhile0.org>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:58960 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752613AbaD0ABK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Apr 2014 20:01:10 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so4184636wib.5
        for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2014 17:01:09 -0700 (PDT)
In-Reply-To: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, inux-omap@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

Using the BIT() macro instead of manually shifting bits
makes the code less error prone and also more readable.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 drivers/gpio/gpio-pl061.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 84553d3..84b49cf 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -87,7 +87,7 @@ static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 
 	spin_lock_irqsave(&chip->lock, flags);
 	gpiodir = readb(chip->base + GPIODIR);
-	gpiodir &= ~(1 << offset);
+	gpiodir &= ~(BIT(offset));
 	writeb(gpiodir, chip->base + GPIODIR);
 	spin_unlock_irqrestore(&chip->lock, flags);
 
@@ -105,16 +105,16 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 		return -EINVAL;
 
 	spin_lock_irqsave(&chip->lock, flags);
-	writeb(!!value << offset, chip->base + (1 << (offset + 2)));
+	writeb(!!value << offset, chip->base + (BIT(offset + 2)));
 	gpiodir = readb(chip->base + GPIODIR);
-	gpiodir |= 1 << offset;
+	gpiodir |= BIT(offset);
 	writeb(gpiodir, chip->base + GPIODIR);
 
 	/*
 	 * gpio value is set again, because pl061 doesn't allow to set value of
 	 * a gpio pin before configuring it in OUT mode.
 	 */
-	writeb(!!value << offset, chip->base + (1 << (offset + 2)));
+	writeb(!!value << offset, chip->base + (BIT(offset + 2)));
 	spin_unlock_irqrestore(&chip->lock, flags);
 
 	return 0;
@@ -124,14 +124,14 @@ static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
 
-	return !!readb(chip->base + (1 << (offset + 2)));
+	return !!readb(chip->base + (BIT(offset + 2)));
 }
 
 static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
 {
 	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
 
-	writeb(!!value << offset, chip->base + (1 << (offset + 2)));
+	writeb(!!value << offset, chip->base + (BIT(offset + 2)));
 }
 
 static int pl061_irq_type(struct irq_data *d, unsigned trigger)
@@ -206,7 +206,7 @@ static void pl061_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
-	u8 mask = 1 << (irqd_to_hwirq(d) % PL061_GPIO_NR);
+	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 	u8 gpioie;
 
 	spin_lock(&chip->lock);
@@ -219,7 +219,7 @@ static void pl061_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
-	u8 mask = 1 << (irqd_to_hwirq(d) % PL061_GPIO_NR);
+	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 	u8 gpioie;
 
 	spin_lock(&chip->lock);
@@ -301,9 +301,9 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 
 	for (i = 0; i < PL061_GPIO_NR; i++) {
 		if (pdata) {
-			if (pdata->directions & (1 << i))
+			if (pdata->directions & (BIT(i)))
 				pl061_direction_output(&chip->gc, i,
-						pdata->values & (1 << i));
+						pdata->values & (BIT(i)));
 			else
 				pl061_direction_input(&chip->gc, i);
 		}
@@ -330,7 +330,7 @@ static int pl061_suspend(struct device *dev)
 	chip->csave_regs.gpio_ie = readb(chip->base + GPIOIE);
 
 	for (offset = 0; offset < PL061_GPIO_NR; offset++) {
-		if (chip->csave_regs.gpio_dir & (1 << offset))
+		if (chip->csave_regs.gpio_dir & (BIT(offset)))
 			chip->csave_regs.gpio_data |=
 				pl061_get_value(&chip->gc, offset) << offset;
 	}
@@ -344,10 +344,10 @@ static int pl061_resume(struct device *dev)
 	int offset;
 
 	for (offset = 0; offset < PL061_GPIO_NR; offset++) {
-		if (chip->csave_regs.gpio_dir & (1 << offset))
+		if (chip->csave_regs.gpio_dir & (BIT(offset)))
 			pl061_direction_output(&chip->gc, offset,
 					chip->csave_regs.gpio_data &
-					(1 << offset));
+					(BIT(offset)));
 		else
 			pl061_direction_input(&chip->gc, offset);
 	}
-- 
1.9.1

