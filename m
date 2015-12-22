From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 23/54] gpio: viperboard: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:28:15 +0100
Message-ID: <1450794495-23585-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35720 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932797AbbLVO2U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:28:20 -0500
Received: by mail-lf0-f50.google.com with SMTP id l133so129794523lfd.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:28:20 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Lars Poeschel <poeschel@lemonage.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Lars Poeschel <poeschel@lemonage.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-viperboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 26e7edb74f42..7667e77dd52e 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -95,7 +95,7 @@ static int vprbrd_gpioa_get(struct gpio_chip *chip,
 
 	/* if io is set to output, just return the saved value */
 	if (gpio->gpioa_out & (1 << offset))
-		return gpio->gpioa_val & (1 << offset);
+		return !!(gpio->gpioa_val & (1 << offset));
 
 	mutex_lock(&vb->lock);
 
-- 
2.4.3

