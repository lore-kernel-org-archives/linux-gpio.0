From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/4] gpio: mxc: drop unused MODULE_ tags from non-modular code
Date: Mon, 22 Aug 2016 12:48:31 -0400
Message-ID: <20160822164833.3633-3-paul.gortmaker@windriver.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@caiaq.de>, Juergen Beisert <kernel@pengutronix.de>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_MXC
drivers/gpio/Kconfig:   def_bool y

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.
Note the original e-mail had a missing/typo'd @ symbol anyway.

We don't replace module.h with init.h since the file already has that.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Daniel Mack <daniel@caiaq.de>
Cc: Juergen Beisert <kernel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-mxc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1b342a3842c8..e35af5249478 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -2,7 +2,8 @@
  * MXC GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
  * Copyright 2008 Juergen Beisert, kernel@pengutronix.de
  *
- * Based on code from Freescale,
+ * Based on code from Freescale Semiconductor,
+ * Authors: Daniel Mack, Juergen Beisert.
  * Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
  *
  * This program is free software; you can redistribute it and/or
@@ -33,7 +34,6 @@
 #include <linux/gpio.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/module.h>
 #include <linux/bug.h>
 
 enum mxc_gpio_hwtype {
@@ -511,9 +511,3 @@ static int __init gpio_mxc_init(void)
 	return platform_driver_register(&mxc_gpio_driver);
 }
 postcore_initcall(gpio_mxc_init);
-
-MODULE_AUTHOR("Freescale Semiconductor, "
-	      "Daniel Mack <danielncaiaq.de>, "
-	      "Juergen Beisert <kernel@pengutronix.de>");
-MODULE_DESCRIPTION("Freescale MXC GPIO");
-MODULE_LICENSE("GPL");
-- 
2.8.4
