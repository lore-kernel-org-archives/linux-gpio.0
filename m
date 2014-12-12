From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: vx855: Switch to use managed resources APIs
Date: Fri, 12 Dec 2014 12:17:41 +0800
Message-ID: <1418357861.1093.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:46978 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759586AbaLLERq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Dec 2014 23:17:46 -0500
Received: by mail-pa0-f46.google.com with SMTP id lf10so5787594pab.5
        for <linux-gpio@vger.kernel.org>; Thu, 11 Dec 2014 20:17:45 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Harald Welte <HaraldWelte@viatech.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Use devm_* APIs to simplify the code a bit.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-vx855.c | 44 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 9d21d2f..57b470d 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -52,8 +52,6 @@ struct vx855_gpio {
 	spinlock_t lock;
 	u32 io_gpi;
 	u32 io_gpo;
-	bool gpi_reserved;
-	bool gpo_reserved;
 };
 
 /* resolve a GPIx into the corresponding bit position */
@@ -224,14 +222,13 @@ static int vx855gpio_probe(struct platform_device *pdev)
 	struct resource *res_gpi;
 	struct resource *res_gpo;
 	struct vx855_gpio *vg;
-	int ret;
 
 	res_gpi = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	res_gpo = platform_get_resource(pdev, IORESOURCE_IO, 1);
 	if (!res_gpi || !res_gpo)
 		return -EBUSY;
 
-	vg = kzalloc(sizeof(*vg), GFP_KERNEL);
+	vg = devm_kzalloc(&pdev->dev, sizeof(*vg), GFP_KERNEL);
 	if (!vg)
 		return -ENOMEM;
 
@@ -250,56 +247,27 @@ static int vx855gpio_probe(struct platform_device *pdev)
 	 * succeed. Ignore and continue.
 	 */
 
-	if (!request_region(res_gpi->start, resource_size(res_gpi),
-			MODULE_NAME "_gpi"))
+	if (!devm_request_region(&pdev->dev, res_gpi->start,
+				 resource_size(res_gpi), MODULE_NAME "_gpi"))
 		dev_warn(&pdev->dev,
 			"GPI I/O resource busy, probably claimed by ACPI\n");
-	else
-		vg->gpi_reserved = true;
 
-	if (!request_region(res_gpo->start, resource_size(res_gpo),
-			MODULE_NAME "_gpo"))
+	if (!devm_request_region(&pdev->dev, res_gpo->start,
+				 resource_size(res_gpo), MODULE_NAME "_gpo"))
 		dev_warn(&pdev->dev,
 			"GPO I/O resource busy, probably claimed by ACPI\n");
-	else
-		vg->gpo_reserved = true;
 
 	vx855gpio_gpio_setup(vg);
 
-	ret = gpiochip_add(&vg->gpio);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register GPIOs\n");
-		goto out_release;
-	}
-
-	return 0;
-
-out_release:
-	if (vg->gpi_reserved)
-		release_region(res_gpi->start, resource_size(res_gpi));
-	if (vg->gpo_reserved)
-		release_region(res_gpi->start, resource_size(res_gpo));
-	kfree(vg);
-	return ret;
+	return gpiochip_add(&vg->gpio);
 }
 
 static int vx855gpio_remove(struct platform_device *pdev)
 {
 	struct vx855_gpio *vg = platform_get_drvdata(pdev);
-	struct resource *res;
 
 	gpiochip_remove(&vg->gpio);
 
-	if (vg->gpi_reserved) {
-		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
-		release_region(res->start, resource_size(res));
-	}
-	if (vg->gpo_reserved) {
-		res = platform_get_resource(pdev, IORESOURCE_IO, 1);
-		release_region(res->start, resource_size(res));
-	}
-
-	kfree(vg);
 	return 0;
 }
 
-- 
1.9.1



