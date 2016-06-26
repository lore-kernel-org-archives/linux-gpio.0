From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 12/19] pinctrl: imx6sl: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:45 -0400
Message-ID: <20160626024652.5081-13-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:40566 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751898AbcFZCrb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2016 22:47:31 -0400
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX6SL
drivers/pinctrl/freescale/Kconfig:	bool "IMX6SL pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this driver, the init ordering
remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx6sl.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx6sl.c b/drivers/pinctrl/freescale/pinctrl-imx6sl.c
index bf455b8e73fc..d023f6b00623 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx6sl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx6sl.c
@@ -1,4 +1,7 @@
 /*
+ * Freescale imx6sl pinctrl driver
+ *
+ * Author: Shawn Guo <shawn.guo@linaro.org>
  * Copyright (C) 2013 Freescale Semiconductor, Inc.
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
@@ -371,7 +373,6 @@ static const struct of_device_id imx6sl_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx6sl-iomuxc", },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, imx6sl_pinctrl_of_match);
 
 static int imx6sl_pinctrl_probe(struct platform_device *pdev)
 {
@@ -391,13 +392,3 @@ static int __init imx6sl_pinctrl_init(void)
 	return platform_driver_register(&imx6sl_pinctrl_driver);
 }
 arch_initcall(imx6sl_pinctrl_init);
-
-static void __exit imx6sl_pinctrl_exit(void)
-{
-	platform_driver_unregister(&imx6sl_pinctrl_driver);
-}
-module_exit(imx6sl_pinctrl_exit);
-
-MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
-MODULE_DESCRIPTION("Freescale imx6sl pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4

