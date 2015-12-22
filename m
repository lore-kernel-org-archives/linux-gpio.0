From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 31/54] pinctrl: sunxi: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:32:41 +0100
Message-ID: <1450794761-24377-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36459 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180AbbLVOcp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:32:45 -0500
Received: by mail-lf0-f41.google.com with SMTP id z124so125547172lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:32:45 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index a437e4f8628b..c53a2dbdb5cf 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -469,7 +469,7 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	if (set_mux)
 		sunxi_pmx_set(pctl->pctl_dev, offset, SUN4I_FUNC_IRQ);
 
-	return val;
+	return !!val;
 }
 
 static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
-- 
2.4.3

