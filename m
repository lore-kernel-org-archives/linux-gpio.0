From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/4] gpio: timberdale: make it explicitly non-modular
Date: Mon, 9 May 2016 19:59:57 -0400
Message-ID: <1462838398-10725-4-git-send-email-paul.gortmaker@windriver.com>
References: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_TIMBERDALE
drivers/gpio/Kconfig:   bool "Support for timberdale GPIO IP"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-timberdale.c | 35 +++++------------------------------
 1 file changed, 5 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 85ed608c2b27..181f86ce00cd 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -1,5 +1,6 @@
 /*
  * Timberdale FPGA GPIO driver
+ * Author: Mocean Laboratories
  * Copyright (c) 2009 Intel Corporation
  *
  * This program is free software; you can redistribute it and/or modify
@@ -20,7 +21,7 @@
  * Timberdale FPGA GPIO
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/irq.h>
@@ -290,40 +291,14 @@ static int timbgpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int timbgpio_remove(struct platform_device *pdev)
-{
-	struct timbgpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct timbgpio *tgpio = platform_get_drvdata(pdev);
-	int irq = platform_get_irq(pdev, 0);
-
-	if (irq >= 0 && tgpio->irq_base > 0) {
-		int i;
-		for (i = 0; i < pdata->nr_pins; i++) {
-			irq_set_chip(tgpio->irq_base + i, NULL);
-			irq_set_chip_data(tgpio->irq_base + i, NULL);
-		}
-
-		irq_set_handler(irq, NULL);
-		irq_set_handler_data(irq, NULL);
-	}
-
-	return 0;
-}
-
 static struct platform_driver timbgpio_platform_driver = {
 	.driver = {
-		.name	= DRIVER_NAME,
+		.name			= DRIVER_NAME,
+		.suppress_bind_attrs	= true,
 	},
 	.probe		= timbgpio_probe,
-	.remove		= timbgpio_remove,
 };
 
 /*--------------------------------------------------------------------------*/
 
-module_platform_driver(timbgpio_platform_driver);
-
-MODULE_DESCRIPTION("Timberdale GPIO driver");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Mocean Laboratories");
-MODULE_ALIAS("platform:"DRIVER_NAME);
-
+builtin_platform_driver(timbgpio_platform_driver);
-- 
2.8.0
