From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 19/63] gpio vf610: Explicitly include pinctrl consumer header
Date: Fri, 26 Feb 2016 14:17:28 +0100
Message-ID: <1456492692-21592-20-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:59047 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753978AbcBZNSX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:18:23 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

If !PINCTRL this header is not included in linux/pinctrl/devinfo.h leading
to this error:
error: implicit declaration of function 'pinctrl_gpio_direction_input'

Adding the missing header fixes this.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/gpio-vf610.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 6284bdbe1e0c..af4ab289ca05 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -28,6 +28,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
 
 #define VF610_GPIO_PER_PORT		32
 
-- 
2.7.2

