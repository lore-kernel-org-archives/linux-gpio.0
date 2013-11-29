From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] gpiolib: don't bother warning when failing to get gpios
Date: Fri, 29 Nov 2013 11:16:06 +0200
Message-ID: <1385716566-9810-1-git-send-email-heikki.krogerus@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:8723 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751128Ab3K2JQR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 04:16:17 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

It's the drivers responsibility to react on failure to get
the gpio descriptors and not the frameworks. Since there are
some common peripherals that may or may not have certain
pins connected to gpio lines, depending on the platform,
printing the warning there may end up generating useless bug
reports.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4e10b10..2f0305e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2434,10 +2434,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 		desc = gpiod_find(dev, con_id, idx, &flags);
 	}
 
-	if (IS_ERR(desc)) {
-		dev_warn(dev, "lookup for GPIO %s failed\n", con_id);
+	if (IS_ERR(desc))
 		return desc;
-	}
 
 	status = gpiod_request(desc, con_id);
 
-- 
1.8.4.4

