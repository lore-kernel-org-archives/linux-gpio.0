From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 13/54] gpio: pcf857x: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:20:09 +0100
Message-ID: <1450794009-22885-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33357 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754395AbbLVOUO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:20:14 -0500
Received: by mail-lf0-f52.google.com with SMTP id p203so131562216lfa.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:20:13 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, George Cherian <george.cherian@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Also start returning the error code if something fails, as the
end of the series augment the core to support this.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: George Cherian <george.cherian@ti.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pcf857x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index bf511c0efa48..f64380a7d004 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -154,7 +154,7 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
 	int		value;
 
 	value = gpio->read(gpio->client);
-	return (value < 0) ? 0 : (value & (1 << offset));
+	return (value < 0) ? value : !!(value & (1 << offset));
 }
 
 static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

