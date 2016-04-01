From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/6] drivers/gpio: make gpio-rc5t583.c explicitly non-modular
Date: Fri, 1 Apr 2016 14:49:33 -0400
Message-ID: <1459536578-3017-2-git-send-email-paul.gortmaker@windriver.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:63013 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184AbcDASty (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 14:49:54 -0400
In-Reply-To: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_RC5T583
drivers/gpio/Kconfig:   bool "RICOH RC5T583 GPIO"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-rc5t583.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index 1d6100fa312a..3b4dc1a9a68d 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -23,7 +23,6 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/device.h>
 #include <linux/gpio.h>
@@ -152,14 +151,3 @@ static int __init rc5t583_gpio_init(void)
 	return platform_driver_register(&rc5t583_gpio_driver);
 }
 subsys_initcall(rc5t583_gpio_init);
-
-static void __exit rc5t583_gpio_exit(void)
-{
-	platform_driver_unregister(&rc5t583_gpio_driver);
-}
-module_exit(rc5t583_gpio_exit);
-
-MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
-MODULE_DESCRIPTION("GPIO interface for RC5T583");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:rc5t583-gpio");
-- 
2.6.1

