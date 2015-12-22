From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 14/54] gpio: pch: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:20:54 +0100
Message-ID: <1450794054-22948-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:34920 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754612AbbLVOU7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:20:59 -0500
Received: by mail-lb0-f169.google.com with SMTP id bc4so31930834lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:20:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Thierry Reding <treding@nvidia.com>
Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>
Cc: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index af0715f8524b..8c45b74dcf21 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -127,7 +127,7 @@ static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
 	struct pch_gpio *chip =	container_of(gpio, struct pch_gpio, gpio);
 
-	return ioread32(&chip->reg->pi) & (1 << nr);
+	return !!(ioread32(&chip->reg->pi) & (1 << nr));
 }
 
 static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
-- 
2.4.3

