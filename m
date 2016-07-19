From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] Revert "pinctrl: amd: make it explicitly non-modular"
Date: Mon, 18 Jul 2016 20:30:30 -0400
Message-ID: <20160719003030.26420-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:42818 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751957AbcGSAap (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 18 Jul 2016 20:30:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Jean Delvare <jdelvare@suse.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

This reverts commit b8c2b10a9bc0272a20e096852f8fbbf361749dda.

This patch was in my queue at the same time that a conversion of
the same driver from bool --> tristate was pending and merged.

That is commit 337ea0fb1535 ("pinctrl: Turn AMD support to tristate")

Normally the conflict would show up in the build coverage I do,
however in this case an avoidable instance of linux/module.h in
linux/gpio/driver.h (!) causes the build failure to be masked and
instead the tristate gets built-in even for selected "=m".

In working on removing module.h from driver.h this issue was then
revealed (along with other implicit module.h assumptions in gpio,
and mfd -- which will be fixed separately.)

Cc: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-amd.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index b466d70b9004..634b4d30eefb 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -13,7 +13,7 @@
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
-#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
@@ -828,18 +828,35 @@ out2:
 	return ret;
 }
 
+static int amd_gpio_remove(struct platform_device *pdev)
+{
+	struct amd_gpio *gpio_dev;
+
+	gpio_dev = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&gpio_dev->gc);
+
+	return 0;
+}
+
 static const struct acpi_device_id amd_gpio_acpi_match[] = {
 	{ "AMD0030", 0 },
 	{ "AMDI0030", 0},
 	{ },
 };
+MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
 
 static struct platform_driver amd_gpio_driver = {
 	.driver		= {
 		.name	= "amd_gpio",
-		.suppress_bind_attrs = true,
 		.acpi_match_table = ACPI_PTR(amd_gpio_acpi_match),
 	},
 	.probe		= amd_gpio_probe,
+	.remove		= amd_gpio_remove,
 };
-builtin_platform_driver(amd_gpio_driver);
+
+module_platform_driver(amd_gpio_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Ken Xue <Ken.Xue@amd.com>, Jeff Wu <Jeff.Wu@amd.com>");
+MODULE_DESCRIPTION("AMD GPIO pinctrl driver");
-- 
2.8.4

