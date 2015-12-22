From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 37/54] mips: ar7/gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:40:27 +0100
Message-ID: <1450795227-27411-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:34656 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932547AbbLVOkc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:40:32 -0500
Received: by mail-lb0-f182.google.com with SMTP id pv2so46223003lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:40:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alban Bedel <albeu@free.fr>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: linux-mips@linux-mips.org
Cc: Alban Bedel <albeu@free.fr>
Cc: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/mips/ar7/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ar7/gpio.c b/arch/mips/ar7/gpio.c
index f4930456eb8e..f969f583c68c 100644
--- a/arch/mips/ar7/gpio.c
+++ b/arch/mips/ar7/gpio.c
@@ -37,7 +37,7 @@ static int ar7_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 				container_of(chip, struct ar7_gpio_chip, chip);
 	void __iomem *gpio_in = gpch->regs + AR7_GPIO_INPUT;
 
-	return readl(gpio_in) & (1 << gpio);
+	return !!(readl(gpio_in) & (1 << gpio));
 }
 
 static int titan_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
-- 
2.4.3

