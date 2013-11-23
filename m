From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] gpiolib: fix lookup of platform-mapped GPIOs
Date: Sat, 23 Nov 2013 14:55:52 +0900
Message-ID: <1385186152-29188-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gnurou.org ([207.192.72.5]:40446 "EHLO mail.gnurou.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751304Ab3KWF5K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 23 Nov 2013 00:57:10 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

A typo resulted in GPIO lookup failing unconditionally.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reported-by: Stephen Warren <swarren@wwwdotorg.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 980b08d..86caf17 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2367,7 +2367,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 				continue;
 			}
 
-			if (chip->ngpio >= p->chip_hwnum) {
+			if (chip->ngpio <= p->chip_hwnum) {
 				dev_warn(dev, "GPIO chip %s has %d GPIOs\n",
 					 chip->label, chip->ngpio);
 				continue;
-- 
1.8.4.2

