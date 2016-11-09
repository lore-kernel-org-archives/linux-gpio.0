From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] pinctrl: vt8500: make bool drivers explicitly non-modular
Date: Wed, 9 Nov 2016 10:45:58 -0500
Message-ID: <20161109154558.13106-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:63872 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752985AbcKIPqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2016 10:46:15 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Tony Prisk <linux@prisktech.co.nz>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

None of the Kconfigs for any of these drivers are tristate, meaning
that they currently are not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the drivers there is no doubt they are builtin-only.  All
drivers get the exact same change, so they are handled in batch.

Changes are (1) use builtin_platform_driver, (2) use init.h header
(3) delete module_exit related code, (4) delete MODULE_DEVICE_TABLE,
(5) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags and (6)
drop ".remove" code and prevent sysfs unbind attempts to call ".remove".

Once this is done, the shared remove function in wmt.[ch] is no longer
used and hence it is removed as well.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE etc. tags since all that information
is already contained at the top of each file in the comments.

Cc: Tony Prisk <linux@prisktech.co.nz>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[build tested allmodconfig + all the below C files individually on arm]

 drivers/pinctrl/vt8500/pinctrl-vt8500.c | 17 +++--------------
 drivers/pinctrl/vt8500/pinctrl-wm8505.c | 17 +++--------------
 drivers/pinctrl/vt8500/pinctrl-wm8650.c | 17 +++--------------
 drivers/pinctrl/vt8500/pinctrl-wm8750.c | 17 +++--------------
 drivers/pinctrl/vt8500/pinctrl-wm8850.c | 17 +++--------------
 drivers/pinctrl/vt8500/pinctrl-wmt.c    | 10 ----------
 drivers/pinctrl/vt8500/pinctrl-wmt.h    |  1 -
 7 files changed, 15 insertions(+), 81 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-vt8500.c b/drivers/pinctrl/vt8500/pinctrl-vt8500.c
index ca946b3dbdb4..767f340d6b11 100644
--- a/drivers/pinctrl/vt8500/pinctrl-vt8500.c
+++ b/drivers/pinctrl/vt8500/pinctrl-vt8500.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -473,11 +473,6 @@ static int vt8500_pinctrl_probe(struct platform_device *pdev)
 	return wmt_pinctrl_probe(pdev, data);
 }
 
