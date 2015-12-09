From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 119/182] pinctrl: at91-pio4: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:34:03 +0100
Message-ID: <1449668043-3438-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36625 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754149AbbLINeH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:34:07 -0500
Received: by lfs39 with SMTP id 39so34484338lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:34:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ludovic Desroches <ludovic.desroches@atmel.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index f1daf8580167..27540f5a1067 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -15,6 +15,8 @@
  */
 
 #include <linux/clk.h>
+#include <linux/gpio/driver.h>
+/* FIXME: needed for gpio_to_irq(), get rid of this */
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -290,7 +292,7 @@ static void atmel_gpio_irq_handler(struct irq_desc *desc)
 
 static int atmel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct atmel_pioctrl *atmel_pioctrl = dev_get_drvdata(chip->parent);
+	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
 	unsigned reg;
 
@@ -305,7 +307,7 @@ static int atmel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int atmel_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct atmel_pioctrl *atmel_pioctrl = dev_get_drvdata(chip->parent);
+	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
 	unsigned reg;
 
@@ -317,7 +319,7 @@ static int atmel_gpio_get(struct gpio_chip *chip, unsigned offset)
 static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				       int value)
 {
-	struct atmel_pioctrl *atmel_pioctrl = dev_get_drvdata(chip->parent);
+	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
 	unsigned reg;
 
@@ -336,7 +338,7 @@ static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static void atmel_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
-	struct atmel_pioctrl *atmel_pioctrl = dev_get_drvdata(chip->parent);
+	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
 
 	atmel_gpio_write(atmel_pioctrl, pin->bank,
@@ -346,7 +348,7 @@ static void atmel_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 
 static int atmel_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct atmel_pioctrl *atmel_pioctrl = dev_get_drvdata(chip->parent);
+	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 
 	return irq_find_mapping(atmel_pioctrl->irq_domain, offset);
 }
@@ -1037,7 +1039,7 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 		goto pinctrl_register_error;
 	}
 
-	ret = gpiochip_add(atmel_pioctrl->gpio_chip);
+	ret = gpiochip_add_data(atmel_pioctrl->gpio_chip, atmel_pioctrl);
 	if (ret) {
 		dev_err(dev, "failed to add gpiochip\n");
 		goto gpiochip_add_error;
-- 
2.4.3

