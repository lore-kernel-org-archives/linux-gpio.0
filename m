From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 35/54] m68k: coldfire/gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:39:05 +0100
Message-ID: <1450795145-27292-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:34075 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753977AbbLVOjM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:39:12 -0500
Received: by mail-lb0-f180.google.com with SMTP id pv2so46202546lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:39:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
M68K folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/m68k/coldfire/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
index e7e428681ec5..37a83e27c7a6 100644
--- a/arch/m68k/coldfire/gpio.c
+++ b/arch/m68k/coldfire/gpio.c
@@ -121,7 +121,7 @@ static int mcfgpio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int mcfgpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
-	return __mcfgpio_get_value(offset);
+	return !!__mcfgpio_get_value(offset);
 }
 
 static int mcfgpio_direction_output(struct gpio_chip *chip, unsigned offset,
-- 
2.4.3

