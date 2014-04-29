From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 15/17] gpio: tps6586x: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:44:48 +0900
Message-ID: <004001cf6387$478ea820$d6abf860$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17622 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755311AbaD2Iou (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:44:50 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S0007VAYPGK90@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:44:49 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Laxman Dewangan' <ldewangan@nvidia.com>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-tps6586x.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 8994dfa..a69fbea 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -97,10 +97,8 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 	pdata = dev_get_platdata(pdev->dev.parent);
 	tps6586x_gpio = devm_kzalloc(&pdev->dev,
 				sizeof(*tps6586x_gpio), GFP_KERNEL);
-	if (!tps6586x_gpio) {
-		dev_err(&pdev->dev, "Could not allocate tps6586x_gpio\n");
+	if (!tps6586x_gpio)
 		return -ENOMEM;
-	}
 
 	tps6586x_gpio->parent = pdev->dev.parent;
 
-- 
1.7.10.4


