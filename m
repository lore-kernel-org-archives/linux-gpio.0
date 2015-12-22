From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 18/54] gpio: tc3589x: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:23:22 +0100
Message-ID: <1450794202-23248-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34192 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754321AbbLVOX1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:23:27 -0500
Received: by mail-lb0-f174.google.com with SMTP id pv2so45960784lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:23:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 7c1537ed6dff..2896aef5aec4 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -51,7 +51,7 @@ static int tc3589x_gpio_get(struct gpio_chip *chip, unsigned offset)
 	if (ret < 0)
 		return ret;
 
-	return ret & mask;
+	return !!(ret & mask);
 }
 
 static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
-- 
2.4.3

