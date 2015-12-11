From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: generic: clamp values from bgpio_get_set()
Date: Fri, 11 Dec 2015 22:36:18 +0100
Message-ID: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33755 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058AbbLKVgX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 16:36:23 -0500
Received: by lbbkw15 with SMTP id kw15so77682013lbb.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 13:36:22 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel@pengutronix.de, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

The bgpio_get_set() call should return a value clamped to [0,1],
the current code will return a negative value if reading
bit 31, which turns the value negative as this is a signed value
and thus gets interpreted as an error by the gpiolib core.
Found on the gpio-mxc but applies to any MMIO driver.

Fixes: b19e7f51a55f "gpio: gpio-generic: add flag to read out output value from reg_set"
Cc: kernel@pengutronix.de
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Reported-by: Clemens Gruber <clemens.gruber@pqgruber.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 72088028d7a9..ea581dc23d44 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -141,9 +141,9 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
 	unsigned long pinmask = bgc->pin2mask(bgc, gpio);
 
 	if (bgc->dir & pinmask)
-		return bgc->read_reg(bgc->reg_set) & pinmask;
+		return !!(bgc->read_reg(bgc->reg_set) & pinmask);
 	else
-		return bgc->read_reg(bgc->reg_dat) & pinmask;
+		return !!(bgc->read_reg(bgc->reg_dat) & pinmask);
 }
 
 static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
-- 
2.4.3

