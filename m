From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 16/17] gpio: tps65910: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:45:46 +0900
Message-ID: <004101cf6387$6a26dba0$3e7492e0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17953 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbaD2Ips (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:45:48 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000PDB0BWJ80@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:45:47 +0900 (KST)
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
 drivers/gpio/gpio-tps65910.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index b6e818e..e2f8cda 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -123,10 +123,8 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 
 	tps65910_gpio = devm_kzalloc(&pdev->dev,
 				sizeof(*tps65910_gpio), GFP_KERNEL);
-	if (!tps65910_gpio) {
-		dev_err(&pdev->dev, "Could not allocate tps65910_gpio\n");
+	if (!tps65910_gpio)
 		return -ENOMEM;
-	}
 
 	tps65910_gpio->tps65910 = tps65910;
 
-- 
1.7.10.4


