From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tps65912: fix bad merge
Date: Wed,  9 Mar 2016 22:04:41 +0700
Message-ID: <1457535881-17994-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:33811 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932979AbcCIPFC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 10:05:02 -0500
Received: by mail-pa0-f42.google.com with SMTP id fe3so25761333pab.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 07:05:02 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, "Andrew F. Davis" <afd@ti.com>

I screwed up while merging the immutable branch for TPS65912,
so fixing it unbroken again.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Andrew F. Davis <afd@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65912.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index e7886e712dc7..acfd30a13a56 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -117,8 +117,8 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
 	gpio->gpio_chip = template_chip;
 	gpio->gpio_chip.parent = tps->dev;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &tps65912_gpio->gpio_chip,
-				     tps65912_gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip,
+				     gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
-- 
2.4.3

