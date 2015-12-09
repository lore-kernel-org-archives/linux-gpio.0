From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 005/182] gpio: 104-idi-48: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:13:15 +0100
Message-ID: <1449666795-29971-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36628 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753362AbbLINNV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:13:21 -0500
Received: by lfs39 with SMTP id 39so34078561lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:13:19 -0800 (PST)
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
 drivers/gpio/gpio-104-idi-48.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index b5c693409a58..779db930da8b 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -62,14 +62,9 @@ static int idi_48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static struct idi_48_gpio *to_idi48gpio(struct gpio_chip *gc)
-{
-	return container_of(gc, struct idi_48_gpio, chip);
-}
-
 static int idi_48_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
 	unsigned i;
 	const unsigned register_offset[6] = { 0, 1, 2, 4, 5, 6 };
 	unsigned base_offset;
@@ -90,7 +85,7 @@ static int idi_48_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void idi_48_irq_ack(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&idi48gpio->lock, flags);
@@ -103,7 +98,7 @@ static void idi_48_irq_ack(struct irq_data *data)
 static void idi_48_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
 	const unsigned offset = irqd_to_hwirq(data);
 	unsigned i;
 	unsigned mask;
@@ -134,7 +129,7 @@ static void idi_48_irq_mask(struct irq_data *data)
 static void idi_48_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
-	struct idi_48_gpio *const idi48gpio = to_idi48gpio(chip);
+	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
 	const unsigned offset = irqd_to_hwirq(data);
 	unsigned i;
 	unsigned mask;
@@ -256,7 +251,7 @@ static int __init idi_48_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, idi48gpio);
 
-	err = gpiochip_add(&idi48gpio->chip);
+	err = gpiochip_add_data(&idi48gpio->chip, idi48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		goto err_gpio_register;
-- 
2.4.3

