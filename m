From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: xgene: mark PM functions as __maybe_unused
Date: Tue, 14 Feb 2017 22:20:07 +0100
Message-ID: <20170214212032.2676656-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:65336 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755408AbdBNVUk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2017 16:20:40 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, Duc Dang <dhdang@apm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/gpio/gpio-xgene.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 40a8881c2ce8..1fd62bef562b 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -138,8 +138,7 @@ static int xgene_gpio_dir_out(struct gpio_chip *gc,
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int xgene_gpio_suspend(struct device *dev)
+static __maybe_unused int xgene_gpio_suspend(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -152,7 +151,7 @@ static int xgene_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int xgene_gpio_resume(struct device *dev)
+static __maybe_unused int xgene_gpio_resume(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -166,10 +165,6 @@ static int xgene_gpio_resume(struct device *dev)
 }
 
 static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
-#define XGENE_GPIO_PM_OPS	(&xgene_gpio_pm)
-#else
-#define XGENE_GPIO_PM_OPS	NULL
-#endif
 
 static int xgene_gpio_probe(struct platform_device *pdev)
 {
@@ -241,7 +236,7 @@ static struct platform_driver xgene_gpio_driver = {
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

