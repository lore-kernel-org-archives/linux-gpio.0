From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 19/54] gpio: twl4030: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:24:03 +0100
Message-ID: <1450794243-23310-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35677 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753443AbbLVOYJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:24:09 -0500
Received: by mail-lf0-f49.google.com with SMTP id l133so129721725lfd.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:24:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

This also makes the driver start to return the error code, as the
end of the series make this work.

Cc: Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-twl4030.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 14f40bf64e34..f5590514838a 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -327,7 +327,7 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
 	else
 		status = twl4030_get_gpio_datain(offset);
 
-	ret = (status <= 0) ? 0 : 1;
+	ret = (status < 0) ? status : !!status;
 out:
 	mutex_unlock(&priv->mutex);
 	return ret;
-- 
2.4.3

