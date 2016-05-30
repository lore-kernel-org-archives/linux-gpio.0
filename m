From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: drop lock before reading GPIO direction
Date: Mon, 30 May 2016 17:14:22 +0200
Message-ID: <1464621262-32689-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34904 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736AbcE3PO1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2016 11:14:27 -0400
Received: by mail-lf0-f50.google.com with SMTP id w16so61767962lfd.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2016 08:14:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

When adding the gpiochip, the GPIO HW drivers' callback get_direction()
could get called in atomic context. Some of the GPIO HW drivers may
sleep when accessing the register.

Move the lock before initializing the descriptors.

Reported-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 246b6b051b0d..24f60d28f0c0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -629,6 +629,8 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		goto err_free_label;
 	}
 
+	spin_unlock_irqrestore(&gpio_lock, flags);
+
 	for (i = 0; i < chip->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
 
@@ -660,8 +662,6 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		}
 	}
 
-	spin_unlock_irqrestore(&gpio_lock, flags);
-
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
-- 
2.4.11