-static int vt8500_pinctrl_remove(struct platform_device *pdev)
-{
-	return wmt_pinctrl_remove(pdev);
-}
-
 static const struct of_device_id wmt_pinctrl_of_match[] = {
 	{ .compatible = "via,vt8500-pinctrl" },
 	{ /* sentinel */ },
@@ -485,16 +480,10 @@ static const struct of_device_id wmt_pinctrl_of_match[] = {
 
 static struct platform_driver wmt_pinctrl_driver = {
 	.probe	= vt8500_pinctrl_probe,
-	.remove	= vt8500_pinctrl_remove,
 	.driver = {
 		.name	= "pinctrl-vt8500",
 		.of_match_table	= wmt_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(wmt_pinctrl_driver);
-
-MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
-MODULE_DESCRIPTION("VIA VT8500 Pincontrol driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, wmt_pinctrl_of_match);
+builtin_platform_driver(wmt_pinctrl_driver);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8505.c b/drivers/pinctrl/vt8500/pinctrl-wm8505.c
index 626fc7ec0174..a56fdbd87e42 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8505.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8505.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -504,11 +504,6 @@ static int wm8505_pinctrl_probe(struct platform_device *pdev)
 	return wmt_pinctrl_probe(pdev, data);
 }
 
-static int wm8505_pinctrl_remove(struct platform_device *pdev)
-{
-	return wmt_pinctrl_remove(pdev);
-}
-
 static const struct of_device_id wmt_pinctrl_of_match[] = {
 	{ .compatible = "wm,wm8505-pinctrl" },
 	{ /* sentinel */ },
@@ -516,16 +511,10 @@ static const struct of_device_id wmt_pinctrl_of_match[] = {
 
 static struct platform_driver wmt_pinctrl_driver = {
 	.probe	= wm8505_pinctrl_probe,
-	.remove	= wm8505_pinctrl_remove,
 	.driver = {
 		.name	= "pinctrl-wm8505",
 		.of_match_table	= wmt_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(wmt_pinctrl_driver);
-
-MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
-MODULE_DESCRIPTION("Wondermedia WM8505 Pincontrol driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, wmt_pinctrl_of_match);
+builtin_platform_driver(wmt_pinctrl_driver);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8650.c b/drivers/pinctrl/vt8500/pinctrl-wm8650.c
index 8953aba8bfc2..270dd491f5a1 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8650.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8650.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -342,11 +342,6 @@ static int wm8650_pinctrl_probe(struct platform_device *pdev)
 	return wmt_pinctrl_probe(pdev, data);
 }
 
-static int wm8650_pinctrl_remove(struct platform_device *pdev)
-{
-	return wmt_pinctrl_remove(pdev);
-}
-
 static const struct of_device_id wmt_pinctrl_of_match[] = {
 	{ .compatible = "wm,wm8650-pinctrl" },
 	{ /* sentinel */ },
@@ -354,16 +349,10 @@ static const struct of_device_id wmt_pinctrl_of_match[] = {
 
 static struct platform_driver wmt_pinctrl_driver = {
 	.probe	= wm8650_pinctrl_probe,
-	.remove	= wm8650_pinctrl_remove,
 	.driver = {
 		.name	= "pinctrl-wm8650",
 		.of_match_table	= wmt_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(wmt_pinctrl_driver);
-
-MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
-MODULE_DESCRIPTION("Wondermedia WM8650 Pincontrol driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, wmt_pinctrl_of_match);
+builtin_platform_driver(wmt_pinctrl_driver);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8750.c b/drivers/pinctrl/vt8500/pinctrl-wm8750.c
index c79053d430db..74f7b3a18f3a 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8750.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8750.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -381,11 +381,6 @@ static int wm8750_pinctrl_probe(struct platform_device *pdev)
 	return wmt_pinctrl_probe(pdev, data);
 }
 
-static int wm8750_pinctrl_remove(struct platform_device *pdev)
-{
-	return wmt_pinctrl_remove(pdev);
-}
-
 static const struct of_device_id wmt_pinctrl_of_match[] = {
 	{ .compatible = "wm,wm8750-pinctrl" },
 	{ /* sentinel */ },
@@ -393,16 +388,10 @@ static const struct of_device_id wmt_pinctrl_of_match[] = {
 
 static struct platform_driver wmt_pinctrl_driver = {
 	.probe	= wm8750_pinctrl_probe,
-	.remove	= wm8750_pinctrl_remove,
 	.driver = {
 		.name	= "pinctrl-wm8750",
 		.of_match_table	= wmt_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(wmt_pinctrl_driver);
-
-MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
-MODULE_DESCRIPTION("Wondermedia WM8750 Pincontrol driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, wmt_pinctrl_of_match);
+builtin_platform_driver(wmt_pinctrl_driver);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8850.c b/drivers/pinctrl/vt8500/pinctrl-wm8850.c
index f232b163c735..45792aa7a06e 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8850.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8850.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -360,11 +360,6 @@ static int wm8850_pinctrl_probe(struct platform_device *pdev)
 	return wmt_pinctrl_probe(pdev, data);
 }
 
-static int wm8850_pinctrl_remove(struct platform_device *pdev)
-{
-	return wmt_pinctrl_remove(pdev);
-}
-
 static const struct of_device_id wmt_pinctrl_of_match[] = {
 	{ .compatible = "wm,wm8850-pinctrl" },
 	{ /* sentinel */ },
@@ -372,16 +367,10 @@ static const struct of_device_id wmt_pinctrl_of_match[] = {
 
 static struct platform_driver wmt_pinctrl_driver = {
 	.probe	= wm8850_pinctrl_probe,
-	.remove	= wm8850_pinctrl_remove,
 	.driver = {
 		.name	= "pinctrl-wm8850",
 		.of_match_table	= wmt_pinctrl_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(wmt_pinctrl_driver);
-
-MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
-MODULE_DESCRIPTION("Wondermedia WM8850 Pincontrol driver");
-MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, wmt_pinctrl_of_match);
+builtin_platform_driver(wmt_pinctrl_driver);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index cbc638631678..270ca2a47a8c 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -18,7 +18,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
@@ -608,12 +607,3 @@ fail_range:
 	gpiochip_remove(&data->gpio_chip);
 	return err;
 }
-
-int wmt_pinctrl_remove(struct platform_device *pdev)
-{
-	struct wmt_pinctrl_data *data = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&data->gpio_chip);
-
-	return 0;
-}
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.h b/drivers/pinctrl/vt8500/pinctrl-wmt.h
index 41f5f2deb5d6..885613396fe7 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.h
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.h
@@ -76,4 +76,3 @@ struct wmt_pinctrl_data {
 
 int wmt_pinctrl_probe(struct platform_device *pdev,
 		      struct wmt_pinctrl_data *data);
-int wmt_pinctrl_remove(struct platform_device *pdev);
-- 
2.7.4

