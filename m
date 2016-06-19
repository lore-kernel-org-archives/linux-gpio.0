From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: lynxpoint: avoid potential warning on error path
Date: Sun, 19 Jun 2016 19:06:44 +0300
Message-ID: <1466352404-23685-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64755 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751279AbcFSQGt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 19 Jun 2016 12:06:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

When devres API is in use we are not supposed to call plain gpiochip_remove().
Remove redundant call to gpiochip_remove().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-lynxpoint.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 9df015e..fbd393b 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -383,7 +383,6 @@ static int lp_gpio_probe(struct platform_device *pdev)
 					   handle_simple_irq, IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(dev, "failed to add irqchip\n");
-			gpiochip_remove(gc);
 			return ret;
 		}
 
-- 
2.8.1

