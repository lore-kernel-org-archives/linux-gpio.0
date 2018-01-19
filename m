From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 03/12] gpio: adp5588: Include proper header
Date: Fri, 19 Jan 2018 07:40:34 +0100
Message-ID: <20180119064043.18241-3-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:42422 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753773AbeASGnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:06 -0500
Received: by mail-lf0-f66.google.com with SMTP id q17so804721lfa.9
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:05 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adp5588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index e717f8dc3966..3530ccd17e04 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -12,7 +12,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
-- 
2.14.3

