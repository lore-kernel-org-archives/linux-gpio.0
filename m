From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] gpio: xgene: mark PM functions as __maybe_unused
Date: Fri, 17 Feb 2017 16:13:44 +0100
Message-ID: <20170217151400.2539149-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:50948 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934176AbdBQPOK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2017 10:14:10 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Duc Dang <dhdang@apm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When CONFIG_PM_SLEEP is disabled, we get a warning about unused functions:

drivers/gpio/gpio-xgene.c:155:12: warning: 'xgene_gpio_resume' defined but not used [-Wunused-function]
 static int xgene_gpio_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~
drivers/gpio/gpio-xgene.c:142:12: warning: 'xgene_gpio_suspend' defined but not used [-Wunused-function]
 static int xgene_gpio_suspend(struct device *dev)

The warnings are harmless and can be avoided by simplifying the code and marking
the functions as __maybe_unused.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: remove #ifdef around set_dr_val as well, to avoid build regression

 drivers/gpio/gpio-xgene.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 40a8881c2ce8..f1c6ec17b90a 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -42,9 +42,7 @@ struct xgene_gpio {
 	struct gpio_chip	chip;
 	void __iomem		*base;
 	spinlock_t		lock;
-#ifdef CONFIG_PM
 	u32			set_dr_val[XGENE_MAX_GPIO_BANKS];
-#endif
 };
 
 static int xgene_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -138,8 +136,7 @@ static int xgene_gpio_dir_out(struct gpio_chip *gc,
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int xgene_gpio_suspend(struct device *dev)
+static __maybe_unused int xgene_gpio_suspend(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -152,7 +149,7 @@ static int xgene_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int xgene_gpio_resume(struct device *dev)
+static __maybe_unused int xgene_gpio_resume(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -166,10 +163,6 @@ static int xgene_gpio_resume(struct device *dev)
 }
 
 static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
-#define XGENE_GPIO_PM_OPS	(&xgene_gpio_pm)
-#else
-#define XGENE_GPIO_PM_OPS	NULL
-#endif
 
 static int xgene_gpio_probe(struct platform_device *pdev)
 {
@@ -241,7 +234,7 @@ static struct platform_driver xgene_gpio_driver = {
 		.name = "xgene-gpio",
 		.of_match_table = xgene_gpio_of_match,
 		.acpi_match_table = ACPI_PTR(xgene_gpio_acpi_match),
-		.pm     = XGENE_GPIO_PM_OPS,
+		.pm     = &xgene_gpio_pm,
 	},
 	.probe = xgene_gpio_probe,
 };
-- 
2.9.0

