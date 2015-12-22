From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 34/54] blackfin: gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:38:06 +0100
Message-ID: <1450795086-27238-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36244 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753770AbbLVOiN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:38:13 -0500
Received: by mail-lb0-f171.google.com with SMTP id oh2so32130514lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:38:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Sonic Zhang <sonic.zhang@analog.com>, Steven Miao <realmz6@gmail.com>
Cc: adi-buildroot-devel@lists.sourceforge.net, Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Sonic Zhang <sonic.zhang@analog.com>
Cc: Steven Miao <realmz6@gmail.com>
Cc: adi-buildroot-devel@lists.sourceforge.net
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Blackfin folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/blackfin/kernel/bfin_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/blackfin/kernel/bfin_gpio.c b/arch/blackfin/kernel/bfin_gpio.c
index a017359c1826..84baa6217c03 100644
--- a/arch/blackfin/kernel/bfin_gpio.c
+++ b/arch/blackfin/kernel/bfin_gpio.c
@@ -1159,7 +1159,7 @@ static int bfin_gpiolib_direction_output(struct gpio_chip *chip, unsigned gpio,
 
 static int bfin_gpiolib_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	return bfin_gpio_get_value(gpio);
+	return !!bfin_gpio_get_value(gpio);
 }
 
 static void bfin_gpiolib_set_value(struct gpio_chip *chip, unsigned gpio, int value)
-- 
2.4.3

