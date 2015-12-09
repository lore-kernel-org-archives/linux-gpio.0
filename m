From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 092/182] pinctrl: bcm2835: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:30:36 +0100
Message-ID: <1449667836-1932-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35736 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754416AbbLINak (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:30:40 -0500
Received: by lfdl133 with SMTP id l133so34085065lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:30:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Eric Anholt <eric@anholt.net>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Eric Anholt <eric@anholt.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 0bc1abcedbae..52c15234eb09 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -23,7 +23,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -337,7 +337,7 @@ static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int bcm2835_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->parent);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 
 	return bcm2835_gpio_get_bit(pc, GPLEV0, offset);
 }
@@ -350,14 +350,14 @@ static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
 
 static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->parent);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 
 	bcm2835_gpio_set_bit(pc, value ? GPSET0 : GPCLR0, offset);
 }
 
 static int bcm2835_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->parent);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 
 	return irq_linear_revmap(pc->irq_domain, offset);
 }
@@ -1020,7 +1020,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = gpiochip_add(&pc->gpio_chip);
+	err = gpiochip_add_data(&pc->gpio_chip, pc);
 	if (err) {
 		dev_err(dev, "could not add GPIO chip\n");
 		return err;
-- 
2.4.3

