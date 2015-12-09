From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 055/182] gpio: rdc321x: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:22:15 +0100
Message-ID: <1449667335-32388-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36349 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754284AbbLINWU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:22:20 -0500
Received: by lfs39 with SMTP id 39so34253889lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:22:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-rdc321x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index d729bc8a554d..96ddee3f464a 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -47,7 +47,7 @@ static int rdc_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	u32 value = 0;
 	int reg;
 
-	gpch = container_of(chip, struct rdc321x_gpio, chip);
+	gpch = gpiochip_get_data(chip);
 	reg = gpio < 32 ? gpch->reg1_data_base : gpch->reg2_data_base;
 
 	spin_lock(&gpch->lock);
@@ -65,7 +65,7 @@ static void rdc_gpio_set_value_impl(struct gpio_chip *chip,
 	struct rdc321x_gpio *gpch;
 	int reg = (gpio < 32) ? 0 : 1;
 
-	gpch = container_of(chip, struct rdc321x_gpio, chip);
+	gpch = gpiochip_get_data(chip);
 
 	if (value)
 		gpch->data_reg[reg] |= 1 << (gpio & 0x1f);
@@ -83,7 +83,7 @@ static void rdc_gpio_set_value(struct gpio_chip *chip,
 {
 	struct rdc321x_gpio *gpch;
 
-	gpch = container_of(chip, struct rdc321x_gpio, chip);
+	gpch = gpiochip_get_data(chip);
 	spin_lock(&gpch->lock);
 	rdc_gpio_set_value_impl(chip, gpio, value);
 	spin_unlock(&gpch->lock);
@@ -96,7 +96,7 @@ static int rdc_gpio_config(struct gpio_chip *chip,
 	int err;
 	u32 reg;
 
-	gpch = container_of(chip, struct rdc321x_gpio, chip);
+	gpch = gpiochip_get_data(chip);
 
 	spin_lock(&gpch->lock);
 	err = pci_read_config_dword(gpch->sb_pdev, gpio < 32 ?
@@ -194,7 +194,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "registering %d GPIOs\n",
 					rdc321x_gpio_dev->chip.ngpio);
-	return gpiochip_add(&rdc321x_gpio_dev->chip);
+	return gpiochip_add_data(&rdc321x_gpio_dev->chip, rdc321x_gpio_dev);
 }
 
 static int rdc321x_gpio_remove(struct platform_device *pdev)
-- 
2.4.3

