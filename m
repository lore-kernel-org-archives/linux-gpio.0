From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/6] gpio: remember to finally free gpio_device
Date: Thu, 11 Feb 2016 11:26:18 +0100
Message-ID: <1455186383-28004-2-git-send-email-linus.walleij@linaro.org>
References: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36383 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbcBKK0f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 05:26:35 -0500
Received: by mail-wm0-f51.google.com with SMTP id p63so66003166wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 02:26:34 -0800 (PST)
In-Reply-To: <1455186383-28004-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

When the device core reference count for the device goes to
0 and it calls .release() we free resources and so can also
finally free up the GPIO state container, struct gpio_device.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 70e0fff0a8a7..36f8be3f910b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -405,6 +405,7 @@ static void gpiodevice_release(struct device *dev)
 	cdev_del(&gdev->chrdev);
 	list_del(&gdev->list);
 	ida_simple_remove(&gpio_ida, gdev->id);
+	kfree(gdev);
 }
 
 /**
-- 
2.4.3

