From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 38/54] mips: txx9: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:41:01 +0100
Message-ID: <1450795261-27465-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:32826 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752413AbbLVOlG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:41:06 -0500
Received: by mail-lb0-f172.google.com with SMTP id sv6so25395819lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:41:05 -0800 (PST)
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
 arch/mips/kernel/gpio_txx9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/gpio_txx9.c b/arch/mips/kernel/gpio_txx9.c
index c6854d9df926..705be43c3533 100644
--- a/arch/mips/kernel/gpio_txx9.c
+++ b/arch/mips/kernel/gpio_txx9.c
@@ -21,7 +21,7 @@ static struct txx9_pio_reg __iomem *txx9_pioptr;
 
 static int txx9_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	return __raw_readl(&txx9_pioptr->din) & (1 << offset);
+	return !!(__raw_readl(&txx9_pioptr->din) & (1 << offset));
 }
 
 static void txx9_gpio_set_raw(unsigned int offset, int value)
-- 
2.4.3

