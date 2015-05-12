From: Johan Hovold <johan@kernel.org>
Subject: [PATCH] gpio: dln2: fix build breakage
Date: Tue, 12 May 2015 15:20:25 +0200
Message-ID: <1431436825-31612-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34178 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932707AbbELNUt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 09:20:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, kbuild test robot <fengguang.wu@intel.com>, kbuild-all@01.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>

The dln2 driver was initialising a gpiolib private field, which is now
gone.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpio-dln2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index dbdb4de82c6d..6685712c15cf 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -466,7 +466,6 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 	dln2->gpio.owner = THIS_MODULE;
 	dln2->gpio.base = -1;
 	dln2->gpio.ngpio = pins;
-	dln2->gpio.exported = true;
 	dln2->gpio.can_sleep = true;
 	dln2->gpio.irq_not_threaded = true;
 	dln2->gpio.set = dln2_gpio_set;
-- 
2.3.6

