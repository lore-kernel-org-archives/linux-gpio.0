From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 26/54] pinctrl: xway: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:29:58 +0100
Message-ID: <1450794598-23771-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:35728 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932139AbbLVOaE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:30:04 -0500
Received: by mail-lb0-f172.google.com with SMTP id bc4so32066021lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:30:03 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: John Crispin <blogic@openwrt.org>, Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: John Crispin <blogic@openwrt.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-xway.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index e56222eac96c..ebd867f50700 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -660,7 +660,7 @@ static int xway_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
 
-	return gpio_getbit(info->membase[0], GPIO_IN(pin), PORT_PIN(pin));
+	return !!gpio_getbit(info->membase[0], GPIO_IN(pin), PORT_PIN(pin));
 }
 
 static int xway_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
-- 
2.4.3

