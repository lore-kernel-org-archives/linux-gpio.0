From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 10/54] gpio: ml-ioh: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:14:47 +0100
Message-ID: <1450793687-22370-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34524 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753802AbbLVOOv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:14:51 -0500
Received: by mail-lb0-f175.google.com with SMTP id pv2so45829469lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:14:51 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Feng Tang <feng.tang@intel.com>, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Feng Tang <feng.tang@intel.com>
Cc: Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ml-ioh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 5536108aa9db..7ef704343f05 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -124,7 +124,7 @@ static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
 	struct ioh_gpio *chip =	container_of(gpio, struct ioh_gpio, gpio);
 
-	return ioread32(&chip->reg->regs[chip->ch].pi) & (1 << nr);
+	return !!(ioread32(&chip->reg->regs[chip->ch].pi) & (1 << nr));
 }
 
 static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
-- 
2.4.3

