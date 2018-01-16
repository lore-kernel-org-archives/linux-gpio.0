From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: No NULL owner
Date: Tue, 16 Jan 2018 08:42:12 +0100
Message-ID: <20180116074212.4022-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:43166 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750738AbeAPHoU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 02:44:20 -0500
Received: by mail-lf0-f66.google.com with SMTP id o89so12068613lfg.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2018 23:44:20 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

Sometimes a GPIO is fetched with NULL as parent device, and
that is just fine. So under these circumstances, avoid using
dev_name() to provide a name for the GPIO line.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf083bc58d30..4092b8601c4e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3623,6 +3623,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 	struct gpio_desc *desc = NULL;
 	int status;
 	enum gpio_lookup_flags lookupflags = 0;
+	/* Maybe we have a device name, maybe not */
+	const char *devname = dev ? dev_name(dev) : "?";
 
 	dev_dbg(dev, "GPIO lookup for consumer %s\n", con_id);
 
@@ -3651,8 +3653,11 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 		return desc;
 	}
 
-	/* If a connection label was passed use that, else use the device name as label */
-	status = gpiod_request(desc, con_id ? con_id : dev_name(dev));
+	/*
+	 * If a connection label was passed use that, else attempt to use
+	 * the device name as label
+	 */
+	status = gpiod_request(desc, con_id ? con_id : devname);
 	if (status < 0)
 		return ERR_PTR(status);
 
-- 
2.14.3

