From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 47/54] mfd: htc-egpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:47:39 +0100
Message-ID: <1450795659-28262-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:33702 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932663AbbLVOro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:47:44 -0500
Received: by mail-lb0-f176.google.com with SMTP id sv6so25495767lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:47:43 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <philipp.zabel@gmail.com>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 drivers/mfd/htc-egpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
index d334e7d8a77d..c636b5f83cfb 100644
--- a/drivers/mfd/htc-egpio.c
+++ b/drivers/mfd/htc-egpio.c
@@ -163,7 +163,7 @@ static int egpio_get(struct gpio_chip *chip, unsigned offset)
 	value = egpio_readw(ei, reg);
 	pr_debug("readw(%p + %x) = %x\n",
 			ei->base_addr, reg << ei->bus_shift, value);
-	return value & bit;
+	return !!(value & bit);
 }
 
 static int egpio_direction_input(struct gpio_chip *chip, unsigned offset)
-- 
2.4.3

