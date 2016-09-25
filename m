From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: max77620: Remove unused fields from struct max77620_gpio
Date: Sun, 25 Sep 2016 20:44:04 +0800
Message-ID: <1474807444-6841-1-git-send-email-axel.lin@ingics.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:34004 "EHLO
        mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966135AbcIYMoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2016 08:44:15 -0400
Received: by mail-pa0-f67.google.com with SMTP id hm5so313283pac.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2016 05:44:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

Current code does not use gpio_irq/irq_base/gpio_base fields from
struct max77620_gpio, so remove them.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-max77620.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index b46b436..df03586 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -21,9 +21,6 @@ struct max77620_gpio {
 	struct gpio_chip	gpio_chip;
 	struct regmap		*rmap;
 	struct device		*dev;
-	int			gpio_irq;
-	int			irq_base;
-	int			gpio_base;
 };
 
 static const struct regmap_irq max77620_gpio_irqs[] = {
@@ -254,7 +251,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 
 	mgpio->rmap = chip->rmap;
 	mgpio->dev = &pdev->dev;
-	mgpio->gpio_irq = gpio_irq;
 
 	mgpio->gpio_chip.label = pdev->name;
 	mgpio->gpio_chip.parent = &pdev->dev;
@@ -268,7 +264,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
-	mgpio->irq_base = -1;
 #ifdef CONFIG_OF_GPIO
 	mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
 #endif
@@ -281,9 +276,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mgpio->gpio_base = mgpio->gpio_chip.base;
-	ret = devm_regmap_add_irq_chip(&pdev->dev, chip->rmap, mgpio->gpio_irq,
-				       IRQF_ONESHOT, mgpio->irq_base,
+	ret = devm_regmap_add_irq_chip(&pdev->dev, chip->rmap, gpio_irq,
+				       IRQF_ONESHOT, -1,
 				       &max77620_gpio_irq_chip,
 				       &chip->gpio_irq_data);
 	if (ret < 0) {
-- 
2.7.4

