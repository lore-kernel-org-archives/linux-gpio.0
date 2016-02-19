From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tps65218: remove unused #include
Date: Fri, 19 Feb 2016 09:23:47 +0100
Message-ID: <1455870227-3159-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:33104 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426938AbcBSIXw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 03:23:52 -0500
Received: by mail-lb0-f179.google.com with SMTP id x4so43248772lbm.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 00:23:52 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Just as it says: after adding the proper interfaces to gpiolib,
this is no longer needed.

Suggested-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65218.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 2fc7e16aee0c..313c0e484607 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -17,7 +17,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/tps65218.h>
-#include "gpiolib.h"
 
 struct tps65218_gpio {
 	struct tps65218 *tps65218;
-- 
2.4.3

