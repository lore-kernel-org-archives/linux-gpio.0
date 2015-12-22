From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 07/54] gpio: kempld: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:13:08 +0100
Message-ID: <1450793588-22180-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:32944 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754124AbbLVONN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:13:13 -0500
Received: by mail-lf0-f50.google.com with SMTP id p203so131439527lfa.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:13:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Brunner Michael <Michael.Brunner@kontron.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Brunner Michael <Michael.Brunner@kontron.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-kempld.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 35dd1e0af364..297f849af725 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -69,7 +69,7 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 		= container_of(chip, struct kempld_gpio_data, chip);
 	struct kempld_device_data *pld = gpio->pld;
 
-	return kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
+	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
 }
 
 static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

