From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/6] drivers/gpio: make gpio-tps65910.c explicitly non-modular
Date: Fri, 1 Apr 2016 14:49:37 -0400
Message-ID: <1459536578-3017-6-git-send-email-paul.gortmaker@windriver.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:44482 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753177AbcDASuD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 1 Apr 2016 14:50:03 -0400
In-Reply-To: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Graeme Gregory <gg@slimlogic.co.uk>, Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_TPS65910
drivers/gpio/Kconfig:   bool "TPS65910 GPIO"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Graeme Gregory <gg@slimlogic.co.uk>
Cc: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-tps65910.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index cdbd7c740043..0ae6a5a54ea8 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -4,7 +4,7 @@
  * Copyright 2010 Texas Instruments Inc.
  *
  * Author: Graeme Gregory <gg@slimlogic.co.uk>
- * Author: Jorge Eduardo Candelaria jedu@slimlogic.co.uk>
+ * Author: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
  *
  *  This program is free software; you can redistribute it and/or modify it
  *  under  the terms of the GNU General  Public License as published by the
@@ -14,7 +14,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
@@ -193,15 +193,3 @@ static int __init tps65910_gpio_init(void)
 	return platform_driver_register(&tps65910_gpio_driver);
 }
 subsys_initcall(tps65910_gpio_init);
-
-static void __exit tps65910_gpio_exit(void)
-{
-	platform_driver_unregister(&tps65910_gpio_driver);
-}
-module_exit(tps65910_gpio_exit);
-
-MODULE_AUTHOR("Graeme Gregory <gg@slimlogic.co.uk>");
-MODULE_AUTHOR("Jorge Eduardo Candelaria jedu@slimlogic.co.uk>");
-MODULE_DESCRIPTION("GPIO interface for TPS65910/TPS6511 PMICs");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:tps65910-gpio");
-- 
2.6.1

