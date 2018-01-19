From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 05/12] gpio: amd8111: Include proper header
Date: Fri, 19 Jan 2018 07:40:36 +0100
Message-ID: <20180119064043.18241-5-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39979 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753773AbeASGnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:10 -0500
Received: by mail-lf0-f65.google.com with SMTP id h92so804502lfi.7
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:09 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This driver has no business including <linux/gpio.h>, it is a
driver so include <linux/gpio/driver.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-amd8111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 30ad7d7c1678..fdcebe59510d 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -28,7 +28,7 @@
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/pci.h>
 #include <linux/spinlock.h>
 
-- 
2.14.3

