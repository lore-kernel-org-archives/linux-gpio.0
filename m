From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/4] gpio: msic: drop unused MODULE_ tags from non-modular code
Date: Mon, 22 Aug 2016 12:48:30 -0400
Message-ID: <20160822164833.3633-2-paul.gortmaker@windriver.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:60538 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754993AbcHVQst (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 12:48:49 -0400
In-Reply-To: <20160822164833.3633-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_MSIC
drivers/gpio/Kconfig:   bool "Intel MSIC mixed signal gpio support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

We don't replace module.h with init.h since the file already has that.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-msic.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index d75649787e6c..1b7ce7f85886 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -20,7 +20,6 @@
  *
  */
 
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
@@ -328,9 +327,4 @@ static int __init platform_msic_gpio_init(void)
 {
 	return platform_driver_register(&platform_msic_gpio_driver);
 }
-
 subsys_initcall(platform_msic_gpio_init);
-
-MODULE_AUTHOR("Mathias Nyman <mathias.nyman@linux.intel.com>");
-MODULE_DESCRIPTION("Intel Medfield MSIC GPIO driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4

