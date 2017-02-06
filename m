From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/3] pinctrl: mvebu: make bool drivers explicitly non-modular
Date: Mon, 6 Feb 2017 03:03:50 -0500
Message-ID: <20170206080352.17808-2-paul.gortmaker@windriver.com>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206080352.17808-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

None of the Kconfigs for any of these drivers are tristate, meaning
that they currently are not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the drivers there is no doubt they are builtin-only.
All drivers get the exact same change, so they are handled in batch.

Changes are (1) use builtin_platform_driver, (2) dont use module.h
(3) delete module_exit related code, (4) delete MODULE_DEVICE_TABLE,
and (5) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags.

For the dove driver we explicitly disallow a driver unbind, since
that doesn't have a sensible use case anyway, and it allows us to
drop the ".remove" code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We deleted the MODULE_LICENSE etc. tags since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-370.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-375.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-38x.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-39x.c |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c  |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-dove.c       | 17 ++---------------
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c   |  8 +-------
 drivers/pinctrl/mvebu/pinctrl-mvebu.c      |  1 -
 drivers/pinctrl/mvebu/pinctrl-orion.c      |  8 +-------
 9 files changed, 9 insertions(+), 65 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-370.c b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
index c2de4f8ee488..9feba9a5ccb7 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-370.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
@@ -14,7 +14,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
@@ -406,9 +405,4 @@ static struct platform_driver armada_370_pinctrl_driver = {
 	},
 	.probe = armada_370_pinctrl_probe,
 };
-
-module_platform_driver(armada_370_pinctrl_driver);
-
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Armada 370 pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(armada_370_pinctrl_driver);
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-375.c b/drivers/pinctrl/mvebu/pinctrl-armada-375.c
index 30cbf23b0b03..b7de8abccd48 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-375.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-375.c
@@ -14,7 +14,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
@@ -424,9 +423,4 @@ static struct platform_driver armada_375_pinctrl_driver = {
 	},
 	.probe = armada_375_pinctrl_probe,
 };
-
-module_platform_driver(armada_375_pinctrl_driver);
-
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Armada 375 pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(armada_375_pinctrl_driver);
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-38x.c b/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
index e66ed239522e..de2e1538a26f 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
@@ -14,7 +14,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -435,9 +434,4 @@ static struct platform_driver armada_38x_pinctrl_driver = {
 	},
 	.probe = armada_38x_pinctrl_probe,
 };
-
-module_platform_driver(armada_38x_pinctrl_driver);
-
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Armada 38x pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(armada_38x_pinctrl_driver);
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-39x.c b/drivers/pinctrl/mvebu/pinctrl-armada-39x.c
index 697c8774a4da..627f57c88372 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-39x.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-39x.c
@@ -14,7 +14,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -417,9 +416,4 @@ static struct platform_driver armada_39x_pinctrl_driver = {
 	},
 	.probe = armada_39x_pinctrl_probe,
 };
-
-module_platform_driver(armada_39x_pinctrl_driver);
-
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Armada 39x pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(armada_39x_pinctrl_driver);
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
index 61cbc138703e..b854f1ee5de5 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
@@ -20,7 +20,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
@@ -650,9 +649,4 @@ static struct platform_driver armada_xp_pinctrl_driver = {
 	.suspend = armada_xp_pinctrl_suspend,
 	.resume = armada_xp_pinctrl_resume,
 };
-
-module_platform_driver(armada_xp_pinctrl_driver);
-
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Armada XP pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(armada_xp_pinctrl_driver);
diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
index 89ae93c49f2f..8472f61f2bbe 100644
--- a/drivers/pinctrl/mvebu/pinctrl-dove.c
+++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
@@ -854,24 +853,12 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	return mvebu_pinctrl_probe(pdev);
 }
 
-static int dove_pinctrl_remove(struct platform_device *pdev)
-{
-	if (!IS_ERR(clk))
-		clk_disable_unprepare(clk);
-	return 0;
-}
-
 static struct platform_driver dove_pinctrl_driver = {
 	.driver = {
 		.name = "dove-pinctrl",
+		.suppress_bind_attrs = true,
 		.of_match_table = dove_pinctrl_of_match,
 	},
 	.probe = dove_pinctrl_probe,
-	.remove = dove_pinctrl_remove,
 };
-
-module_platform_driver(dove_pinctrl_driver);
-
-MODULE_AUTHOR("Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>");
-MODULE_DESCRIPTION("Marvell Dove pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(dove_pinctrl_driver);
diff --git a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
index be12b6d569a0..5995a19abde5 100644
--- a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
+++ b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
@@ -472,9 +471,4 @@ static struct platform_driver kirkwood_pinctrl_driver = {
 	},
 	.probe = kirkwood_pinctrl_probe,
 };
-
-module_platform_driver(kirkwood_pinctrl_driver);
-
-MODULE_AUTHOR("Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>");
-MODULE_DESCRIPTION("Marvell Kirkwood pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(kirkwood_pinctrl_driver);
diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 1bdfe770eb5c..e4dda12d371a 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/platform_device.h>
-#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/pinctrl/mvebu/pinctrl-orion.c b/drivers/pinctrl/mvebu/pinctrl-orion.c
index c2e0c16cf9b3..69cb4d9f0114 100644
--- a/drivers/pinctrl/mvebu/pinctrl-orion.c
+++ b/drivers/pinctrl/mvebu/pinctrl-orion.c
@@ -20,7 +20,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
@@ -249,9 +248,4 @@ static struct platform_driver orion_pinctrl_driver = {
 	},
 	.probe = orion_pinctrl_probe,
 };
-
-module_platform_driver(orion_pinctrl_driver);
-
-MODULE_AUTHOR("Thomas Petazzoni <thomas.petazzoni@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Orion pinctrl driver");
-MODULE_LICENSE("GPL v2");
+builtin_platform_driver(orion_pinctrl_driver);
-- 
2.11.0
