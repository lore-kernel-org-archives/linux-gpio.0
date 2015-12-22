From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 16/54] gpio: sta2x11: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:22:35 +0100
Message-ID: <1450794155-23122-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:32858 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752037AbbLVOWk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:22:40 -0500
Received: by mail-lb0-f173.google.com with SMTP id sv6so25114780lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:22:40 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Alessandro Rubini <rubini@gnudd.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-sta2x11.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index 55e47828ddfc..af0be81ad2b6 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -90,7 +90,7 @@ static int gsta_gpio_get(struct gpio_chip *gpio, unsigned nr)
 	struct gsta_regs __iomem *regs = __regs(chip, nr);
 	u32 bit = __bit(nr);
 
-	return readl(&regs->dat) & bit;
+	return !!(readl(&regs->dat) & bit);
 }
 
 static int gsta_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
-- 
2.4.3

