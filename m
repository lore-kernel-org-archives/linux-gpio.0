From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/6] drivers/gpio: make gpio-palmas.c explicitly non-modular
Date: Fri, 1 Apr 2016 14:49:36 -0400
Message-ID: <1459536578-3017-5-git-send-email-paul.gortmaker@windriver.com>
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

drivers/gpio/Kconfig:config GPIO_PALMAS
drivers/gpio/Kconfig:   bool "TI PALMAS series PMICs GPIO"

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
 drivers/gpio/gpio-palmas.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 6f27b3d94d53..e248707ca39e 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -20,7 +20,7 @@
 
 #include <linux/gpio.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/mfd/palmas.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -218,14 +218,3 @@ static int __init palmas_gpio_init(void)
 	return platform_driver_register(&palmas_gpio_driver);
 }
 subsys_initcall(palmas_gpio_init);
-
-static void __exit palmas_gpio_exit(void)
-{
-	platform_driver_unregister(&palmas_gpio_driver);
-}
-module_exit(palmas_gpio_exit);
-
-MODULE_ALIAS("platform:palmas-gpio");
-MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
-MODULE_DESCRIPTION("GPIO driver for TI Palmas series PMICs");
-MODULE_LICENSE("GPL v2");
-- 
2.6.1
