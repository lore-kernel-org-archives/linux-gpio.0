From: Pramod Gurav <pramod.gurav@smartplayin.com>
Subject: [PATCH v2] gpio: cs5535: Switch to using managed resources with devm_
Date: Tue,  7 Oct 2014 12:35:16 +0530
Message-ID: <1412665516-3796-1-git-send-email-pramod.gurav@smartplayin.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp90.ord1c.emailsrvr.com ([108.166.43.90]:58662 "EHLO
	smtp90.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751223AbaJGHBs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Oct 2014 03:01:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

This change switches to devm_request_region to request region
and hence simplifies the module unload and does away with
release_region in remove function.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---

Changes since v1:

Change commit subject to reflect cs5535.

 drivers/gpio/gpio-cs5535.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 668127f..71484ee 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -322,7 +322,8 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
 		goto done;
 	}
 
-	if (!request_region(res->start, resource_size(res), pdev->name)) {
+	if (!devm_request_region(&pdev->dev, res->start, resource_size(res),
+				 pdev->name)) {
 		dev_err(&pdev->dev, "can't request region\n");
 		goto done;
 	}
@@ -348,24 +349,18 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
 	/* finally, register with the generic GPIO API */
 	err = gpiochip_add(&cs5535_gpio_chip.chip);
 	if (err)
-		goto release_region;
+		goto done;
 
 	return 0;
 
-release_region:
-	release_region(res->start, resource_size(res));
 done:
 	return err;
 }
 
 static int cs5535_gpio_remove(struct platform_device *pdev)
 {
-	struct resource *r;
-
 	gpiochip_remove(&cs5535_gpio_chip.chip);
 
-	r = platform_get_resource(pdev, IORESOURCE_IO, 0);
-	release_region(r->start, resource_size(r));
 	return 0;
 }
 
-- 
1.7.9.5

