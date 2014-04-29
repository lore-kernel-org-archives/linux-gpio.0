From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 10/17] gpio: rc5t583: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:39:42 +0900
Message-ID: <003b01cf6386$90abcf20$b2036d60$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16159 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932884AbaD2Ijo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:39:44 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000T9AQ6AH80@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:39:42 +0900 (KST)
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
 drivers/gpio/gpio-rc5t583.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index 9b42317..562b0c4 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -119,10 +119,8 @@ static int rc5t583_gpio_probe(struct platform_device *pdev)
 
 	rc5t583_gpio = devm_kzalloc(&pdev->dev, sizeof(*rc5t583_gpio),
 					GFP_KERNEL);
-	if (!rc5t583_gpio) {
-		dev_warn(&pdev->dev, "Mem allocation for rc5t583_gpio failed");
+	if (!rc5t583_gpio)
 		return -ENOMEM;
-	}
 
 	rc5t583_gpio->gpio_chip.label = "gpio-rc5t583",
 	rc5t583_gpio->gpio_chip.owner = THIS_MODULE,
-- 
1.7.10.4


