From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 05/54] gpio: intel-mid: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:12:05 +0100
Message-ID: <1450793525-22057-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:33399 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041AbbLVOML (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:12:11 -0500
Received: by mail-lb0-f175.google.com with SMTP id sv6so24955074lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:12:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: David Cohen <david.a.cohen@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-intel-mid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 1c46a7ef2680..26d2083a5901 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -120,7 +120,7 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	void __iomem *gplr = gpio_reg(chip, offset, GPLR);
 
-	return readl(gplr) & BIT(offset % 32);
+	return !!(readl(gplr) & BIT(offset % 32));
 }
 
 static void intel_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

