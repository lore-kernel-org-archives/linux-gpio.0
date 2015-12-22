From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 01/54] gpio: da9052: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:09:31 +0100
Message-ID: <1450793371-21804-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34321 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752088AbbLVOJh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:09:37 -0500
Received: by mail-lf0-f45.google.com with SMTP id y184so129788348lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:09:37 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Ashish Jangam <ashish.jangam@kpitcummins.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Ashish Jangam <ashish.jangam@kpitcummins.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-da9052.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
index 2e9578ec0ca1..38bd8f122bfc 100644
--- a/drivers/gpio/gpio-da9052.c
+++ b/drivers/gpio/gpio-da9052.c
@@ -89,15 +89,12 @@ static int da9052_gpio_get(struct gpio_chip *gc, unsigned offset)
 					      DA9052_STATUS_D_REG);
 		if (ret < 0)
 			return ret;
-		if (ret & (1 << DA9052_GPIO_SHIFT_COUNT(offset)))
-			return 1;
-		else
-			return 0;
+		return !!(ret & (1 << DA9052_GPIO_SHIFT_COUNT(offset)));
 	case DA9052_OUTPUT_PUSHPULL:
 		if (da9052_gpio_port_odd(offset))
-			return ret & DA9052_GPIO_ODD_PORT_MODE;
+			return !!(ret & DA9052_GPIO_ODD_PORT_MODE);
 		else
-			return ret & DA9052_GPIO_EVEN_PORT_MODE;
+			return !!(ret & DA9052_GPIO_EVEN_PORT_MODE);
 	default:
 		return -EINVAL;
 	}
-- 
2.4.3

