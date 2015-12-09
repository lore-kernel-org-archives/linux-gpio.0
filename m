From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 182/182] gpio: remove non-parametrized register functions
Date: Wed,  9 Dec 2015 14:52:17 +0100
Message-ID: <1449669137-7414-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:35816 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754778AbbLINwW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:52:22 -0500
Received: by lbpu9 with SMTP id u9so30171161lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:52:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

This removes gpiochip_add() and of_mm_gpiochip_add() in favor
of the *_data() functions that also take a pointer to driver
state data. This way all new drivers will use the parametrized
interface.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/driver.h | 4 ----
 include/linux/of_gpio.h     | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3334ba66f6a8..0c40dc6c6b21 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -201,10 +201,6 @@ extern const char *gpiochip_is_requested(struct gpio_chip *chip,
 
 /* add/remove chips */
 extern int gpiochip_add_data(struct gpio_chip *chip, void *data);
-static inline int gpiochip_add(struct gpio_chip *chip)
-{
-	return gpiochip_add_data(chip, NULL);
-}
 extern void gpiochip_remove(struct gpio_chip *chip);
 extern struct gpio_chip *gpiochip_find(void *data,
 			      int (*match)(struct gpio_chip *chip, void *data));
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 54a23d6e4892..2204dc0e4493 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -54,11 +54,6 @@ extern int of_get_named_gpio_flags(struct device_node *np,
 extern int of_mm_gpiochip_add_data(struct device_node *np,
 				   struct of_mm_gpio_chip *mm_gc,
 				   void *data);
-static inline int of_mm_gpiochip_add(struct device_node *np,
-				     struct of_mm_gpio_chip *mm_gc)
-{
-	return of_mm_gpiochip_add_data(np, mm_gc, NULL);
-}
 extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 
 extern int of_gpiochip_add(struct gpio_chip *gc);
-- 
2.4.3

