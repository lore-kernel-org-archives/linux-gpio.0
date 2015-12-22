From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 20/54] gpio: tz1090: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:24:26 +0100
Message-ID: <1450794266-23370-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34553 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753443AbbLVOYb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:24:31 -0500
Received: by mail-lf0-f48.google.com with SMTP id y184so130047557lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:24:31 -0800 (PST)
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
 drivers/gpio/gpio-tz1090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index 79ef6e1ce568..a4a822542ac1 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -214,7 +214,7 @@ static int tz1090_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tz1090_gpio_bank *bank = to_bank(chip);
 
-	return tz1090_gpio_read_bit(bank, REG_GPIO_DIN, offset);
+	return !!tz1090_gpio_read_bit(bank, REG_GPIO_DIN, offset);
 }
 
 /*
-- 
2.4.3

