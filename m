From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/4] gpio: stmpe: make it explicitly non-modular
Date: Mon, 9 May 2016 19:59:56 -0400
Message-ID: <1462838398-10725-3-git-send-email-paul.gortmaker@windriver.com>
References: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:44280 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752790AbcEJAAd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 May 2016 20:00:33 -0400
In-Reply-To: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rabin Vincent <rabin.vincent@stericsson.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_STMPE
drivers/gpio/Kconfig:   bool "STMPE GPIOs"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Curiously, this driver was using subsys_initcall since day one, so
we don't have the "normal" module_init replacement in this change
like we've done in other similar driver updates.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-stmpe.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 5197edf1acfd..6f7af28b8966 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -5,7 +5,6 @@
  * Author: Rabin Vincent <rabin.vincent@stericsson.com> for ST-Ericsson
  */
 
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -413,23 +412,13 @@ out_free:
 	return ret;
 }
 
-static int stmpe_gpio_remove(struct platform_device *pdev)
-{
-	struct stmpe_gpio *stmpe_gpio = platform_get_drvdata(pdev);
-	struct stmpe *stmpe = stmpe_gpio->stmpe;
-
-	gpiochip_remove(&stmpe_gpio->chip);
-	stmpe_disable(stmpe, STMPE_BLOCK_GPIO);
-	kfree(stmpe_gpio);
-
-	return 0;
-}
-
 static struct platform_driver stmpe_gpio_driver = {
-	.driver.name	= "stmpe-gpio",
-	.driver.owner	= THIS_MODULE,
+	.driver = {
+		.suppress_bind_attrs	= true,
+		.name			= "stmpe-gpio",
+		.owner			= THIS_MODULE,
+	},
 	.probe		= stmpe_gpio_probe,
-	.remove		= stmpe_gpio_remove,
 };
 
 static int __init stmpe_gpio_init(void)
@@ -437,13 +426,3 @@ static int __init stmpe_gpio_init(void)
 	return platform_driver_register(&stmpe_gpio_driver);
 }
 subsys_initcall(stmpe_gpio_init);
-
-static void __exit stmpe_gpio_exit(void)
-{
-	platform_driver_unregister(&stmpe_gpio_driver);
-}
-module_exit(stmpe_gpio_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("STMPExxxx GPIO driver");
-MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
-- 
2.8.0

