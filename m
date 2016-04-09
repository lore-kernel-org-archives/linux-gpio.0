From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: menz127: use the new open drain callback
Date: Sat,  9 Apr 2016 21:56:55 +0200
Message-ID: <1460231815-8635-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33248 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097AbcDIT5H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2016 15:57:07 -0400
Received: by mail-lf0-f49.google.com with SMTP id e190so111492622lfe.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2016 12:57:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andreas Werner <andy@wernerandy.de>

The menz127 driver tries to support open drain by detecting it
at request time. However: without the new callbacks from the
gpiolib it is not really working: the core will still just emulate
the open drain mode by switching the line to an input.

By adding a hook into the new .set_single_ended() call rather than
trying to autodetect at request() time, proper open drain can be
supported.

Cc: Andreas Werner <andy@wernerandy.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-menz127.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index 8c1ab8e1974f..334fe270dcf1 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -88,21 +88,25 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 	return 0;
 }
 
-static int men_z127_request(struct gpio_chip *gc, unsigned gpio_pin)
+static int men_z127_set_single_ended(struct gpio_chip *gc,
+				     unsigned offset,
+				     enum single_ended_mode mode)
 {
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
 	u32 od_en;
 
-	if (gpio_pin >= gc->ngpio)
-		return -EINVAL;
+	if (mode != LINE_MODE_OPEN_DRAIN &&
+	    mode != LINE_MODE_PUSH_PULL)
+		return -ENOTSUPP;
 
 	spin_lock(&priv->lock);
 	od_en = readl(priv->reg_base + MEN_Z127_ODER);
 
-	if (gpiochip_line_is_open_drain(gc, gpio_pin))
-		od_en |= BIT(gpio_pin);
+	if (mode == LINE_MODE_OPEN_DRAIN)
+		od_en |= BIT(offset);
 	else
-		od_en &= ~BIT(gpio_pin);
+		/* Implicitly LINE_MODE_PUSH_PULL */
+		od_en &= ~BIT(offset);
 
 	writel(od_en, priv->reg_base + MEN_Z127_ODER);
 	spin_unlock(&priv->lock);
@@ -147,7 +151,7 @@ static int men_z127_probe(struct mcb_device *mdev,
 		goto err_unmap;
 
 	men_z127_gpio->gc.set_debounce = men_z127_debounce;
-	men_z127_gpio->gc.request = men_z127_request;
+	men_z127_gpio->gc.set_single_ended = men_z127_set_single_ended;
 
 	ret = gpiochip_add_data(&men_z127_gpio->gc, men_z127_gpio);
 	if (ret) {
-- 
2.4.3

