From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 15/54] gpio: sa1100: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:21:42 +0100
Message-ID: <1450794102-23007-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:35272 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752431AbbLVOVs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:21:48 -0500
Received: by mail-lb0-f175.google.com with SMTP id bc4so31943302lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:21:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sa1100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 990fa9023e22..9d590166e952 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -17,7 +17,7 @@
 
 static int sa1100_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	return GPLR & GPIO_GPIO(offset);
+	return !!(GPLR & GPIO_GPIO(offset));
 }
 
 static void sa1100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

