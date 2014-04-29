From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 08/17] gpio: mvebu: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:38:21 +0900
Message-ID: <003901cf6386$607ce8c0$2176ba40$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62392 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755796AbaD2IiW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:38:22 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S00HZJANX5BB0@mailout2.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:38:21 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>, 'Jason Cooper' <jason@lakedaemon.net>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-mvebu.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index d425094..4d398ff 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -574,10 +574,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		soc_variant = MVEBU_GPIO_SOC_VARIANT_ORION;
 
 	mvchip = devm_kzalloc(&pdev->dev, sizeof(struct mvebu_gpio_chip), GFP_KERNEL);
-	if (!mvchip) {
-		dev_err(&pdev->dev, "Cannot allocate memory\n");
+	if (!mvchip)
 		return -ENOMEM;
-	}
 
 	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios)) {
 		dev_err(&pdev->dev, "Missing ngpios OF property\n");
-- 
1.7.10.4


