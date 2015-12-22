From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 44/54] unicore: gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:44:53 +0100
Message-ID: <1450795493-27900-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36507 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752917AbbLVOo7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:44:59 -0500
Received: by mail-lf0-f52.google.com with SMTP id z124so125760729lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:44:59 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
For unicore32: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/unicore32/kernel/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/unicore32/kernel/gpio.c b/arch/unicore32/kernel/gpio.c
index cb12ec39552c..5ab23794ea17 100644
--- a/arch/unicore32/kernel/gpio.c
+++ b/arch/unicore32/kernel/gpio.c
@@ -52,7 +52,7 @@ device_initcall(puv3_gpio_leds_init);
 
 static int puv3_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	return readl(GPIO_GPLR) & GPIO_GPIO(offset);
+	return !!(readl(GPIO_GPLR) & GPIO_GPIO(offset));
 }
 
 static void puv3_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

