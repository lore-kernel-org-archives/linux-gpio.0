From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/12] gpio: arizona: Include proper header
Date: Fri, 19 Jan 2018 07:40:37 +0100
Message-ID: <20180119064043.18241-6-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:39985 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753773AbeASGnM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:12 -0500
Received: by mail-lf0-f68.google.com with SMTP id h92so804559lfi.7
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:11 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-arizona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index d4e6ba0301bc..ba51ea15f379 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -15,7 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
-- 
2.14.3

