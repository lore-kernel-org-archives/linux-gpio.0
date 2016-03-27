From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/9] drivers/gpio: make gpio-mb86s7x.c driver explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:42 -0400
Message-ID: <1459093489-18314-3-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig for this driver is currently:

config GPIO_MB86S7X
        bool "GPIO support for Fujitsu MB86S7x Platforms"

...meaning that it currently is not being built as a module by anyone.
Lets remove the couple traces of modularity, so that when reading the
driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-mb86s7x.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 7fffc1d6c055..d69bd24b241c 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -17,7 +17,6 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/clk.h>
-#include <linux/module.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/ioport.h>
@@ -210,7 +209,6 @@ static const struct of_device_id mb86s70_gpio_dt_ids[] = {
 	{ .compatible = "fujitsu,mb86s70-gpio" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, mb86s70_gpio_dt_ids);
 
 static struct platform_driver mb86s70_gpio_driver = {
 	.driver = {
@@ -225,8 +223,4 @@ static int __init mb86s70_gpio_init(void)
 {
 	return platform_driver_register(&mb86s70_gpio_driver);
 }
-module_init(mb86s70_gpio_init);
-
-MODULE_DESCRIPTION("MB86S7x GPIO Driver");
-MODULE_ALIAS("platform:mb86s70-gpio");
-MODULE_LICENSE("GPL");
+device_initcall(mb86s70_gpio_init);
-- 
2.6.1
