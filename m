From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 08/12] gpio: bt8xx: Include proper header
Date: Fri, 19 Jan 2018 07:40:39 +0100
Message-ID: <20180119064043.18241-8-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:38966 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754104AbeASGnQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:16 -0500
Received: by mail-lf0-f68.google.com with SMTP id m8so803945lfc.6
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:16 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-bt8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index acefb25e8eca..b8ec75cbd4b5 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -46,7 +46,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/spinlock.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/slab.h>
 
 /* Steal the hardware definitions from the bttv driver. */
-- 
2.14.3

