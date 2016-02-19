From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: Propagate all errors in devm_get_gpiod_from_child()
Date: Fri, 19 Feb 2016 10:55:13 +0100
Message-ID: <1455875713-4553-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:35123 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426202AbcBSJzP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 04:55:15 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

devm_get_gpiod_from_child() tries several property suffixes to find a
GPIO descriptor. If all suffixes fail and no probe deferral has been
detected, it returns the error of the last try.

However, if any but the last try fails with a real error (e.g. -EBUSY),
this error is not propagated, and -ENOENT will be returned.
This confuses drivers that e.g. want to detect if a GPIO is already in
use.

To fix this, change the loop logic to continue on -ENOENT, which
indicates the property was not found and the next suffix should be
tried, and propagate all other detected errors.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index 903fcf4d04a06e55..b760cbbb41d82490 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -155,7 +155,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 							       suffixes[i]);
 
 		desc = fwnode_get_named_gpiod(child, prop_name);
-		if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
+		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
 			break;
 	}
 	if (IS_ERR(desc)) {
-- 
1.9.1

