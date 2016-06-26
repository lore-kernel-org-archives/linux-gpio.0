From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 13/19] pinctrl: imx6sx: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:46 -0400
Message-ID: <20160626024652.5081-14-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:64824 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871AbcFZCrk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2016 22:47:40 -0400
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Anson Huang <Anson.Huang@freescale.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX6SX
drivers/pinctrl/freescale/Kconfig:	bool "IMX6SX pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this driver, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Anson Huang <Anson.Huang@freescale.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx6sx.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sx.c b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
index 84118c388cc5..898b781701e6 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sx.c
@@ -1,4 +1,7 @@
 /*
+ * Freescale imx6sx pinctrl driver
+ *
+ * Author: Anson Huang <Anson.Huang@freescale.com>
  * Copyright (C) 2014 Freescale Semiconductor, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -9,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -394,13 +396,3 @@ static int __init imx6sx_pinctrl_init(void)
 	return platform_driver_register(&imx6sx_pinctrl_driver);
 }
 arch_initcall(imx6sx_pinctrl_init);
-
-static void __exit imx6sx_pinctrl_exit(void)
-{
-	platform_driver_unregister(&imx6sx_pinctrl_driver);
-}
-module_exit(imx6sx_pinctrl_exit);
-
-MODULE_AUTHOR("Anson Huang <Anson.Huang@freescale.com>");
-MODULE_DESCRIPTION("Freescale imx6sx pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4

