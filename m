From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/8] drivers/pinctrl: make sh-pfc/core.c explicitly non-modular
Date: Mon, 29 Feb 2016 15:48:40 -0500
Message-ID: <1456778924-20730-5-git-send-email-paul.gortmaker@windriver.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:48229 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754488AbcB2Ut1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 29 Feb 2016 15:49:27 -0500
In-Reply-To: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

The Kconfig / Makefile currently controlling compilation of this code is:

drivers/pinctrl/sh-pfc/Makefile:obj-$(CONFIG_PINCTRL_SH_PFC)    += sh-pfc.o
drivers/pinctrl/sh-pfc/Makefile:sh-pfc-objs                     = core.o pinctrl.o

drivers/pinctrl/sh-pfc/Kconfig:config PINCTRL_SH_PFC
drivers/pinctrl/sh-pfc/Kconfig: def_bool y

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init already wasn't being used in this code, the init
ordering remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/sh-pfc/core.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 181ea98a63b7..3f3f904e458b 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -1,5 +1,7 @@
 /*
- * SuperH Pin Function Controller support.
+ * Pin Control and GPIO driver for SuperH Pin Function Controller.
+ *
+ * Authors: Magnus Damm, Paul Mundt, Laurent Pinchart
  *
  * Copyright (C) 2008 Magnus Damm
  * Copyright (C) 2009 - 2012 Paul Mundt
@@ -17,7 +19,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/machine.h>
@@ -503,7 +505,6 @@ static const struct of_device_id sh_pfc_of_table[] = {
 #endif
 	{ },
 };
-MODULE_DEVICE_TABLE(of, sh_pfc_of_table);
 #endif
 
 static int sh_pfc_probe(struct platform_device *pdev)
@@ -632,7 +633,6 @@ static const struct platform_device_id sh_pfc_id_table[] = {
 	{ "sh-pfc", 0 },
 	{ },
 };
-MODULE_DEVICE_TABLE(platform, sh_pfc_id_table);
 
 static struct platform_driver sh_pfc_driver = {
 	.probe		= sh_pfc_probe,
@@ -649,13 +649,3 @@ static int __init sh_pfc_init(void)
 	return platform_driver_register(&sh_pfc_driver);
 }
 postcore_initcall(sh_pfc_init);
-
-static void __exit sh_pfc_exit(void)
-{
-	platform_driver_unregister(&sh_pfc_driver);
-}
-module_exit(sh_pfc_exit);
-
-MODULE_AUTHOR("Magnus Damm, Paul Mundt, Laurent Pinchart");
-MODULE_DESCRIPTION("Pin Control and GPIO driver for SuperH pin function controller");
-MODULE_LICENSE("GPL v2");
-- 
2.6.1

