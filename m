From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/4] gpio: tc3589x: use managed resources
Date: Wed,  9 Apr 2014 13:48:51 +0200
Message-ID: <1397044131-19262-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:35029 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932482AbaDILs4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Apr 2014 07:48:56 -0400
Received: by mail-wg0-f45.google.com with SMTP id l18so2315781wgh.28
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2014 04:48:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Grab state container and irq using the devm_* functions and save
some lines of hairy clean-up code.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 1019320984d7..113e50cb1f59 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -329,7 +329,8 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	tc3589x_gpio = kzalloc(sizeof(struct tc3589x_gpio), GFP_KERNEL);
+	tc3589x_gpio = devm_kzalloc(&pdev->dev, sizeof(struct tc3589x_gpio),
+				    GFP_KERNEL);
 	if (!tc3589x_gpio)
 		return -ENOMEM;
 
@@ -354,23 +355,25 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	ret = tc3589x_set_bits(tc3589x, TC3589x_RSTCTRL,
 			       TC3589x_RSTCTRL_GPIRST, 0);
 	if (ret < 0)
-		goto out_free;
+		return ret;
 
 	ret = tc3589x_gpio_irq_init(tc3589x_gpio, np);
 	if (ret)
-		goto out_free;
+		return ret;
 
-	ret = request_threaded_irq(irq, NULL, tc3589x_gpio_irq, IRQF_ONESHOT,
-				   "tc3589x-gpio", tc3589x_gpio);
+	ret = devm_request_threaded_irq(&pdev->dev,
+					irq, NULL, tc3589x_gpio_irq,
+					IRQF_ONESHOT, "tc3589x-gpio",
+					tc3589x_gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
-		goto out_free;
+		return ret;
 	}
 
 	ret = gpiochip_add(&tc3589x_gpio->chip);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
-		goto out_freeirq;
+		return ret;
 	}
 
 	if (pdata && pdata->setup)
@@ -379,12 +382,6 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tc3589x_gpio);
 
 	return 0;
-
-out_freeirq:
-	free_irq(irq, tc3589x_gpio);
-out_free:
-	kfree(tc3589x_gpio);
-	return ret;
 }
 
 static int tc3589x_gpio_remove(struct platform_device *pdev)
@@ -392,7 +389,6 @@ static int tc3589x_gpio_remove(struct platform_device *pdev)
 	struct tc3589x_gpio *tc3589x_gpio = platform_get_drvdata(pdev);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	struct tc3589x_gpio_platform_data *pdata = tc3589x->pdata->gpio;
-	int irq = platform_get_irq(pdev, 0);
 	int ret;
 
 	if (pdata && pdata->remove)
@@ -405,10 +401,6 @@ static int tc3589x_gpio_remove(struct platform_device *pdev)
 		return ret;
 	}
 
-	free_irq(irq, tc3589x_gpio);
-
-	kfree(tc3589x_gpio);
-
 	return 0;
 }
 
-- 
1.9.0

