From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 43/54] powerpc: simple_gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:43:43 +0100
Message-ID: <1450795423-27756-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34053 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752917AbbLVOnt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:43:49 -0500
Received: by mail-lb0-f175.google.com with SMTP id pv2so46271909lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:43:48 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Anton Vorontsov <anton@enomsg.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Anton Vorontsov <anton@enomsg.org>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
POWERPC folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/powerpc/sysdev/simple_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/simple_gpio.c b/arch/powerpc/sysdev/simple_gpio.c
index ff5e73230a36..56ce8ca3281b 100644
--- a/arch/powerpc/sysdev/simple_gpio.c
+++ b/arch/powerpc/sysdev/simple_gpio.c
@@ -46,7 +46,7 @@ static int u8_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 
-	return in_8(mm_gc->regs) & u8_pin2mask(gpio);
+	return !!(in_8(mm_gc->regs) & u8_pin2mask(gpio));
 }
 
 static void u8_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-- 
2.4.3

