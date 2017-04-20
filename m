From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH] gpio: export add/remove lookup table functions
Date: Thu, 20 Apr 2017 23:23:20 +0200
Message-ID: <1492723400-16657-1-git-send-email-agust@denx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:40351 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S939831AbdDTVXY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2017 17:23:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

For hot-pluggable devices adding GPIOs dynamically we need to
assemble and add the gpio lookup tables at probe time in modules,
so that requesting these GPIOs in attached drivers can work.
Export lookup table functions for modules.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4aa1e78..9196b1e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3008,6 +3008,7 @@ void gpiod_add_lookup_table(struct gpiod_lookup_table *table)
 
 	mutex_unlock(&gpio_lookup_lock);
 }
+EXPORT_SYMBOL_GPL(gpiod_add_lookup_table);
 
 /**
  * gpiod_remove_lookup_table() - unregister GPIO device consumers
@@ -3021,6 +3022,7 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 
 	mutex_unlock(&gpio_lookup_lock);
 }
+EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
 
 static struct gpiod_lookup_table *gpiod_find_lookup_table(struct device *dev)
 {
-- 
2.7.4

