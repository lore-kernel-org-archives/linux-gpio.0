From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio v2 3/3] gpio: gpio-tb10x: remove duplicate check on resource
Date: Tue, 28 Oct 2014 12:07:07 +0530
Message-ID: <1414478227-24674-4-git-send-email-varkab@cdac.in>
References: <1414478227-24674-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:39594 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751620AbaJ1GkV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 02:40:21 -0400
Received: by mail-pd0-f174.google.com with SMTP id p10so26858pdj.33
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 23:40:20 -0700 (PDT)
In-Reply-To: <1414478227-24674-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, Varka Bhadram <varkab@cdac.in>

Sanity check on resource happening with devm_ioremap_resource().

Signed-off-by: Varka Bhadram <varkab@cdac.in>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-tb10x.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 9e615be..8b1e8c0 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -195,18 +195,13 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
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
 	if (IS_ERR(tb10x_gpio->base))
 		return PTR_ERR(tb10x_gpio->base);
-- 
1.7.9.5

