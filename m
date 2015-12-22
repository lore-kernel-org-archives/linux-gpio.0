From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 50/54] mfd: ucb1x00-core: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:48:33 +0100
Message-ID: <1450795713-28414-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34078 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752665AbbLVOsh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:48:37 -0500
Received: by mail-lb0-f173.google.com with SMTP id pv2so46343379lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:48:37 -0800 (PST)
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
 drivers/mfd/ucb1x00-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
index a6ec7cc0fac6..bcafe1ecd71c 100644
--- a/drivers/mfd/ucb1x00-core.c
+++ b/drivers/mfd/ucb1x00-core.c
@@ -133,7 +133,7 @@ static int ucb1x00_gpio_get(struct gpio_chip *chip, unsigned offset)
 	val = ucb1x00_reg_read(ucb, UCB_IO_DATA);
 	ucb1x00_disable(ucb);
 
-	return val & (1 << offset);
+	return !!(val & (1 << offset));
 }
 
 static int ucb1x00_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-- 
2.4.3

