From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 46/54] mfd: dm355evm_mps: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:47:13 +0100
Message-ID: <1450795633-28167-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34802 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932243AbbLVOrT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:47:19 -0500
Received: by mail-lf0-f46.google.com with SMTP id y184so130444737lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:47:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 drivers/mfd/dm355evm_msp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index bc90efe01b59..ec4438ed2faf 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -147,7 +147,7 @@ static int msp_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return status;
 	if (reg == DM355EVM_MSP_LED)
 		msp_led_cache = status;
-	return status & MSP_GPIO_MASK(offset);
+	return !!(status & MSP_GPIO_MASK(offset));
 }
 
 static int msp_gpio_out(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

