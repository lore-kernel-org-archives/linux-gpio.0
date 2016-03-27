From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 9/9] drivers/gpio: make gpio-zx.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:49 -0400
Message-ID: <1459093489-18314-10-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jun Nie <jun.nie@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config GPIO_ZX
        bool "ZTE ZX GPIO support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modularity so that when reading the
driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-zx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 47c79fa65670..93de8be0d885 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -1,4 +1,8 @@
 /*
+ * ZTE ZX296702 GPIO driver
+ *
+ * Author: Jun Nie <jun.nie@linaro.org>
+ *
  * Copyright (C) 2015 Linaro Ltd.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -10,7 +14,7 @@
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/irqchip/chained_irq.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
@@ -282,7 +286,6 @@ static const struct of_device_id zx_gpio_match[] = {
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, zx_gpio_match);
 
 static struct platform_driver zx_gpio_driver = {
 	.probe		= zx_gpio_probe,
@@ -291,9 +294,4 @@ static struct platform_driver zx_gpio_driver = {
 		.of_match_table = of_match_ptr(zx_gpio_match),
 	},
 };
-
-module_platform_driver(zx_gpio_driver)
-
-MODULE_AUTHOR("Jun Nie <jun.nie@linaro.org>");
-MODULE_DESCRIPTION("ZTE ZX296702 GPIO driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(zx_gpio_driver)
-- 
2.6.1
