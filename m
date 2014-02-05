From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: generic: clamp retured value to [0,1]
Date: Wed,  5 Feb 2014 14:14:13 +0100
Message-ID: <1391606053-12422-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:41185 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbaBENOW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 08:14:22 -0500
Received: by mail-we0-f171.google.com with SMTP id u56so276866wes.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 05:14:21 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Evgeny Boger <boger@contactless.ru>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

The generic GPIO would return 0 for low generic GPIO, and
something != 0 for high GPIO. Let's make this sane by clamping
the returned value to [0,1].

Reported-by: Evgeny Boger <boger@contactless.ru>
Cc: Alexandre Courbot <gnurou@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index d2196bf73847..de397823617e 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -139,7 +139,7 @@ static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct bgpio_chip *bgc = to_bgpio_chip(gc);
 
-	return bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio);
+	return !!(bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio));
 }
 
 static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-- 
1.8.5.3

