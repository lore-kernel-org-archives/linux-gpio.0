From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 36/54] mips: alchemy: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:40:02 +0100
Message-ID: <1450795202-27345-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36150 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754057AbbLVOkN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:40:13 -0500
Received: by mail-lf0-f50.google.com with SMTP id z124so125677299lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:40:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
MIPS folks: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 arch/mips/alchemy/common/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index f9bc4f520440..84548f704035 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -40,7 +40,7 @@
 
 static int gpio2_get(struct gpio_chip *chip, unsigned offset)
 {
-	return alchemy_gpio2_get_value(offset + ALCHEMY_GPIO2_BASE);
+	return !!alchemy_gpio2_get_value(offset + ALCHEMY_GPIO2_BASE);
 }
 
 static void gpio2_set(struct gpio_chip *chip, unsigned offset, int value)
@@ -68,7 +68,7 @@ static int gpio2_to_irq(struct gpio_chip *chip, unsigned offset)
 
 static int gpio1_get(struct gpio_chip *chip, unsigned offset)
 {
-	return alchemy_gpio1_get_value(offset + ALCHEMY_GPIO1_BASE);
+	return !!alchemy_gpio1_get_value(offset + ALCHEMY_GPIO1_BASE);
 }
 
 static void gpio1_set(struct gpio_chip *chip,
@@ -119,7 +119,7 @@ struct gpio_chip alchemy_gpio_chip[] = {
 
 static int alchemy_gpic_get(struct gpio_chip *chip, unsigned int off)
 {
-	return au1300_gpio_get_value(off + AU1300_GPIO_BASE);
+	return !!au1300_gpio_get_value(off + AU1300_GPIO_BASE);
 }
 
 static void alchemy_gpic_set(struct gpio_chip *chip, unsigned int off, int v)
-- 
2.4.3

