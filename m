From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/3] pinctrl: spear: make bool drivers explicitly non-modular
Date: Mon, 6 Feb 2017 03:03:51 -0500
Message-ID: <20170206080352.17808-3-paul.gortmaker@windriver.com>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206080352.17808-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, spear-devel@list.st.com, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

None of the Kconfigs for any of these drivers are tristate,
meaning that they currently are not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the drivers there is no doubt they are builtin-only.  All
drivers get the exact same change, so they are handled in batch.

Changes are (1) use init.h header in place of module.h header,
(2) delete module_exit related code, (3) delete MODULE_DEVICE_TABLE,
and (4) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags.

None of these drivers were using module_init() so we don't have to
worry about the init ordering getting changed with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE etc. tags since all that information
is already contained at the top of each file in the comments.

Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: spear-devel@list.st.com
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c    |  7 +------
 drivers/pinctrl/spear/pinctrl-spear1310.c | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear1340.c | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear300.c  | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear310.c  | 12 ------------
 drivers/pinctrl/spear/pinctrl-spear320.c  | 12 ------------
 6 files changed, 1 insertion(+), 66 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 4c9b863f8267..cf6d68c7345b 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -13,7 +13,7 @@
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
@@ -705,7 +705,6 @@ static const struct of_device_id plgpio_of_match[] = {
 	{ .compatible = "st,spear-plgpio" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, plgpio_of_match);
 
 static struct platform_driver plgpio_driver = {
 	.probe = plgpio_probe,
@@ -721,7 +720,3 @@ static int __init plgpio_init(void)
 	return platform_driver_register(&plgpio_driver);
 }
 subsys_initcall(plgpio_init);
-
-MODULE_AUTHOR("Viresh Kumar <viresh.kumar@linaro.org>");
-MODULE_DESCRIPTION("STMicroelectronics SPEAr PLGPIO driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/spear/pinctrl-spear1310.c b/drivers/pinctrl/spear/pinctrl-spear1310.c
index 18210681c737..0180eb544f02 100644
--- a/drivers/pinctrl/spear/pinctrl-spear1310.c
+++ b/drivers/pinctrl/spear/pinctrl-spear1310.c
@@ -11,7 +11,6 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include "pinctrl-spear.h"
@@ -2717,14 +2716,3 @@ static int __init spear1310_pinctrl_init(void)
 	return platform_driver_register(&spear1310_pinctrl_driver);
 }
 arch_initcall(spear1310_pinctrl_init);
-
-static void __exit spear1310_pinctrl_exit(void)
-{
-	platform_driver_unregister(&spear1310_pinctrl_driver);
-}
-module_exit(spear1310_pinctrl_exit);
-
-MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-MODULE_DESCRIPTION("ST Microelectronics SPEAr1310 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, spear1310_pinctrl_of_match);
diff --git a/drivers/pinctrl/spear/pinctrl-spear1340.c b/drivers/pinctrl/spear/pinctrl-spear1340.c
index c01fb23ee636..0ca961219b3b 100644
--- a/drivers/pinctrl/spear/pinctrl-spear1340.c
+++ b/drivers/pinctrl/spear/pinctrl-spear1340.c
@@ -11,7 +11,6 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include "pinctrl-spear.h"
@@ -2033,14 +2032,3 @@ static int __init spear1340_pinctrl_init(void)
 	return platform_driver_register(&spear1340_pinctrl_driver);
 }
 arch_initcall(spear1340_pinctrl_init);
-
-static void __exit spear1340_pinctrl_exit(void)
-{
-	platform_driver_unregister(&spear1340_pinctrl_driver);
-}
-module_exit(spear1340_pinctrl_exit);
-
-MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-MODULE_DESCRIPTION("ST Microelectronics SPEAr1340 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, spear1340_pinctrl_of_match);
diff --git a/drivers/pinctrl/spear/pinctrl-spear300.c b/drivers/pinctrl/spear/pinctrl-spear300.c
index 111148daa3f1..e39913a18139 100644
--- a/drivers/pinctrl/spear/pinctrl-spear300.c
+++ b/drivers/pinctrl/spear/pinctrl-spear300.c
@@ -11,7 +11,6 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include "pinctrl-spear3xx.h"
@@ -690,14 +689,3 @@ static int __init spear300_pinctrl_init(void)
 	return platform_driver_register(&spear300_pinctrl_driver);
 }
 arch_initcall(spear300_pinctrl_init);
-
-static void __exit spear300_pinctrl_exit(void)
-{
-	platform_driver_unregister(&spear300_pinctrl_driver);
-}
-module_exit(spear300_pinctrl_exit);
-
-MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-MODULE_DESCRIPTION("ST Microelectronics SPEAr300 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, spear300_pinctrl_of_match);
diff --git a/drivers/pinctrl/spear/pinctrl-spear310.c b/drivers/pinctrl/spear/pinctrl-spear310.c
index a7b000062985..393b2b97d527 100644
--- a/drivers/pinctrl/spear/pinctrl-spear310.c
+++ b/drivers/pinctrl/spear/pinctrl-spear310.c
@@ -11,7 +11,6 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include "pinctrl-spear3xx.h"
@@ -413,14 +412,3 @@ static int __init spear310_pinctrl_init(void)
 	return platform_driver_register(&spear310_pinctrl_driver);
 }
 arch_initcall(spear310_pinctrl_init);
-
-static void __exit spear310_pinctrl_exit(void)
-{
-	platform_driver_unregister(&spear310_pinctrl_driver);
-}
-module_exit(spear310_pinctrl_exit);
-
-MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-MODULE_DESCRIPTION("ST Microelectronics SPEAr310 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, spear310_pinctrl_of_match);
diff --git a/drivers/pinctrl/spear/pinctrl-spear320.c b/drivers/pinctrl/spear/pinctrl-spear320.c
index e2b3817701dc..99c10fc3d9b5 100644
--- a/drivers/pinctrl/spear/pinctrl-spear320.c
+++ b/drivers/pinctrl/spear/pinctrl-spear320.c
@@ -11,7 +11,6 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include "pinctrl-spear3xx.h"
@@ -3454,14 +3453,3 @@ static int __init spear320_pinctrl_init(void)
 	return platform_driver_register(&spear320_pinctrl_driver);
 }
 arch_initcall(spear320_pinctrl_init);
-
-static void __exit spear320_pinctrl_exit(void)
-{
-	platform_driver_unregister(&spear320_pinctrl_driver);
-}
-module_exit(spear320_pinctrl_exit);
-
-MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-MODULE_DESCRIPTION("ST Microelectronics SPEAr320 pinctrl driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, spear320_pinctrl_of_match);
-- 
2.11.0
