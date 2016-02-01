From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 5/7] gpio: ich: Use devm_request_region
Date: Mon,  1 Feb 2016 18:54:30 -0500
Message-ID: <b571d44893f3295810820f751eb845493560296a.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Tyser <ptyser@xes-inc.com>
List-Id: linux-gpio@vger.kernel.org

By the time request_region is called in the Intel ICH series GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Cc: Peter Tyser <ptyser@xes-inc.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-ich.c | 51 +++++++++----------------------------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index a489338..4f6d643 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -20,6 +20,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/gpio.h>
@@ -384,8 +385,8 @@ static struct ichx_desc avoton_desc = {
 	.use_outlvl_cache = true,
 };
 
-static int ichx_gpio_request_regions(struct resource *res_base,
-						const char *name, u8 use_gpio)
+static int ichx_gpio_request_regions(struct device *dev,
+	struct resource *res_base, const char *name, u8 use_gpio)
 {
 	int i;
 
@@ -395,34 +396,12 @@ static int ichx_gpio_request_regions(struct resource *res_base,
 	for (i = 0; i < ARRAY_SIZE(ichx_priv.desc->regs[0]); i++) {
 		if (!(use_gpio & (1 << i)))
 			continue;
-		if (!request_region(
+		if (!devm_request_region(dev,
 				res_base->start + ichx_priv.desc->regs[0][i],
 				ichx_priv.desc->reglen[i], name))
-			goto request_err;
+			return -EBUSY;
 	}
 	return 0;
-
-request_err:
-	/* Clean up: release already requested regions, if any */
-	for (i--; i >= 0; i--) {
-		if (!(use_gpio & (1 << i)))
-			continue;
-		release_region(res_base->start + ichx_priv.desc->regs[0][i],
-			       ichx_priv.desc->reglen[i]);
-	}
-	return -EBUSY;
-}
-
-static void ichx_gpio_release_regions(struct resource *res_base, u8 use_gpio)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ichx_priv.desc->regs[0]); i++) {
-		if (!(use_gpio & (1 << i)))
-			continue;
-		release_region(res_base->start + ichx_priv.desc->regs[0][i],
-			       ichx_priv.desc->reglen[i]);
-	}
 }
 
 static int ichx_gpio_probe(struct platform_device *pdev)
@@ -468,7 +447,7 @@ static int ichx_gpio_probe(struct platform_device *pdev)
 	spin_lock_init(&ichx_priv.lock);
 	res_base = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_GPIO);
 	ichx_priv.use_gpio = ich_info->use_gpio;
-	err = ichx_gpio_request_regions(res_base, pdev->name,
+	err = ichx_gpio_request_regions(&pdev->dev, res_base, pdev->name,
 					ichx_priv.use_gpio);
 	if (err)
 		return err;
@@ -489,8 +468,8 @@ static int ichx_gpio_probe(struct platform_device *pdev)
 		goto init;
 	}
 
-	if (!request_region(res_pm->start, resource_size(res_pm),
-			pdev->name)) {
+	if (!devm_request_region(&pdev->dev, res_pm->start,
+			resource_size(res_pm), pdev->name)) {
 		pr_warn("ACPI BAR is busy, GPI 0 - 15 unavailable\n");
 		goto init;
 	}
@@ -502,31 +481,19 @@ init:
 	err = gpiochip_add_data(&ichx_priv.chip, NULL);
 	if (err) {
 		pr_err("Failed to register GPIOs\n");
-		goto add_err;
+		return err;
 	}
 
 	pr_info("GPIO from %d to %d on %s\n", ichx_priv.chip.base,
 	       ichx_priv.chip.base + ichx_priv.chip.ngpio - 1, DRV_NAME);
 
 	return 0;
-
-add_err:
-	ichx_gpio_release_regions(ichx_priv.gpio_base, ichx_priv.use_gpio);
-	if (ichx_priv.pm_base)
-		release_region(ichx_priv.pm_base->start,
-				resource_size(ichx_priv.pm_base));
-	return err;
 }
 
 static int ichx_gpio_remove(struct platform_device *pdev)
 {
 	gpiochip_remove(&ichx_priv.chip);
 
-	ichx_gpio_release_regions(ichx_priv.gpio_base, ichx_priv.use_gpio);
-	if (ichx_priv.pm_base)
-		release_region(ichx_priv.pm_base->start,
-				resource_size(ichx_priv.pm_base));
-
 	return 0;
 }
 
-- 
2.4.10
