From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 6/6] drivers/gpio: make gpio-tps6586x.c explicitly non-modular
Date: Fri, 1 Apr 2016 14:49:38 -0400
Message-ID: <1459536578-3017-7-git-send-email-paul.gortmaker@windriver.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_TPS6586X
drivers/gpio/Kconfig:   bool "TPS6586X GPIO"

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
 drivers/gpio/gpio-tps6586x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index c88bdc8ee2c9..6b15e68a314f 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -24,7 +24,7 @@
 #include <linux/errno.h>
 #include <linux/gpio.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/mfd/tps6586x.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -140,14 +140,3 @@ static int __init tps6586x_gpio_init(void)
 	return platform_driver_register(&tps6586x_gpio_driver);
 }
 subsys_initcall(tps6586x_gpio_init);
-
-static void __exit tps6586x_gpio_exit(void)
-{
-	platform_driver_unregister(&tps6586x_gpio_driver);
-}
-module_exit(tps6586x_gpio_exit);
-
-MODULE_ALIAS("platform:tps6586x-gpio");
-MODULE_DESCRIPTION("GPIO interface for TPS6586X PMIC");
-MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
-MODULE_LICENSE("GPL");
-- 
2.6.1
