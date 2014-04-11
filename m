From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: rdc321x: Convert to use devm_kzalloc
Date: Fri, 11 Apr 2014 14:16:01 +0800
Message-ID: <1397196961.12922.4.camel@phoenix>
References: <1397196885.12922.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:36321 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754936AbaDKGQH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Apr 2014 02:16:07 -0400
Received: by mail-vc0-f172.google.com with SMTP id la4so4451442vcb.31
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 23:16:06 -0700 (PDT)
In-Reply-To: <1397196885.12922.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <florian@openwrt.org>, linux-gpio@vger.kernel.org

This saves a few unwind code.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-rdc321x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index 9e7da2d..3027591 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -141,7 +141,8 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	rdc321x_gpio_dev = kzalloc(sizeof(struct rdc321x_gpio), GFP_KERNEL);
+	rdc321x_gpio_dev = devm_kzalloc(&pdev->dev, sizeof(struct rdc321x_gpio),
+					GFP_KERNEL);
 	if (!rdc321x_gpio_dev) {
 		dev_err(&pdev->dev, "failed to allocate private data\n");
 		return -ENOMEM;
@@ -150,8 +151,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 	r = platform_get_resource_byname(pdev, IORESOURCE_IO, "gpio-reg1");
 	if (!r) {
 		dev_err(&pdev->dev, "failed to get gpio-reg1 resource\n");
-		err = -ENODEV;
-		goto out_free;
+		return -ENODEV;
 	}
 
 	spin_lock_init(&rdc321x_gpio_dev->lock);
@@ -162,8 +162,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 	r = platform_get_resource_byname(pdev, IORESOURCE_IO, "gpio-reg2");
 	if (!r) {
 		dev_err(&pdev->dev, "failed to get gpio-reg2 resource\n");
-		err = -ENODEV;
-		goto out_free;
+		return -ENODEV;
 	}
 
 	rdc321x_gpio_dev->reg2_ctrl_base = r->start;
@@ -187,21 +186,17 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 					rdc321x_gpio_dev->reg1_data_base,
 					&rdc321x_gpio_dev->data_reg[0]);
 	if (err)
-		goto out_free;
+		return err;
 
 	err = pci_read_config_dword(rdc321x_gpio_dev->sb_pdev,
 					rdc321x_gpio_dev->reg2_data_base,
 					&rdc321x_gpio_dev->data_reg[1]);
 	if (err)
-		goto out_free;
+		return err;
 
 	dev_info(&pdev->dev, "registering %d GPIOs\n",
 					rdc321x_gpio_dev->chip.ngpio);
 	return gpiochip_add(&rdc321x_gpio_dev->chip);
-
-out_free:
-	kfree(rdc321x_gpio_dev);
-	return err;
 }
 
 static int rdc321x_gpio_remove(struct platform_device *pdev)
@@ -213,8 +208,6 @@ static int rdc321x_gpio_remove(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "failed to unregister chip\n");
 
-	kfree(rdc321x_gpio_dev);
-
 	return ret;
 }
 
-- 
1.8.3.2



