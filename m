From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 41/54] powerpc: ppc4cc/gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:42:58 +0100
Message-ID: <1450795378-27657-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36617 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752855AbbLVOnK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:43:10 -0500
Received: by mail-lf0-f42.google.com with SMTP id z124so125729021lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:43:10 -0800 (PST)
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
 arch/powerpc/sysdev/ppc4xx_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_gpio.c b/arch/powerpc/sysdev/ppc4xx_gpio.c
index fc65ad1b3293..d7a7ef135b9f 100644
--- a/arch/powerpc/sysdev/ppc4xx_gpio.c
+++ b/arch/powerpc/sysdev/ppc4xx_gpio.c
@@ -78,7 +78,7 @@ static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
 
-	return in_be32(&regs->ir) & GPIO_MASK(gpio);
+	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
 }
 
 static inline void
-- 
2.4.3

