From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 45/54] mfd: asic3: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:47:05 +0100
Message-ID: <1450795625-28120-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:34491 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932243AbbLVOrK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:47:10 -0500
Received: by mail-lb0-f169.google.com with SMTP id pv2so46322182lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:47:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Parsons <lost.distance@yahoo.com>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Paul Parsons <lost.distance@yahoo.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 drivers/mfd/asic3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
index a726f01e3b02..58c4d9cb8e8d 100644
--- a/drivers/mfd/asic3.c
+++ b/drivers/mfd/asic3.c
@@ -502,7 +502,8 @@ static int asic3_gpio_get(struct gpio_chip *chip,
 		return -EINVAL;
 	}
 
-	return asic3_read_register(asic, gpio_base + ASIC3_GPIO_STATUS) & mask;
+	return !!(asic3_read_register(asic, gpio_base + ASIC3_GPIO_STATUS)
+		  & mask));
 }
 
 static void asic3_gpio_set(struct gpio_chip *chip,
-- 
2.4.3

