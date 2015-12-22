From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 22/54] gpio: ucb1400: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:27:54 +0100
Message-ID: <1450794474-23525-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:36809 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932294AbbLVO16 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:27:58 -0500
Received: by mail-lb0-f178.google.com with SMTP id oh2so31973942lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:27:58 -0800 (PST)
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
 drivers/gpio/gpio-ucb1400.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index d502825159b9..cca78fb9b0df 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -33,7 +33,7 @@ static int ucb1400_gpio_get(struct gpio_chip *gc, unsigned off)
 {
 	struct ucb1400_gpio *gpio;
 	gpio = container_of(gc, struct ucb1400_gpio, gc);
-	return ucb1400_gpio_get_value(gpio->ac97, off);
+	return !!ucb1400_gpio_get_value(gpio->ac97, off);
 }
 
 static void ucb1400_gpio_set(struct gpio_chip *gc, unsigned off, int val)
-- 
2.4.3

