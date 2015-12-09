From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 067/182] gpio: timberdale: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:23:45 +0100
Message-ID: <1449667425-518-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35522 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753331AbbLINXu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:23:50 -0500
Received: by lbpu9 with SMTP id u9so29686308lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:23:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-timberdale.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index dda8f21811eb..a6de10c5275b 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -53,7 +53,7 @@ struct timbgpio {
 static int timbgpio_update_bit(struct gpio_chip *gpio, unsigned index,
 	unsigned offset, bool enabled)
 {
-	struct timbgpio *tgpio = container_of(gpio, struct timbgpio, gpio);
+	struct timbgpio *tgpio = gpiochip_get_data(gpio);
 	u32 reg;
 
 	spin_lock(&tgpio->lock);
@@ -77,7 +77,7 @@ static int timbgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 
 static int timbgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
-	struct timbgpio *tgpio = container_of(gpio, struct timbgpio, gpio);
+	struct timbgpio *tgpio = gpiochip_get_data(gpio);
 	u32 value;
 
 	value = ioread32(tgpio->membase + TGPIOVAL);
@@ -98,7 +98,7 @@ static void timbgpio_gpio_set(struct gpio_chip *gpio,
 
 static int timbgpio_to_irq(struct gpio_chip *gpio, unsigned offset)
 {
-	struct timbgpio *tgpio = container_of(gpio, struct timbgpio, gpio);
+	struct timbgpio *tgpio = gpiochip_get_data(gpio);
 
 	if (tgpio->irq_base <= 0)
 		return -EINVAL;
@@ -279,7 +279,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->ngpio = pdata->nr_pins;
 	gc->can_sleep = false;
 
-	err = gpiochip_add(gc);
+	err = gpiochip_add_data(gc, tgpio);
 	if (err)
 		return err;
 
-- 
2.4.3

