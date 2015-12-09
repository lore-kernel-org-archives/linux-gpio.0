From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 019/182] gpio: cs5535: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:15:20 +0100
Message-ID: <1449666920-30643-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36732 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbbLINPZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:15:25 -0500
Received: by lfs39 with SMTP id 39so34119074lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:15:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Fabian Frederick <fabf@skynet.be>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Fabian Frederick <fabf@skynet.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-cs5535.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 7b0b198a563d..eccb712e09fb 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -42,6 +42,10 @@ static ulong mask = GPIO_DEFAULT_MASK;
 module_param_named(mask, mask, ulong, 0444);
 MODULE_PARM_DESC(mask, "GPIO channel mask.");
 
+/*
+ * FIXME: convert this singleton driver to use the state container
+ * design pattern, see Documentation/driver-model/design-patterns.txt
+ */
 static struct cs5535_gpio_chip {
 	struct gpio_chip chip;
 	resource_size_t base;
@@ -201,8 +205,7 @@ EXPORT_SYMBOL_GPL(cs5535_gpio_setup_event);
 
 static int chip_gpio_request(struct gpio_chip *c, unsigned offset)
 {
-	struct cs5535_gpio_chip *chip =
-		container_of(c, struct cs5535_gpio_chip, chip);
+	struct cs5535_gpio_chip *chip = gpiochip_get_data(c);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -242,8 +245,7 @@ static void chip_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 
 static int chip_direction_input(struct gpio_chip *c, unsigned offset)
 {
-	struct cs5535_gpio_chip *chip =
-		container_of(c, struct cs5535_gpio_chip, chip);
+	struct cs5535_gpio_chip *chip = gpiochip_get_data(c);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -256,8 +258,7 @@ static int chip_direction_input(struct gpio_chip *c, unsigned offset)
 
 static int chip_direction_output(struct gpio_chip *c, unsigned offset, int val)
 {
-	struct cs5535_gpio_chip *chip =
-		container_of(c, struct cs5535_gpio_chip, chip);
+	struct cs5535_gpio_chip *chip = gpiochip_get_data(c);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -347,7 +348,7 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
 				mask_orig, mask);
 
 	/* finally, register with the generic GPIO API */
-	err = gpiochip_add(&cs5535_gpio_chip.chip);
+	err = gpiochip_add_data(&cs5535_gpio_chip.chip, &cs5535_gpio_chip);
 	if (err)
 		goto done;
 
-- 
2.4.3

