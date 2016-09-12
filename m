From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/8] gpio: ts4800: fix implicit assumption module.h is present
Date: Mon, 12 Sep 2016 18:16:26 -0400
Message-ID: <20160912221631.15812-4-paul.gortmaker@windriver.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:37611 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755575AbcILWQw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 18:16:52 -0400
In-Reply-To: <20160912221631.15812-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The Kconfig for this file is:

drivers/gpio/Kconfig:config GPIO_TS4800
drivers/gpio/Kconfig: tristate "TS-4800 DIO blocks and compatibles"

...but however it does not include module.h -- it in turn gets it from
another header (gpio/driver.h) and we'd like to replace that with a
forward delcaration of "struct module;" but if we do, this file will
fail to compile.

So we fix this first to avoid putting build failures into the bisect
commit history.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-ts4800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 0c144a72f9af..99256115bea5 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-- 
2.8.4

