From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] gpio: lpc32xx: Include linux/of.h header
Date: Wed, 16 Oct 2013 15:35:01 +0530
Message-ID: <1381917902-6829-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:60366 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760236Ab3JPKFu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2013 06:05:50 -0400
Received: by mail-pa0-f50.google.com with SMTP id fa1so804671pad.37
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2013 03:05:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

'of_match_ptr' is defined in linux/of.h. Include it explicitly to
avoid build breakage in the future.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-lpc32xx.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 90a80eb..2d5555d 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/errno.h>
 #include <linux/gpio.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-- 
1.7.9.5

