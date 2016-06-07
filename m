From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/9] pinctrl: baytrail: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:01 -0400
Message-ID: <1465267388-17884-3-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:58675 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752018AbcFGCnb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 22:43:31 -0400
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config PINCTRL_BAYTRAIL
        bool "Intel Baytrail GPIO pin control"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_init() was already not in use in this driver, we don't
have any concerns with init ordering changes here.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 677a811b3a6f..b2df03e9e431 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -15,7 +15,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/bitops.h>
@@ -1822,17 +1821,6 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int byt_pinctrl_remove(struct platform_device *pdev)
-{
-	struct byt_gpio *vg = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-	gpiochip_remove(&vg->chip);
-	pinctrl_unregister(vg->pctl_dev);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int byt_gpio_suspend(struct device *dev)
 {
@@ -1930,10 +1918,11 @@ static const struct dev_pm_ops byt_gpio_pm_ops = {
 
 static struct platform_driver byt_gpio_driver = {
 	.probe          = byt_pinctrl_probe,
-	.remove         = byt_pinctrl_remove,
 	.driver         = {
-		.name   = "byt_gpio",
-		.pm	= &byt_gpio_pm_ops,
+		.name			= "byt_gpio",
+		.pm			= &byt_gpio_pm_ops,
+		.suppress_bind_attrs	= true,
+
 		.acpi_match_table = ACPI_PTR(byt_gpio_acpi_match),
 	},
 };
@@ -1943,9 +1932,3 @@ static int __init byt_gpio_init(void)
 	return platform_driver_register(&byt_gpio_driver);
 }
 subsys_initcall(byt_gpio_init);
-
-static void __exit byt_gpio_exit(void)
-{
-	platform_driver_unregister(&byt_gpio_driver);
-}
-module_exit(byt_gpio_exit);
-- 
2.8.0

