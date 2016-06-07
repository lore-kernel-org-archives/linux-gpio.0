From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 8/9] pinctrl: digicolor: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:07 -0400
Message-ID: <1465267388-17884-9-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:58690 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753152AbcFGCnp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 22:43:45 -0400
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/Kconfig:config PINCTRL_DIGICOLOR
drivers/pinctrl/Kconfig:        bool

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-digicolor.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index c8073d442dcb..aba3da5ee844 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -15,7 +15,7 @@
  * - Pin pad configuration (pull up/down, strength)
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -337,27 +337,17 @@ static int dc_pinctrl_probe(struct platform_device *pdev)
 	return dc_gpiochip_add(pmap, pdev->dev.of_node);
 }
 
-static int dc_pinctrl_remove(struct platform_device *pdev)
-{
-	struct dc_pinmap *pmap = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pmap->chip);
-
-	return 0;
-}
-
 static const struct of_device_id dc_pinctrl_ids[] = {
 	{ .compatible = "cnxt,cx92755-pinctrl" },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, dc_pinctrl_ids);
 
 static struct platform_driver dc_pinctrl_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = dc_pinctrl_ids,
+		.suppress_bind_attrs = true,
 	},
 	.probe = dc_pinctrl_probe,
-	.remove = dc_pinctrl_remove,
 };
-module_platform_driver(dc_pinctrl_driver);
+builtin_platform_driver(dc_pinctrl_driver);
-- 
2.8.0

