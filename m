From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 04/12] gpio: altera: Include GPIO driver header
Date: Fri, 19 Jan 2018 07:40:35 +0100
Message-ID: <20180119064043.18241-4-linus.walleij@linaro.org>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36032 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753773AbeASGnI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 01:43:08 -0500
Received: by mail-lf0-f66.google.com with SMTP id t79so820157lfe.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2018 22:43:07 -0800 (PST)
In-Reply-To: <20180119064043.18241-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

This is a GPIO driver so it should definately include
<linux/gpio/driver.h>. We want to get rid of <linux/of_gpio.h>
but that will take a bit longer.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 8e76d390e653..8c3ff6e2366f 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -18,7 +18,8 @@
 
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/of_gpio.h> /* For of_mm_gpio_chip */
 #include <linux/platform_device.h>
 
 #define ALTERA_GPIO_MAX_NGPIO		32
-- 
2.14.3

