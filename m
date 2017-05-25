From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Re-use bitmap_fill() instead of open coded loop
Date: Thu, 25 May 2017 16:08:38 +0300
Message-ID: <20170525130838.58877-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:9631 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1765878AbdEYNJM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 May 2017 09:09:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Re-use bitmap_fill() instead of open coded loop for setting an area of
bits in a bitmap.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9b6dca947ab3..34c6e38911a7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1,4 +1,4 @@
-#include <linux/bitops.h>
+#include <linux/bitmap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -1482,8 +1482,7 @@ static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 		return -ENOMEM;
 
 	/* Assume by default all GPIOs are valid */
-	for (i = 0; i < gpiochip->ngpio; i++)
-		set_bit(i, gpiochip->irq_valid_mask);
+	bitmap_fill(gpiochip->irq_valid_mask, gpiochip->ngpio);
 
 	return 0;
 }
-- 
2.11.0

