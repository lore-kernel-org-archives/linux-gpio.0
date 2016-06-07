From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/9] pinctrl: amd: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:04 -0400
Message-ID: <1465267388-17884-6-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Ken Xue <Ken.Xue@amd.com>, Jeff Wu <Jeff.Wu@amd.com>
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config PINCTRL_AMD
        bool "AMD GPIO pin control"

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

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Ken Xue <Ken.Xue@amd.com>
Cc: Jeff Wu <Jeff.Wu@amd.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-amd.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 634b4d30eefb..b466d70b9004 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -13,7 +13,7 @@
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
@@ -828,35 +828,18 @@ out2:
 	return ret;
 }
 
-static int amd_gpio_remove(struct platform_device *pdev)
-{
-	struct amd_gpio *gpio_dev;
-
-	gpio_dev = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&gpio_dev->gc);
-
-	return 0;
-}
-
 static const struct acpi_device_id amd_gpio_acpi_match[] = {
 	{ "AMD0030", 0 },
 	{ "AMDI0030", 0},
 	{ },
 };
-MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
 
 static struct platform_driver amd_gpio_driver = {
 	.driver		= {
 		.name	= "amd_gpio",
+		.suppress_bind_attrs = true,
 		.acpi_match_table = ACPI_PTR(amd_gpio_acpi_match),
 	},
 	.probe		= amd_gpio_probe,
-	.remove		= amd_gpio_remove,
 };
-
-module_platform_driver(amd_gpio_driver);
-
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Ken Xue <Ken.Xue@amd.com>, Jeff Wu <Jeff.Wu@amd.com>");
-MODULE_DESCRIPTION("AMD GPIO pinctrl driver");
+builtin_platform_driver(amd_gpio_driver);
-- 
2.8.0
