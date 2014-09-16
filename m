From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: remove remaining users of gpiochip_remove() retval
Date: Tue, 16 Sep 2014 15:12:14 -0700
Message-ID: <1410905534-22650-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:56901 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753319AbaIPWMX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Sep 2014 18:12:23 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so702653pad.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2014 15:12:22 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Some drivers accidentally still use the return value from
gpiochip_remove(). Get rid of them so we can simplify this function
and get rid of the return value.

Abdoulaye Berthe <berthe.ab@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-crystalcove.c | 9 +++------
 drivers/gpio/gpio-omap.c        | 2 +-
 drivers/gpio/gpio-xgene.c       | 7 ++-----
 drivers/gpio/gpio-zynq.c        | 8 +-------
 4 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 934462f5bd22..e3712f0e51ab 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -346,7 +346,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	return 0;
 
 out_remove_gpio:
-	WARN_ON(gpiochip_remove(&cg->chip));
+	gpiochip_remove(&cg->chip);
 	return retval;
 }
 
@@ -354,14 +354,11 @@ static int crystalcove_gpio_remove(struct platform_device *pdev)
 {
 	struct crystalcove_gpio *cg = platform_get_drvdata(pdev);
 	int irq = platform_get_irq(pdev, 0);
-	int err;
-
-	err = gpiochip_remove(&cg->chip);
 
+	gpiochip_remove(&cg->chip);
 	if (irq >= 0)
 		free_irq(irq, cg);
-
-	return err;
+	return 0;
 }
 
 static struct platform_driver crystalcove_gpio_driver = {
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 174932165fcb..5cd33677a018 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1143,7 +1143,7 @@ static int omap_gpio_chip_init(struct gpio_bank *bank)
 
 	if (ret) {
 		dev_err(bank->dev, "Couldn't add irqchip to gpiochip %d\n", ret);
-		ret = gpiochip_remove(&bank->chip);
+		gpiochip_remove(&bank->chip);
 		return -ENODEV;
 	}
 
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index e25ba14fbb64..f1944d496c3b 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -216,12 +216,9 @@ err:
 static int xgene_gpio_remove(struct platform_device *pdev)
 {
 	struct xgene_gpio *gpio = platform_get_drvdata(pdev);
-	int ret = 0;
 
-	ret = gpiochip_remove(&gpio->chip);
-	if (ret)
-		dev_err(&pdev->dev, "unable to remove gpio_chip.\n");
-	return ret;
+	gpiochip_remove(&gpio->chip);
+	return 0;
 }
 
 #ifdef CONFIG_OF
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 5dfbced24815..74cd480bf8de 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -686,16 +686,10 @@ err_disable_clk:
  */
 static int zynq_gpio_remove(struct platform_device *pdev)
 {
-	int ret;
 	struct zynq_gpio *gpio = platform_get_drvdata(pdev);
 
 	pm_runtime_get_sync(&pdev->dev);
-
-	ret = gpiochip_remove(&gpio->chip);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to remove gpio chip\n");
-		return ret;
-	}
+	gpiochip_remove(&gpio->chip);
 	clk_disable_unprepare(gpio->clk);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	return 0;
-- 
1.9.3

