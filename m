From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 25/54] pinctrl: coh901: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:29:20 +0100
Message-ID: <1450794560-23709-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:33910 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932466AbbLVO3Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:29:24 -0500
Received: by mail-lf0-f44.google.com with SMTP id y184so130131967lfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:29:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-coh901.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index e1cbf56df4b2..ca0fa79a286c 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -221,7 +221,7 @@ static int u300_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct u300_gpio *gpio = to_u300_gpio(chip);
 
-	return readl(U300_PIN_REG(offset, dir)) & U300_PIN_BIT(offset);
+	return !!(readl(U300_PIN_REG(offset, dir)) & U300_PIN_BIT(offset));
 }
 
 static void u300_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

