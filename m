From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 054/182] gpio: rcar: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:22:08 +0100
Message-ID: <1449667328-32341-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34501 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754284AbbLINWN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:13 -0500
Received: by lffu14 with SMTP id u14so34114975lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-rcar.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3cbb25ecfc7a..d81051f21973 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -84,8 +84,7 @@ static void gpio_rcar_modify_bit(struct gpio_rcar_priv *p, int offs,
 static void gpio_rcar_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
-						gpio_chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 
 	gpio_rcar_write(p, INTMSK, ~BIT(irqd_to_hwirq(d)));
 }
@@ -93,8 +92,7 @@ static void gpio_rcar_irq_disable(struct irq_data *d)
 static void gpio_rcar_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
-						gpio_chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 
 	gpio_rcar_write(p, MSKCLR, BIT(irqd_to_hwirq(d)));
 }
@@ -137,8 +135,7 @@ static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
 static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
-						gpio_chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	dev_dbg(&p->pdev->dev, "sense irq = %d, type = %d\n", hwirq, type);
@@ -175,8 +172,7 @@ static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
 static int gpio_rcar_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
-						gpio_chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 	int error;
 
 	if (p->irq_parent) {
@@ -218,16 +214,11 @@ static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
 	return irqs_handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
-static inline struct gpio_rcar_priv *gpio_to_priv(struct gpio_chip *chip)
-{
-	return container_of(chip, struct gpio_rcar_priv, gpio_chip);
-}
-
 static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 						       unsigned int gpio,
 						       bool output)
 {
-	struct gpio_rcar_priv *p = gpio_to_priv(chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	/* follow steps in the GPIO documentation for
@@ -251,7 +242,7 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 
 static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_rcar_priv *p = gpio_to_priv(chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	int error;
 
 	error = pm_runtime_get_sync(&p->pdev->dev);
@@ -267,7 +258,7 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 
 static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_rcar_priv *p = gpio_to_priv(chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 
 	pinctrl_free_gpio(chip->base + offset);
 
@@ -291,15 +282,15 @@ static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
 
 	/* testing on r8a7790 shows that INDT does not show correct pin state
 	 * when configured as output, so use OUTDT in case of output pins */
-	if (gpio_rcar_read(gpio_to_priv(chip), INOUTSEL) & bit)
-		return !!(gpio_rcar_read(gpio_to_priv(chip), OUTDT) & bit);
+	if (gpio_rcar_read(gpiochip_get_data(chip), INOUTSEL) & bit)
+		return !!(gpio_rcar_read(gpiochip_get_data(chip), OUTDT) & bit);
 	else
-		return !!(gpio_rcar_read(gpio_to_priv(chip), INDT) & bit);
+		return !!(gpio_rcar_read(gpiochip_get_data(chip), INDT) & bit);
 }
 
 static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct gpio_rcar_priv *p = gpio_to_priv(chip);
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&p->lock, flags);
@@ -462,7 +453,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
 	irq_chip->flags	= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
 
-	ret = gpiochip_add(gpio_chip);
+	ret = gpiochip_add_data(gpio_chip, p);
 	if (ret) {
 		dev_err(dev, "failed to add GPIO controller\n");
 		goto err0;
-- 
2.4.3

