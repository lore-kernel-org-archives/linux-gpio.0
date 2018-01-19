From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 02/12] gpio: adp5520: Include proper header
Date: Fri, 19 Jan 2018 07:40:33 +0100
Message-ID: <20180119064043.18241-2-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33077 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753773AbeASGnE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:04 -0500
Received: by mail-lf0-f67.google.com with SMTP id t139so821074lff.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:03 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adp5520.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index abf199609546..21452622d954 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -12,8 +12,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/adp5520.h>
-
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 struct adp5520_gpio {
 	struct device *master;
-- 
2.14.3

