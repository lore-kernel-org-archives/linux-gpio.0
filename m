From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 07/17] gpio: moxart: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:37:09 +0900
Message-ID: <003801cf6386$36044250$a20cc6f0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15526 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932845AbaD2IhL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:37:11 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000F4ALYGK80@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:37:10 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Jonas Jensen' <jonas.jensen@gmail.com>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-moxart.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index ccd4570..4661e18 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -113,10 +113,8 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 	int ret;
 
 	mgc = devm_kzalloc(dev, sizeof(*mgc), GFP_KERNEL);
-	if (!mgc) {
-		dev_err(dev, "can't allocate GPIO chip container\n");
+	if (!mgc)
 		return -ENOMEM;
-	}
 	mgc->gpio = moxart_template_chip;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.7.10.4


