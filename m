From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 17/19] pinctrl: imx23: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:50 -0400
Message-ID: <20160626024652.5081-18-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX23
drivers/pinctrl/freescale/Kconfig:	bool

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_init wasn't actually used by this driver, the init
ordering remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx23.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx23.c b/drivers/pinctrl/freescale/pinctrl-imx23.c
index 955cbf4f094f..89b4f160138f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx23.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx23.c
@@ -1,4 +1,7 @@
 /*
+ * Freescale i.MX23 pinctrl driver
+ *
+ * Author: Shawn Guo <shawn.guo@linaro.org>
  * Copyright 2012 Freescale Semiconductor, Inc.
  *
  * The code contained herein is licensed under the GNU General Public
@@ -10,7 +13,6 @@
  */
 
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include "pinctrl-mxs.h"
@@ -276,15 +278,14 @@ static const struct of_device_id imx23_pinctrl_of_match[] = {
 	{ .compatible = "fsl,imx23-pinctrl", },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, imx23_pinctrl_of_match);
 
 static struct platform_driver imx23_pinctrl_driver = {
 	.driver = {
 		.name = "imx23-pinctrl",
+		.suppress_bind_attrs = true,
 		.of_match_table = imx23_pinctrl_of_match,
 	},
 	.probe = imx23_pinctrl_probe,
-	.remove = mxs_pinctrl_remove,
 };
 
 static int __init imx23_pinctrl_init(void)
@@ -292,13 +293,3 @@ static int __init imx23_pinctrl_init(void)
 	return platform_driver_register(&imx23_pinctrl_driver);
 }
 postcore_initcall(imx23_pinctrl_init);
-
-static void __exit imx23_pinctrl_exit(void)
-{
-	platform_driver_unregister(&imx23_pinctrl_driver);
-}
-module_exit(imx23_pinctrl_exit);
-
-MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
-MODULE_DESCRIPTION("Freescale i.MX23 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4
