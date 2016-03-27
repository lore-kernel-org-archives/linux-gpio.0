From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 6/9] drivers/gpio: make gpio-pl061.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:46 -0400
Message-ID: <1459093489-18314-7-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:43676 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752972AbcC0PpW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 27 Mar 2016 11:45:22 -0400
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Baruch Siach <baruch@tkos.co.il>, linux-gpio@vger.kernel.org

The Kconfig for this driver is currently:

config GPIO_PL061
        bool "PrimeCell PL061 GPIO support"

...meaning that it currently is not being built as a module by anyone.
Lets remove the couple traces of modularity, so that when reading the
driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-pl061.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 5cb38212bbc0..9afb415a5d24 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -1,6 +1,8 @@
 /*
  * Copyright (C) 2008, 2009 Provigent Ltd.
  *
+ * Author: Baruch Siach <baruch@tkos.co.il>
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -11,7 +13,7 @@
  */
 #include <linux/spinlock.h>
 #include <linux/errno.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/interrupt.h>
@@ -429,8 +431,6 @@ static struct amba_id pl061_ids[] = {
 	{ 0, 0 },
 };
 
-MODULE_DEVICE_TABLE(amba, pl061_ids);
-
 static struct amba_driver pl061_gpio_driver = {
 	.drv = {
 		.name	= "pl061_gpio",
@@ -446,8 +446,4 @@ static int __init pl061_gpio_init(void)
 {
 	return amba_driver_register(&pl061_gpio_driver);
 }
-module_init(pl061_gpio_init);
-
-MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
-MODULE_DESCRIPTION("PL061 GPIO driver");
-MODULE_LICENSE("GPL");
+device_initcall(pl061_gpio_init);
-- 
2.6.1

