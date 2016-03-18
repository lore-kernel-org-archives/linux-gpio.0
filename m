From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: octeon: Convert to use devm_ioremap_resource
Date: Fri, 18 Mar 2016 21:05:16 +0800
Message-ID: <1458306316.17098.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:36259 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754577AbcCRNFW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2016 09:05:22 -0400
Received: by mail-pf0-f172.google.com with SMTP id u190so167904618pfb.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2016 06:05:21 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Daney <david.daney@cavium.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-octeon.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 47aead1..9373d4e 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -83,6 +83,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	struct octeon_gpio *gpio;
 	struct gpio_chip *chip;
 	struct resource *res_mem;
+	void __iomem *reg_base;
 	int err = 0;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
@@ -91,21 +92,11 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip = &gpio->chip;
 
 	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res_mem == NULL) {
-		dev_err(&pdev->dev, "found no memory resource\n");
-		err = -ENXIO;
-		goto out;
-	}
-	if (!devm_request_mem_region(&pdev->dev, res_mem->start,
-					resource_size(res_mem),
-				     res_mem->name)) {
-		dev_err(&pdev->dev, "request_mem_region failed\n");
-		err = -ENXIO;
-		goto out;
-	}
-	gpio->register_base = (u64)devm_ioremap(&pdev->dev, res_mem->start,
-						resource_size(res_mem));
+	reg_base = devm_ioremap_resource(&pdev->dev, res_mem);
+	if (IS_ERR(reg_base))
+		return PTR_ERR(reg_base);
 
+	gpio->register_base = (u64)reg_base;
 	pdev->dev.platform_data = chip;
 	chip->label = "octeon-gpio";
 	chip->parent = &pdev->dev;
@@ -119,11 +110,10 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->set = octeon_gpio_set;
 	err = devm_gpiochip_add_data(&pdev->dev, chip, gpio);
 	if (err)
-		goto out;
+		return err;
 
 	dev_info(&pdev->dev, "OCTEON GPIO driver probed.\n");
-out:
-	return err;
+	return 0;
 }
 
 static struct of_device_id octeon_gpio_match[] = {
-- 
2.1.4



