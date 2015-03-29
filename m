From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] gpio: x-gene: fix devm_ioremap_resource() check
Date: Sun, 29 Mar 2015 05:37:20 +0300
Message-ID: <1427596640-13319-1-git-send-email-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from li271-223.members.linode.com ([178.79.152.223]:41939 "EHLO
	mail.mleia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752349AbbC2CrS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 28 Mar 2015 22:47:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

devm_ioremap_resource() returns IOMEM_ERR_PTR() and it never
returns NULL, fix the check to prevent access to invalid
virtual address.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/gpio/gpio-xgene-sb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index b6a15c3..fb9d29a 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -93,7 +93,7 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(&pdev->dev, res);
-	if (!regs)
+	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
 	ret = bgpio_init(&priv->bgc, &pdev->dev, 4,
-- 
1.7.10.4

