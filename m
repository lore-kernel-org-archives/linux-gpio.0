From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio/pinctrl: sunxi: stop poking around in private vars
Date: Thu, 11 Feb 2016 20:29:03 +0100
Message-ID: <1455218943-25917-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36214 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974AbcBKT3K (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 14:29:10 -0500
Received: by mail-lb0-f171.google.com with SMTP id tk3so21253966lbb.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 11:29:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>

This kind of hacks disturbs the refactoring of the gpiolib.

The descriptor table belongs to the gpiolib, if we want to know
something about something in it, use or define the proper accessor
functions. Let's add this gpiochip_lins_is_irq() to do what the
sunxi driver is trying at so we can privatize the descriptors
properly.

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c                | 9 +++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 4 ++--
 include/linux/gpio/driver.h           | 1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a60c6f28675e..aa4a60e19339 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1892,6 +1892,15 @@ void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 
+bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	if (offset >= chip->ngpio)
+		return false;
+
+	return test_bit(FLAG_USED_AS_IRQ, &chip->gpiodev->descs[offset].flags);
+}
+EXPORT_SYMBOL_GPL(gpiochip_line_is_irq);
+
 /**
  * gpiod_get_raw_value_cansleep() - return a gpio's raw value
  * @desc: gpio whose value will be returned
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 7a2465f5e71e..3e95bfe66a06 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -457,8 +457,8 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	u32 reg = sunxi_data_reg(offset);
 	u8 index = sunxi_data_offset(offset);
-	u32 set_mux = pctl->desc->irq_read_needs_mux &&
-			test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
+	bool set_mux = pctl->desc->irq_read_needs_mux &&
+		gpiochip_line_is_irq(chip, offset);
 	u32 val;
 
 	if (set_mux)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 363bf0eab6d0..b92ab9efdb69 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -197,6 +197,7 @@ extern struct gpio_chip *gpiochip_find(void *data,
 /* lock/unlock as IRQ */
 int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
+bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset);
 
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *chip);
-- 
2.4.3

