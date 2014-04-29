From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 12/17] gpio: rdc321x: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:42:04 +0900
Message-ID: <003d01cf6386$e5ccb780$b1662680$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16937 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932845AbaD2ImH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:42:07 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000XJAU5GK80@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:42:05 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Florian Fainelli' <f.fainelli@gmail.com>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-rdc321x.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index 7a319e5..9fa7e53 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -143,10 +143,8 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 
 	rdc321x_gpio_dev = devm_kzalloc(&pdev->dev, sizeof(struct rdc321x_gpio),
 					GFP_KERNEL);
-	if (!rdc321x_gpio_dev) {
-		dev_err(&pdev->dev, "failed to allocate private data\n");
+	if (!rdc321x_gpio_dev)
 		return -ENOMEM;
-	}
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_IO, "gpio-reg1");
 	if (!r) {
-- 
1.7.10.4


