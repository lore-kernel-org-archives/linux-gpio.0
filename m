From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 07/19] pinctrl: imx50: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:40 -0400
Message-ID: <20160626024652.5081-8-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX50
drivers/pinctrl/freescale/Kconfig:	bool "IMX50 pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this driver, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx50.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx50.c b/drivers/pinctrl/freescale/pinctrl-imx50.c
index 95a36c88b66a..8e3a17df5c5d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx50.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx50.c
@@ -14,7 +14,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -415,11 +414,3 @@ static int __init imx50_pinctrl_init(void)
 	return platform_driver_register(&imx50_pinctrl_driver);
 }
 arch_initcall(imx50_pinctrl_init);
-
-static void __exit imx50_pinctrl_exit(void)
-{
-	platform_driver_unregister(&imx50_pinctrl_driver);
-}
-module_exit(imx50_pinctrl_exit);
-MODULE_DESCRIPTION("Freescale IMX50 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4
