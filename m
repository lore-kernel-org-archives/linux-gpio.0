From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpiolib: of: remove gpio_to_desc() usage
Date: Tue, 22 Apr 2014 14:43:41 +0200
Message-ID: <1398170621-2685-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:62306 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932152AbaDVMnr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 08:43:47 -0400
Received: by mail-wg0-f49.google.com with SMTP id a1so3897670wgh.20
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 05:43:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

As demonstrated by commit
390d82e312c56b75407a3606cbcde8c4bc7f10ae
"gpiolib: ACPI: remove gpio_to_desc() usage"

gpio_to_desc() must die. Replace one of its usage by the
newly-introduced gpiochip_get_desc() function.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2024d45e5503..db98d3a12f70 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -48,7 +48,7 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
 	if (ret < 0)
 		return false;
 
-	gg_data->out_gpio = gpio_to_desc(ret + gc->base);
+	gg_data->out_gpio = gpiochip_get_desc(gc, ret);
 	return true;
 }
 
-- 
1.9.0

