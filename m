From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: lp87565: Set proper output level and direction for direction_output
Date: Thu, 22 Jun 2017 17:28:21 +0800
Message-ID: <20170622092821.5508-1-axel.lin@ingics.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36488 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751143AbdFVJ2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jun 2017 05:28:34 -0400
Received: by mail-pf0-f193.google.com with SMTP id y7so2050169pfd.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2017 02:28:33 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>, linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

The value argument of lp87565_gpio_direction_output() means output level
rather than gpio direction.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Keerthy,
I don't have this h/w, so please help to review and test it.
Thanks,
Axel
 drivers/gpio/gpio-lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index 6313c50..69b69d4 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -54,9 +54,12 @@ static int lp87565_gpio_direction_output(struct gpio_chip *chip,
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
 
+	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
+			   BIT(offset), value ? BIT(offset) : 0);
+
 	return regmap_update_bits(gpio->map,
 				  LP87565_REG_GPIO_CONFIG,
-				  BIT(offset), !value ? BIT(offset) : 0);
+				  BIT(offset), BIT(offset));
 }
 
 static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
-- 
2.9.3

