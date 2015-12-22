From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 45/54 v2] mfd: asic3: Be sure to clamp return value
Date: Wed, 23 Dec 2015 00:05:36 +0100
Message-ID: <1450825536-8830-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:33957 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932485AbbLVXFq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 18:05:46 -0500
Received: by mail-lb0-f169.google.com with SMTP id pv2so52643452lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 15:05:45 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Paul Parsons <lost.distance@yahoo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Paul Parsons <lost.distance@yahoo.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2: fixed a compilation issue, I was hammering
to much on parentheses sorry.
---
 drivers/mfd/asic3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
index a726f01e3b02..927e2c2a9a39 100644
--- a/drivers/mfd/asic3.c
+++ b/drivers/mfd/asic3.c
@@ -502,7 +502,8 @@ static int asic3_gpio_get(struct gpio_chip *chip,
 		return -EINVAL;
 	}
 
-	return asic3_read_register(asic, gpio_base + ASIC3_GPIO_STATUS) & mask;
+	return !!(asic3_read_register(asic, gpio_base + ASIC3_GPIO_STATUS)
+		  & mask);
 }
 
 static void asic3_gpio_set(struct gpio_chip *chip,
-- 
2.4.3

