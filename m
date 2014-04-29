From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 03/17] gpio: davinci: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:33:26 +0900
Message-ID: <003401cf6385$b08d8aa0$11a89fe0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60995 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971AbaD2Id1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:33:27 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S00HD8AFQ5BB0@mailout2.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:33:26 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Alexander Holler' <holler@ahsoftware.de>, 'Grygorii Strashko' <grygorii.strashko@ti.com>, 'Santosh Shilimkar' <santosh.shilimkar@ti.com>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-davinci.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 339f9da..9f06825 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -230,10 +230,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	chips = devm_kzalloc(dev,
 			     ngpio * sizeof(struct davinci_gpio_controller),
 			     GFP_KERNEL);
-	if (!chips) {
-		dev_err(dev, "Memory allocation failed\n");
+	if (!chips)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-- 
1.7.10.4


