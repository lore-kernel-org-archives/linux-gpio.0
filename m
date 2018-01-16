From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: of: Fix NPE from OF flags
Date: Tue, 16 Jan 2018 23:48:54 +0100
Message-ID: <20180116224854.22470-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:42008 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbeAPWvB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 17:51:01 -0500
Received: by mail-lf0-f67.google.com with SMTP id q17so9257273lfa.9
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 14:51:00 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Clemens Gruber <clemens.gruber@pqgruber.com>, Lukas Wunner <lukas@wunner.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>

Some calls to of_get_named_gpio() calls sets the flags
argument to NULL because they are not interested in the
flags. This caused a null pointer exception since we were
unconditionally using these flags. Fix it.

Fixes: 6a537d48461d ("gpio: of: Support regulator nonstandard GPIO properties")
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Reported-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 71ba008b7f46..27e8a339310c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -129,7 +129,8 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 	if (IS_ERR(desc))
 		goto out;
 
-	of_gpio_flags_quirks(np, flags);
+	if (flags)
+		of_gpio_flags_quirks(np, flags);
 
 	pr_debug("%s: parsed '%s' property of node '%pOF[%d]' - status (%d)\n",
 		 __func__, propname, np, index,
-- 
2.14.3

