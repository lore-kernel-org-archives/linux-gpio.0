From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/6] gpio: reference count the gpio device for each desc
Date: Thu, 11 Feb 2016 11:26:22 +0100
Message-ID: <1455186383-28004-6-git-send-email-linus.walleij@linaro.org>
References: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:34385 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbcBKK0p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:26:45 -0500
Received: by mail-wm0-f42.google.com with SMTP id 128so14686171wmz.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:26:45 -0800 (PST)
In-Reply-To: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

Every time a descriptor is retrieved from the gpiolib, we issue
module_get() to reference count the module supplying the GPIOs.
We also need to call device_get() and device_put() as we also
reference the backing gpio_device when doing this.

Since the sysfs GPIO interface is using gpiod_get() this will
also reference count the sysfs requests until all GPIOs are
unexported.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cbc9c764a7fb..157ab40d19b1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1205,6 +1205,8 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 		status = __gpiod_request(desc, label);
 		if (status < 0)
 			module_put(gdev->owner);
+		else
+			get_device(&gdev->dev);
 	}
 
 	if (status)
@@ -1248,10 +1250,12 @@ static bool __gpiod_free(struct gpio_desc *desc)
 
 void gpiod_free(struct gpio_desc *desc)
 {
-	if (desc && __gpiod_free(desc))
+	if (desc && desc->gdev && __gpiod_free(desc)) {
 		module_put(desc->gdev->owner);
-	else
+		put_device(&desc->gdev->dev);
+	} else {
 		WARN_ON(extra_checks);
+	}
 }
 
 /**
-- 
2.4.3

