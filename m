From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 09/54] gpio: max732x: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:14:10 +0100
Message-ID: <1450793650-22300-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34879 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753860AbbLVOOO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:14:14 -0500
Received: by mail-lf0-f53.google.com with SMTP id l133so129549187lfd.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:14:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Marek Vasut <marex@denx.de>, Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nicholas Krause <xerofoify@gmail.com>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Also start to propagate the error code here as the end of the
series fixes this to work for all drivers.

Cc: Nicholas Krause <xerofoify@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Semen Protsenko <semen.protsenko@globallogic.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-max732x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index a1094984b666..880ce94e6077 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -207,9 +207,9 @@ static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 
 	ret = max732x_readb(chip, is_group_a(chip, off), &reg_val);
 	if (ret < 0)
-		return 0;
+		return ret;
 
-	return reg_val & (1u << (off & 0x7));
+	return !!(reg_val & (1u << (off & 0x7)));
 }
 
 static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
-- 
2.4.3

