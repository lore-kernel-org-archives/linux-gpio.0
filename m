From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/4] gpio: spear-spics: drop unused MODULE_ tags from non-modular code
Date: Mon, 22 Aug 2016 12:48:32 -0400
Message-ID: <20160822164833.3633-4-paul.gortmaker@windriver.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_SPEAR_SPICS
drivers/gpio/Kconfig:   bool "ST SPEAr13xx SPI Chip Select as GPIO support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
is now contained at the top of the file in the comments.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-spear-spics.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 7ffd16495286..22267479ba68 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -12,7 +12,7 @@
 #include <linux/err.h>
 #include <linux/gpio.h>
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -183,7 +183,6 @@ static const struct of_device_id spics_gpio_of_match[] = {
 	{ .compatible = "st,spear-spics-gpio" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, spics_gpio_of_match);
 
 static struct platform_driver spics_gpio_driver = {
 	.probe = spics_gpio_probe,
@@ -198,7 +197,3 @@ static int __init spics_gpio_init(void)
 	return platform_driver_register(&spics_gpio_driver);
 }
 subsys_initcall(spics_gpio_init);
-
-MODULE_AUTHOR("Shiraz Hashim <shiraz.linux.kernel@gmail.com>");
-MODULE_DESCRIPTION("STMicroelectronics SPEAr SPI Chip Select Abstraction");
-MODULE_LICENSE("GPL");
-- 
2.8.4
