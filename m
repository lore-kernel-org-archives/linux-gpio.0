From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 12/54] gpio: msic: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:19:30 +0100
Message-ID: <1450793970-22801-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:35335 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754395AbbLVOTf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:19:35 -0500
Received: by mail-lb0-f176.google.com with SMTP id bc4so31909946lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:19:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-msic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index fe9ef2bc981a..9a261acb0eed 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -143,7 +143,7 @@ static int msic_gpio_get(struct gpio_chip *chip, unsigned offset)
 	if (ret < 0)
 		return ret;
 
-	return r & MSIC_GPIO_DIN_MASK;
+	return !!(r & MSIC_GPIO_DIN_MASK);
 }
 
 static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.4.3

