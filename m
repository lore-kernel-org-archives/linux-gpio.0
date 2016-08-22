From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/4] gpio: vf610: drop unused MODULE_ tags from non-modular code
Date: Mon, 22 Aug 2016 12:48:33 -0400
Message-ID: <20160822164833.3633-5-paul.gortmaker@windriver.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_VF610
drivers/gpio/Kconfig:   def_bool y

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
is now contained at the top of the file in the comments.

We don't replace module.h with init.h since the file already has that.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-vf610.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 6284bdbe1e0c..3edb09cb9ee0 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -1,5 +1,5 @@
 /*
- * vf610 GPIO support through PORT and GPIO module
+ * Freescale vf610 GPIO support through PORT and GPIO
  *
  * Copyright (c) 2014 Toradex AG.
  *
@@ -23,7 +23,6 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -289,7 +288,3 @@ static int __init gpio_vf610_init(void)
 	return platform_driver_register(&vf610_gpio_driver);
 }
 device_initcall(gpio_vf610_init);
-
-MODULE_AUTHOR("Stefan Agner <stefan@agner.ch>");
-MODULE_DESCRIPTION("Freescale VF610 GPIO");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4
