From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 17/17] gpio: zevio: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:46:22 +0900
Message-ID: <004201cf6387$7fa83aa0$7ef8afe0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18104 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbaD2IqY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:46:24 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000P8B1BAH90@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:46:23 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Fabian Vogt' <fabian@ritter-vogt.de>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-zevio.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index f20941c..112a107d 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -182,10 +182,8 @@ static int zevio_gpio_probe(struct platform_device *pdev)
 	int status, i;
 
 	controller = devm_kzalloc(&pdev->dev, sizeof(*controller), GFP_KERNEL);
-	if (!controller) {
-		dev_err(&pdev->dev, "not enough free memory\n");
+	if (!controller)
 		return -ENOMEM;
-	}
 
 	/* Copy our reference */
 	controller->chip.gc = zevio_gpio_chip;
-- 
1.7.10.4


