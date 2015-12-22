From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 48/54] mfd: tc6393xb: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:47:55 +0100
Message-ID: <1450795675-28314-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:35437 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932660AbbLVOsA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:48:00 -0500
Received: by mail-lb0-f179.google.com with SMTP id bc4so32337597lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:47:59 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Baryshkov <dbaryshkov@gmail.com>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 drivers/mfd/tc6393xb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
index 8c84a513016b..1ecbfa40d1b3 100644
--- a/drivers/mfd/tc6393xb.c
+++ b/drivers/mfd/tc6393xb.c
@@ -437,8 +437,8 @@ static int tc6393xb_gpio_get(struct gpio_chip *chip,
 	struct tc6393xb *tc6393xb = container_of(chip, struct tc6393xb, gpio);
 
 	/* XXX: does dsr also represent inputs? */
-	return tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8))
-		& TC_GPIO_BIT(offset);
+	return !!(tmio_ioread8(tc6393xb->scr + SCR_GPO_DSR(offset / 8))
+		  & TC_GPIO_BIT(offset));
 }
 
 static void __tc6393xb_gpio_set(struct gpio_chip *chip,
-- 
2.4.3

