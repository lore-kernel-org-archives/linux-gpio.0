From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 13/17] gpio: SPEAr: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:42:56 +0900
Message-ID: <003e01cf6387$047d77a0$0d7866e0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63661 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755311AbaD2Im5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:42:57 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S00HFOAVLHZC0@mailout2.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:42:57 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Shiraz Hashim' <shiraz.linux.kernel@gmail.com>, 'Viresh Kumar' <viresh.kumar@linaro.org>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-spear-spics.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 30bcc53..353263c 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -129,10 +129,8 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	int ret;
 
 	spics = devm_kzalloc(&pdev->dev, sizeof(*spics), GFP_KERNEL);
-	if (!spics) {
-		dev_err(&pdev->dev, "memory allocation fail\n");
+	if (!spics)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	spics->base = devm_ioremap_resource(&pdev->dev, res);
-- 
1.7.10.4


