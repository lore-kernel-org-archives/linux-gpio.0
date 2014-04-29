From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 09/17] gpio: palmas: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:39:07 +0900
Message-ID: <003a01cf6386$7c221690$746643b0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62580 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755863AbaD2IjJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:39:09 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S00GMKAP81JD0@mailout2.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:39:08 +0900 (KST)
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
 drivers/gpio/gpio-palmas.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index da9d332..a5ec602 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -173,10 +173,8 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 
 	palmas_gpio = devm_kzalloc(&pdev->dev,
 				sizeof(*palmas_gpio), GFP_KERNEL);
-	if (!palmas_gpio) {
-		dev_err(&pdev->dev, "Could not allocate palmas_gpio\n");
+	if (!palmas_gpio)
 		return -ENOMEM;
-	}
 
 	palmas_gpio->palmas = palmas;
 	palmas_gpio->gpio_chip.owner = THIS_MODULE;
-- 
1.7.10.4


