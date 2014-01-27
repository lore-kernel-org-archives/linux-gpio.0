From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] gpio: gpiolib-of: Use PTR_ERR_OR_ZERO
Date: Mon, 27 Jan 2014 12:15:08 +0530
Message-ID: <1390805108-20766-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:35863 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753329AbaA0Gtq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jan 2014 01:49:46 -0500
Received: by mail-pd0-f175.google.com with SMTP id w10so5323972pde.6
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jan 2014 22:49:46 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, sachin.kamat@linaro.org, patches@linaro.org

PTR_RET is deprecated. Use PTR_ERR_OR_ZERO instead. While at it
also include missing err.h header.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpiolib-of.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e0a98f581f58..2024d45e5503 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/io.h>
@@ -90,7 +91,7 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 
 	of_node_put(gg_data.gpiospec.np);
 	pr_debug("%s exited with status %d\n", __func__,
-		 PTR_RET(gg_data.out_gpio));
+		 PTR_ERR_OR_ZERO(gg_data.out_gpio));
 	return gg_data.out_gpio;
 }
 EXPORT_SYMBOL(of_get_named_gpiod_flags);
-- 
1.7.9.5

