From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: tb10x: Fix checking return value of
 devm_ioremap_resource
Date: Thu, 31 Oct 2013 10:01:45 +0800
Message-ID: <1383184905.13635.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:55591 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730Ab3JaCBw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2013 22:01:52 -0400
Received: by mail-pd0-f171.google.com with SMTP id w10so1790501pde.16
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2013 19:01:51 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, linux-gpio@vger.kernel.org

Also move platform_get_resource() call close to devm_ioremap_resource().
The implementation of devm_ioremap_resource() will also check mem parameter
and emit proper error.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tb10x.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 833d0f4..45bfed1 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -194,23 +194,16 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	if (of_property_read_u32(dn, "abilis,ngpio", &ngpio))
 		return -EINVAL;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(&pdev->dev, "No memory resource defined.\n");
-		return -EINVAL;
-	}
-
 	tb10x_gpio = devm_kzalloc(&pdev->dev, sizeof(*tb10x_gpio), GFP_KERNEL);
 	if (tb10x_gpio == NULL)
 		return -ENOMEM;
 
 	spin_lock_init(&tb10x_gpio->spinlock);
 
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	tb10x_gpio->base = devm_ioremap_resource(&pdev->dev, mem);
-	if (!tb10x_gpio->base) {
-		dev_err(&pdev->dev, "Could not remap reg space.\n");
-		goto fail_ioremap;
-	}
+	if (IS_ERR(tb10x_gpio->base))
+		return PTR_ERR(tb10x_gpio->base);
 
 	tb10x_gpio->gc.label		= of_node_full_name(dn);
 	tb10x_gpio->gc.dev		= &pdev->dev;
@@ -285,7 +278,6 @@ fail_request_irq:
 fail_get_irq:
 	gpiochip_remove(&tb10x_gpio->gc);
 fail_gpiochip_registration:
-fail_ioremap:
 	return ret;
 }
 
-- 
1.8.1.2



