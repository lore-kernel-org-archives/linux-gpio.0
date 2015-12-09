From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 120/182] pinctrl: xway: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:34:10 +0100
Message-ID: <1449668050-3485-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35715 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754193AbbLINeU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:34:20 -0500
Received: by lfdl133 with SMTP id l133so34157786lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:34:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pramod Gurav <pramod.gurav@smartplayin.com>, John Crispin <blogic@openwrt.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This driver looks a bit weird: it is registering the gpiochip
before the pin controller, yet depend on resolving the pin controller
state from the gpiochip callbacks. This patch means no semantic
change but please look to see if you can register the gpiochip
after the pin controller instead, if you have time.
---
 drivers/pinctrl/pinctrl-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index b4380fb72001..e92aa05a741b 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -648,7 +648,7 @@ static struct ltq_pinmux_info xway_info = {
 /* ---------  gpio_chip related code --------- */
 static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 {
-	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
+	struct ltq_pinmux_info *info = gpiochip_get_data(chip);
 
 	if (val)
 		gpio_setbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
@@ -658,14 +658,14 @@ static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 
 static int xway_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
-	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
+	struct ltq_pinmux_info *info = gpiochip_get_data(chip);
 
 	return gpio_getbit(info->membase[0], GPIO_IN(pin), PORT_PIN(pin));
 }
 
 static int xway_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 {
-	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
+	struct ltq_pinmux_info *info = gpiochip_get_data(chip);
 
 	gpio_clearbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
 
@@ -674,7 +674,7 @@ static int xway_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 
 static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 {
-	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
+	struct ltq_pinmux_info *info = gpiochip_get_data(chip);
 
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
 	xway_gpio_set(chip, pin, val);
@@ -784,7 +784,7 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 
 	/* load the gpio chip */
 	xway_chip.parent = &pdev->dev;
-	ret = gpiochip_add(&xway_chip);
+	ret = gpiochip_add_data(&xway_chip, &xway_info);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register gpio chip\n");
 		return ret;
-- 
2.4.3

