From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 04/19] pinctrl: imx25: make it explicitly non-modular
Date: Sat, 25 Jun 2016 22:46:37 -0400
Message-ID: <20160626024652.5081-5-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:64806 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690AbcFZCrY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jun 2016 22:47:24 -0400
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Denis Carikli <denis@eukrea.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX25
drivers/pinctrl/freescale/Kconfig:        bool "IMX25 pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this driver, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Denis Carikli <denis@eukrea.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-imx25.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx25.c b/drivers/pinctrl/freescale/pinctrl-imx25.c
index 81ad546d74bb..d7367fabe712 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx25.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx25.c
@@ -18,7 +18,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -338,12 +337,3 @@ static int __init imx25_pinctrl_init(void)
 	return platform_driver_register(&imx25_pinctrl_driver);
 }
 arch_initcall(imx25_pinctrl_init);
-
-static void __exit imx25_pinctrl_exit(void)
-{
-	platform_driver_unregister(&imx25_pinctrl_driver);
-}
-module_exit(imx25_pinctrl_exit);
-MODULE_AUTHOR("Denis Carikli <denis@eukrea.com>");
-MODULE_DESCRIPTION("Freescale IMX25 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4

