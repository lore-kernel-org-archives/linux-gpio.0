From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/6] drivers/gpio: make gpio-sx150x.c explicitly non-modular
Date: Fri, 1 Apr 2016 14:49:35 -0400
Message-ID: <1459536578-3017-4-git-send-email-paul.gortmaker@windriver.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Gregory Bean <gbean@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_SX150X
drivers/gpio/Kconfig:   bool "Semtech SX150x I2C GPIO expander"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Gregory Bean <gbean@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-sx150x.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index d387eb524bf3..d57e8ad0bfd2 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -1,5 +1,9 @@
 /* Copyright (c) 2010, Code Aurora Forum. All rights reserved.
  *
+ * Driver for Semtech SX150X I2C GPIO Expanders
+ *
+ * Author: Gregory Bean <gbean@codeaurora.org>
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 and
  * only version 2 as published by the Free Software Foundation.
@@ -19,7 +23,6 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/i2c/sx150x.h>
@@ -718,13 +721,3 @@ static int __init sx150x_init(void)
 	return i2c_add_driver(&sx150x_driver);
 }
 subsys_initcall(sx150x_init);
-
-static void __exit sx150x_exit(void)
-{
-	return i2c_del_driver(&sx150x_driver);
-}
-module_exit(sx150x_exit);
-
-MODULE_AUTHOR("Gregory Bean <gbean@codeaurora.org>");
-MODULE_DESCRIPTION("Driver for Semtech SX150X I2C GPIO Expanders");
-MODULE_LICENSE("GPL v2");
-- 
2.6.1
