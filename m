From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc3589x: get rid of platform data
Date: Mon, 15 Dec 2014 10:42:02 +0100
Message-ID: <1418636522-21296-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:64858 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751156AbaLOJmL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Dec 2014 04:42:11 -0500
Received: by mail-wi0-f182.google.com with SMTP id h11so8334216wiw.9
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2014 01:42:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>

This device is only used from the device tree, and the startup()
and remove() callbacks are not used anywhere in the kernel, so
retire them and the pdata altogether.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
MFD folks: this only considers GPIO but touches your include
file, please ACK this so I can take it through the GPIO tree.
---
 drivers/gpio/gpio-tc3589x.c | 15 ++-------------
 include/linux/mfd/tc3589x.h | 12 ------------
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index abdcf58935f5..11aed2671065 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -232,16 +232,13 @@ static irqreturn_t tc3589x_gpio_irq(int irq, void *dev)
 static int tc3589x_gpio_probe(struct platform_device *pdev)
 {
 	struct tc3589x *tc3589x = dev_get_drvdata(pdev->dev.parent);
-	struct tc3589x_gpio_platform_data *pdata;
 	struct device_node *np = pdev->dev.of_node;
 	struct tc3589x_gpio *tc3589x_gpio;
 	int ret;
 	int irq;
 
-	pdata = tc3589x->pdata->gpio;
-
-	if (!(pdata || np)) {
-		dev_err(&pdev->dev, "No platform data or Device Tree found\n");
+	if (!np) {
+		dev_err(&pdev->dev, "No Device Tree node found\n");
 		return -EINVAL;
 	}
 
@@ -305,9 +302,6 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 				     irq,
 				     NULL);
 
-	if (pdata && pdata->setup)
-		pdata->setup(tc3589x, tc3589x_gpio->chip.base);
-
 	platform_set_drvdata(pdev, tc3589x_gpio);
 
 	return 0;
@@ -316,11 +310,6 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 static int tc3589x_gpio_remove(struct platform_device *pdev)
 {
 	struct tc3589x_gpio *tc3589x_gpio = platform_get_drvdata(pdev);
-	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
-	struct tc3589x_gpio_platform_data *pdata = tc3589x->pdata->gpio;
-
-	if (pdata && pdata->remove)
-		pdata->remove(tc3589x, tc3589x_gpio->chip.base);
 
 	gpiochip_remove(&tc3589x_gpio->chip);
 
diff --git a/include/linux/mfd/tc3589x.h b/include/linux/mfd/tc3589x.h
index e1c12d84c26a..c203c9c56776 100644
--- a/include/linux/mfd/tc3589x.h
+++ b/include/linux/mfd/tc3589x.h
@@ -163,24 +163,12 @@ struct tc3589x_keypad_platform_data {
 };
 
 /**
- * struct tc3589x_gpio_platform_data - TC3589x GPIO platform data
- * @setup: callback for board-specific initialization
- * @remove: callback for board-specific teardown
- */
-struct tc3589x_gpio_platform_data {
-	void (*setup)(struct tc3589x *tc3589x, unsigned gpio_base);
-	void (*remove)(struct tc3589x *tc3589x, unsigned gpio_base);
-};
-
-/**
  * struct tc3589x_platform_data - TC3589x platform data
  * @block: bitmask of blocks to enable (use TC3589x_BLOCK_*)
- * @gpio: GPIO-specific platform data
  * @keypad: keypad-specific platform data
  */
 struct tc3589x_platform_data {
 	unsigned int block;
-	struct tc3589x_gpio_platform_data *gpio;
 	const struct tc3589x_keypad_platform_data *keypad;
 };
 
-- 
1.9.3

