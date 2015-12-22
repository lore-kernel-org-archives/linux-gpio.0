From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 42/54] powerpc: qe_lib/gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:43:24 +0100
Message-ID: <1450795404-27707-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:32865 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752816AbbLVOn3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:43:29 -0500
Received: by mail-lb0-f180.google.com with SMTP id sv6so25432206lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:43:28 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Anatolij Gustschin <agust@denx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
POWERPC folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/powerpc/sysdev/qe_lib/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/qe_lib/gpio.c b/arch/powerpc/sysdev/qe_lib/gpio.c
index 521e67a49dc4..d950d409afde 100644
--- a/arch/powerpc/sysdev/qe_lib/gpio.c
+++ b/arch/powerpc/sysdev/qe_lib/gpio.c
@@ -63,7 +63,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
 
-	return in_be32(&regs->cpdata) & pin_mask;
+	return !!(in_be32(&regs->cpdata) & pin_mask);
 }
 
 static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-- 
2.4.3

