From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 006/182] gpio: 104-idio-16: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:13:24 +0100
Message-ID: <1449666804-30018-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33628 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753331AbbLINNa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:13:30 -0500
Received: by lfaz4 with SMTP id z4so33926737lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:13:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-104-idio-16.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index efe3ff7d574e..019101e05270 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -72,14 +72,9 @@ static int idio_16_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static struct idio_16_gpio *to_idio16gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct idio_16_gpio, chip);
-}
-
 static int idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
+	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
 	const unsigned mask = BIT(offset-16);
 
 	if (offset < 16)
@@ -93,7 +88,7 @@ static int idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
+	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
 	const unsigned mask = BIT(offset);
 	unsigned long flags;
 
@@ -118,7 +113,7 @@ static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static void idio_16_irq_ack(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
+	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&idio16gpio->lock, flags);
@@ -131,7 +126,7 @@ static void idio_16_irq_ack(struct irq_data *data)
 static void idio_16_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
+	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
 	const unsigned long mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
@@ -149,7 +144,7 @@ static void idio_16_irq_mask(struct irq_data *data)
 static void idio_16_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
+	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
 	const unsigned long mask = BIT(irqd_to_hwirq(data));
 	const unsigned long prev_irq_mask = idio16gpio->irq_mask;
 	unsigned long flags;
@@ -236,7 +231,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, idio16gpio);
 
-	err = gpiochip_add(&idio16gpio->chip);
+	err = gpiochip_add_data(&idio16gpio->chip, idio16gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		goto err_gpio_register;
-- 
2.4.3

