From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/9] pinctrl: as3722: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:00 -0400
Message-ID: <1465267388-17884-2-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:36589 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751961AbcFGCnb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2016 22:43:31 -0400
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config PINCTRL_AS3722
        bool "Pinctrl and GPIO driver for ams AS3722 PMIC"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_ALIAS and MODULE_DEVICE_TABLE are a no-op for
non-modular code and hence both are removed.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-as3722.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 4e9fe7854e8a..fb4f5372ab04 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -23,7 +23,7 @@
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/mfd/as3722.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -599,31 +599,17 @@ fail_range_add:
 	return ret;
 }
 
-static int as3722_pinctrl_remove(struct platform_device *pdev)
-{
-	struct as3722_pctrl_info *as_pci = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&as_pci->gpio_chip);
-	return 0;
-}
-
 static const struct of_device_id as3722_pinctrl_of_match[] = {
 	{ .compatible = "ams,as3722-pinctrl", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, as3722_pinctrl_of_match);
 
 static struct platform_driver as3722_pinctrl_driver = {
 	.driver = {
 		.name = "as3722-pinctrl",
+		.suppress_bind_attrs = true,
 		.of_match_table = as3722_pinctrl_of_match,
 	},
 	.probe = as3722_pinctrl_probe,
-	.remove = as3722_pinctrl_remove,
 };
-module_platform_driver(as3722_pinctrl_driver);
-
-MODULE_ALIAS("platform:as3722-pinctrl");
-MODULE_DESCRIPTION("AS3722 pin control and GPIO driver");
-MODULE_AUTHOR("Laxman Dewangan<ldewangan@nvidia.com>");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(as3722_pinctrl_driver);
-- 
2.8.0

