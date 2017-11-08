From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Fix undefined lock_dep_class
Date: Wed,  8 Nov 2017 21:42:36 +0100
Message-ID: <20171108204236.4493-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:48595 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751728AbdKHUol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2017 15:44:41 -0500
Received: by mail-lf0-f67.google.com with SMTP id r135so4686970lfe.5
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2017 12:44:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>

The struct is wrong, this is named lock_class_key.

Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 961b5da38bb9..86dcd02cf602 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1940,7 +1940,7 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
 static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
-				       struct lock_dep_class *lock_key)
+				       struct lock_class_key *key)
 {
 	return 0;
 }
-- 
2.13.6

