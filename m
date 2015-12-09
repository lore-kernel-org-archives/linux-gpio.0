From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 121/182] pinctrl: exynos5440: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:34:23 +0100
Message-ID: <1449668063-3532-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33747 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754193AbbLINe3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:34:29 -0500
Received: by lfaz4 with SMTP id z4so34336723lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:34:28 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos5440.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos5440.c b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
index f61f9a6fa9af..00ab63abf1d9 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos5440.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
@@ -15,7 +15,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -539,7 +539,7 @@ static const struct pinconf_ops exynos5440_pinconf_ops = {
 /* gpiolib gpio_set callback function */
 static void exynos5440_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 {
-	struct exynos5440_pinctrl_priv_data *priv = dev_get_drvdata(gc->parent);
+	struct exynos5440_pinctrl_priv_data *priv = gpiochip_get_data(gc);
 	void __iomem *base = priv->reg_base;
 	u32 data;
 
@@ -553,7 +553,7 @@ static void exynos5440_gpio_set(struct gpio_chip *gc, unsigned offset, int value
 /* gpiolib gpio_get callback function */
 static int exynos5440_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct exynos5440_pinctrl_priv_data *priv = dev_get_drvdata(gc->parent);
+	struct exynos5440_pinctrl_priv_data *priv = gpiochip_get_data(gc);
 	void __iomem *base = priv->reg_base;
 	u32 data;
 
@@ -566,7 +566,7 @@ static int exynos5440_gpio_get(struct gpio_chip *gc, unsigned offset)
 /* gpiolib gpio_direction_input callback function */
 static int exynos5440_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	struct exynos5440_pinctrl_priv_data *priv = dev_get_drvdata(gc->parent);
+	struct exynos5440_pinctrl_priv_data *priv = gpiochip_get_data(gc);
 	void __iomem *base = priv->reg_base;
 	u32 data;
 
@@ -586,7 +586,7 @@ static int exynos5440_gpio_direction_input(struct gpio_chip *gc, unsigned offset
 static int exynos5440_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 							int value)
 {
-	struct exynos5440_pinctrl_priv_data *priv = dev_get_drvdata(gc->parent);
+	struct exynos5440_pinctrl_priv_data *priv = gpiochip_get_data(gc);
 	void __iomem *base = priv->reg_base;
 	u32 data;
 
@@ -607,7 +607,7 @@ static int exynos5440_gpio_direction_output(struct gpio_chip *gc, unsigned offse
 /* gpiolib gpio_to_irq callback function */
 static int exynos5440_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct exynos5440_pinctrl_priv_data *priv = dev_get_drvdata(gc->parent);
+	struct exynos5440_pinctrl_priv_data *priv = gpiochip_get_data(gc);
 	unsigned int virq;
 
 	if (offset < 16 || offset > 23)
@@ -825,7 +825,7 @@ static int exynos5440_gpiolib_register(struct platform_device *pdev,
 	gc->to_irq = exynos5440_gpio_to_irq;
 	gc->label = "gpiolib-exynos5440";
 	gc->owner = THIS_MODULE;
-	ret = gpiochip_add(gc);
+	ret = gpiochip_add_data(gc, priv);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register gpio_chip %s, error "
 					"code: %d\n", gc->label, ret);
-- 
2.4.3

