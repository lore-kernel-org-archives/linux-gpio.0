From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: brcmstb: Do not use gc->pin2mask()
Date: Fri, 20 Oct 2017 15:48:17 +0200
Message-ID: <20171020134817.28040-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:47366 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751582AbdJTNuW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 09:50:22 -0400
Received: by mail-lf0-f65.google.com with SMTP id k40so13281245lfi.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 06:50:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>

The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
bit 15 or bit 31 or so.

The brcmstb only uses big endian BYTE ORDER which will be taken car of
by the ->write_reg() callback.

Just use BIT(offset) to assign the bit.

Cc: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-brcmstb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 27e92e57adae..9b8fcca7ad17 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -20,6 +20,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/interrupt.h>
 #include <linux/reboot.h>
+#include <linux/bitops.h>
 
 #define GIO_BANK_SIZE           0x20
 #define GIO_ODEN(bank)          (((bank) * GIO_BANK_SIZE) + 0x00)
@@ -68,16 +69,15 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 {
 	struct gpio_chip *gc = &bank->gc;
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = gc->pin2mask(gc, offset);
 	u32 imask;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 	imask = gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
 	if (enable)
-		imask |= mask;
+		imask |= BIT(offset);
 	else
-		imask &= ~mask;
+		imask &= ~BIT(offset);
 	gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
-- 
2.13.6

