From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/6] pinctrl: nomadik: make abx500 explicitly non-modular
Date: Tue, 23 Aug 2016 17:19:40 -0400
Message-ID: <20160823211944.18554-3-paul.gortmaker@windriver.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@unipv.it>, Patrice Chotard <patrice.chotard@st.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

 config PINCTRL_ABX500
       bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

Note that MODULE_ALIAS is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Rubini <rubini@unipv.it>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 7d343c22c90c..f95001bc1d58 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -4,6 +4,8 @@
  * Author: Patrice Chotard <patrice.chotard@st.com>
  * License terms: GNU General Public License (GPL) version 2
  *
+ * Driver allows to use AxB5xx unused pins to be used as GPIO
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -12,7 +14,6 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -1269,8 +1270,3 @@ static int __init abx500_gpio_init(void)
 	return platform_driver_register(&abx500_gpio_driver);
 }
 core_initcall(abx500_gpio_init);
-
-MODULE_AUTHOR("Patrice Chotard <patrice.chotard@st.com>");
-MODULE_DESCRIPTION("Driver allows to use AxB5xx unused pins to be used as GPIO");
-MODULE_ALIAS("platform:abx500-gpio");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4
