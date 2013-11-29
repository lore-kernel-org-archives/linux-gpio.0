From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCHv2] gpiolib: change a warning to debug message when failing to get gpio
Date: Fri, 29 Nov 2013 15:47:34 +0200
Message-ID: <1385732854-9667-1-git-send-email-heikki.krogerus@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:59498 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752545Ab3K2Nrg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 08:47:36 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

It's the drivers responsibility to react on failure to get
the gpio descriptors and not the frameworks. Since there are
some common peripherals that may or may not have certain
pins connected to gpio lines, depending on the platform,
printing the warning there may end up generating useless bug
reports.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ac53a95..297318f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2437,7 +2437,7 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	}
 
 	if (IS_ERR(desc)) {
-		dev_warn(dev, "lookup for GPIO %s failed\n", con_id);
+		dev_dbg(dev, "lookup for GPIO %s failed\n", con_id);
 		return desc;
 	}
 
-- 
1.8.4.4

