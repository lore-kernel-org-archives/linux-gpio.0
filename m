From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/6] drivers/gpio: make gpio-tc3589x.c explicitly non-modular
Date: Fri, 1 Apr 2016 14:49:34 -0400
Message-ID: <1459536578-3017-3-git-send-email-paul.gortmaker@windriver.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rabin Vincent <rabin.vincent@stericsson.com>, Hanumath Prasad <hanumath.prasad@stericsson.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_TC3589X
drivers/gpio/Kconfig:   bool "TC3589X GPIOs"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>
Cc: Hanumath Prasad <hanumath.prasad@stericsson.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-tc3589x.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 4f566e6b81f1..a29dec137373 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -6,7 +6,6 @@
  * Author: Rabin Vincent <rabin.vincent@stericsson.com> for ST-Ericsson
  */
 
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -311,13 +310,3 @@ static int __init tc3589x_gpio_init(void)
 	return platform_driver_register(&tc3589x_gpio_driver);
 }
 subsys_initcall(tc3589x_gpio_init);
-
-static void __exit tc3589x_gpio_exit(void)
-{
-	platform_driver_unregister(&tc3589x_gpio_driver);
-}
-module_exit(tc3589x_gpio_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("TC3589x GPIO driver");
-MODULE_AUTHOR("Hanumath Prasad, Rabin Vincent");
-- 
2.6.1
