From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 39/54] mips: rb532: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:41:19 +0100
Message-ID: <1450795279-27515-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:34001 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751696AbbLVOlY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:41:24 -0500
Received: by mail-lb0-f181.google.com with SMTP id pv2so46235550lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:41:24 -0800 (PST)
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
 arch/mips/rb532/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index 650d5d39f34d..fd1108543a71 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -89,7 +89,7 @@ static int rb532_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct rb532_gpio_chip	*gpch;
 
 	gpch = container_of(chip, struct rb532_gpio_chip, chip);
-	return rb532_get_bit(offset, gpch->regbase + GPIOD);
+	return !!rb532_get_bit(offset, gpch->regbase + GPIOD);
 }
 
 /*
-- 
2.4.3

