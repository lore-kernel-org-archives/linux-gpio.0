From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] gpio: ep93xx: Use devm_ioremap_resource()
Date: Tue, 27 May 2014 15:25:51 +0900
Message-ID: <000801cf7974$81763a50$8462aef0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12445 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750873AbaE0G0B (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 02:26:01 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N67003JEZ73Z930@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 27 May 2014 15:25:51 +0900 (KST)
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 'Alexandre Courbot' <gnurou@gmail.com>, 'Abdoulaye Berthe' <berthe.ab@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

Use devm_ioremap_resource() because devm_request_and_ioremap() is
obsoleted by devm_ioremap_resource().

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-ep93xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index dd39f27..dcc2bb4 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -352,7 +352,7 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ep93xx_gpio->mmio_base = devm_request_and_ioremap(dev, res);
+	ep93xx_gpio->mmio_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(ep93xx_gpio->mmio_base))
 		return PTR_ERR(ep93xx_gpio->mmio_base);
 
-- 
1.7.10.4


