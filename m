From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/9] pinctrl: at91: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:02 -0400
Message-ID: <1465267388-17884-4-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:49851 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753390AbcFGCpg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2016 22:45:36 -0400
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/Kconfig:config PINCTRL_AT91
drivers/pinctrl/Kconfig:        bool "AT91 pinctrl driver"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not being used in this driver, we don't need
to be concerned with initcall ordering changes when removing it.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-at91.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index b7c0d6f7c046..cb9a0849b8ba 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -9,7 +9,6 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
@@ -1818,13 +1817,3 @@ static int __init at91_pinctrl_init(void)
 	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 }
 arch_initcall(at91_pinctrl_init);
-
-static void __exit at91_pinctrl_exit(void)
-{
-	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
-}
-
-module_exit(at91_pinctrl_exit);
-MODULE_AUTHOR("Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>");
-MODULE_DESCRIPTION("Atmel AT91 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.0

