From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 1/2] gpio/omap: Use devm_ioremap_resource()
Date: Wed, 12 Feb 2014 11:51:38 +0900
Message-ID: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47395 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818AbaBLCvm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2014 21:51:42 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0V0076L3Y2HM90@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 12 Feb 2014 11:51:38 +0900 (KST)
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Santosh Shilimkar' <santosh.shilimkar@ti.com>, 'Kevin Hilman' <khilman@deeprootsystems.com>, 'Jingoo Han' <jg1.han@samsung.com>

Use devm_ioremap_resource() in order to make the code simpler,
and remove redundant return value check of platform_get_resource()
because the value is checked by devm_ioremap_resource().

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-omap.c |   20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 4243190..19b886c 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1214,24 +1214,10 @@ static int omap_gpio_probe(struct platform_device *pdev)
 
 	/* Static mapping, never released */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (unlikely(!res)) {
-		dev_err(dev, "Invalid mem resource\n");
-		irq_domain_remove(bank->domain);
-		return -ENODEV;
-	}
-
-	if (!devm_request_mem_region(dev, res->start, resource_size(res),
-				     pdev->name)) {
-		dev_err(dev, "Region already claimed\n");
+	bank->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(bank->base)) {
 		irq_domain_remove(bank->domain);
-		return -EBUSY;
-	}
-
-	bank->base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!bank->base) {
-		dev_err(dev, "Could not ioremap\n");
-		irq_domain_remove(bank->domain);
-		return -ENOMEM;
+		return PTR_ERR(bank->base);
 	}
 
 	platform_set_drvdata(pdev, bank);
-- 
1.7.10.4


