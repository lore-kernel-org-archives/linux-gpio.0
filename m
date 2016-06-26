From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 06/19] pinctrl: imx35: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:39 -0400
Message-ID: <20160626024652.5081-7-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Dong Aisheng <dong.aisheng@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX35
drivers/pinctrl/freescale/Kconfig:	bool "IMX35 pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this driver, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Dong Aisheng <dong.aisheng@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx35.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx35.c b/drivers/pinctrl/freescale/pinctrl-imx35.c
index 13eb224a29a9..6315ba6af431 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx35.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx35.c
@@ -16,7 +16,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1028,12 +1027,3 @@ static int __init imx35_pinctrl_init(void)
 	return platform_driver_register(&imx35_pinctrl_driver);
 }
 arch_initcall(imx35_pinctrl_init);
-
-static void __exit imx35_pinctrl_exit(void)
-{
-	platform_driver_unregister(&imx35_pinctrl_driver);
-}
-module_exit(imx35_pinctrl_exit);
-MODULE_AUTHOR("Dong Aisheng <dong.aisheng@linaro.org>");
-MODULE_DESCRIPTION("Freescale IMX35 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4
