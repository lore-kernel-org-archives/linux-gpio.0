From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 21/54] gpio: tx1090-pdc: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:27:24 +0100
Message-ID: <1450794444-23461-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35842 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932720AbbLVO13 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:27:29 -0500
Received: by mail-lf0-f45.google.com with SMTP id z124so125455938lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:27:29 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tz1090-pdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pdc.c
index 0a01c8736aff..b08b22b1b111 100644
--- a/drivers/gpio/gpio-tz1090-pdc.c
+++ b/drivers/gpio/gpio-tz1090-pdc.c
@@ -113,7 +113,7 @@ static int tz1090_pdc_gpio_direction_output(struct gpio_chip *chip,
 static int tz1090_pdc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tz1090_pdc_gpio *priv = to_pdc(chip);
-	return pdc_read(priv, REG_SOC_GPIO_STATUS) & BIT(offset);
+	return !!(pdc_read(priv, REG_SOC_GPIO_STATUS) & BIT(offset));
 }
 
 static void tz1090_pdc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.4.3

