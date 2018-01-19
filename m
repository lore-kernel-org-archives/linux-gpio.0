From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 10/12] gpio: cs5535: Include proper header
Date: Fri, 19 Jan 2018 07:40:41 +0100
Message-ID: <20180119064043.18241-10-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34678 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754104AbeASGnV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:21 -0500
Received: by mail-lf0-f68.google.com with SMTP id k19so822952lfj.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:20 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-cs5535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 90278b19aa0e..8814c8f47e57 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -12,7 +12,7 @@
 #include <linux/spinlock.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/cs5535.h>
 #include <asm/msr.h>
-- 
2.14.3

