From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 17/54] gpio: sx150x: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:23:00 +0100
Message-ID: <1450794180-23186-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:34020 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754630AbbLVOXF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:23:05 -0500
Received: by mail-lb0-f182.google.com with SMTP id pv2so45954691lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:23:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Wei Chen <Wei.Chen@csr.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

This also starts to propagate the error code from the I2C
transaction as the end of the series adds support for that.

Cc: Wei Chen <Wei.Chen@csr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 2d882964b309..04d4f2c2928a 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -344,7 +344,7 @@ static int sx150x_gpio_get(struct gpio_chip *gc, unsigned offset)
 		mutex_unlock(&chip->lock);
 	}
 
-	return status;
+	return (status < 0) ? status : !!status;
 }
 
 static void sx150x_gpio_set(struct gpio_chip *gc, unsigned offset, int val)
-- 
2.4.3

