From: Sanjeev Sharma <sanjeev_sharma@mentor.com>
Subject: [PATCH] pinctrl:Convert the composition of devm_request_mem_region and devm_ioremap to a single call
Date: Fri, 30 Oct 2015 13:21:18 +0530
Message-ID: <1446191478-22714-1-git-send-email-sanjeev_sharma@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:63982 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758295AbbJ3Hwq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 03:52:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sanjeev Sharma <sanjeev_sharma@mentor.com>

Use devm_ioremap_resource() in order to make the code simpler,
and remove redundant return value check of platform_get_resource()
because this value is alreadytaken care by devm_ioremap_resource()

Signed-off-by: Sanjeev Sharma <sanjeev_sharma@mentor.com>
---
 drivers/pinctrl/pinctrl-single.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index ef04b96..905cc0a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1865,24 +1865,9 @@ static int pcs_probe(struct platform_device *pdev)
 						  "pinctrl-single,bit-per-mux");
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(pcs->dev, "could not get resource\n");
-		return -ENODEV;
-	}
-
-	pcs->res = devm_request_mem_region(pcs->dev, res->start,
-			resource_size(res), DRIVER_NAME);
-	if (!pcs->res) {
-		dev_err(pcs->dev, "could not get mem_region\n");
-		return -EBUSY;
-	}
-
-	pcs->size = resource_size(pcs->res);
-	pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
-	if (!pcs->base) {
-		dev_err(pcs->dev, "could not ioremap\n");
-		return -ENODEV;
-	}
+	pcs->base = devm_ioremap_resource(pcs->dev, res);
+	if (IS_ERR(pcs->base))
+		return PTR_ERR(pcs->base);
 
 	INIT_RADIX_TREE(&pcs->pgtree, GFP_KERNEL);
 	INIT_RADIX_TREE(&pcs->ftree, GFP_KERNEL);
-- 
1.7.11.7

