From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 02/54] gpio: davinci: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:10:27 +0100
Message-ID: <1450793427-21871-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35486 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751599AbbLVOKc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:10:32 -0500
Received: by mail-lb0-f181.google.com with SMTP id bc4so31771647lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:10:31 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 65ebaef935e1..1e3a617e0c10 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -125,7 +125,7 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct davinci_gpio_controller *d = chip2controller(chip);
 	struct davinci_gpio_regs __iomem *g = d->regs;
 
-	return (1 << offset) & readl_relaxed(&g->in_data);
+	return !!((1 << offset) & readl_relaxed(&g->in_data));
 }
 
 /*
-- 
2.4.3

