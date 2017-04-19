From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] pinctrl: make artpec6 explicitly non-modular
Date: Wed, 19 Apr 2017 15:59:05 -0400
Message-ID: <20170419195905.9937-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:37138 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935514AbdDSUBz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Apr 2017 16:01:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/Kconfig:config PINCTRL_ARTPEC6
drivers/pinctrl/Kconfig:        bool "Axis ARTPEC-6 pin controller driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Lars Persson <lars.persson@axis.com>
Cc: Niklas Cassel <niklas.cassel@axis.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@axis.com
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-artpec6.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index b5a2eff7ae3d..2886e77fbcf0 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -979,14 +978,3 @@ static int __init artpec6_pmx_init(void)
 	return platform_driver_register(&artpec6_pmx_driver);
 }
 arch_initcall(artpec6_pmx_init);
-
-static void __exit artpec6_pmx_exit(void)
-{
-	platform_driver_unregister(&artpec6_pmx_driver);
-}
-module_exit(artpec6_pmx_exit);
-
-MODULE_AUTHOR("Chris Paterson <chris.paterson@linux.pieboy.co.uk>");
-MODULE_DESCRIPTION("Axis ARTPEC-6 pin control driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, artpec6_pinctrl_match);
-- 
2.11.0

