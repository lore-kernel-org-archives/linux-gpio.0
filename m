From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 11/17] gpio: rcar: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:40:59 +0900
Message-ID: <003c01cf6386$bec85040$3c58f0c0$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16658 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706AbaD2IlA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:41:00 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000P9ASBIQ80@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:41:00 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Laurent Pinchart' <laurent.pinchart@ideasonboard.com>, 'Magnus Damm' <damm@opensource.se>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-rcar.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index bfcfeee..0c9f803 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -363,7 +363,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 
 	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
 	if (!p) {
-		dev_err(dev, "failed to allocate driver data\n");
 		ret = -ENOMEM;
 		goto err0;
 	}
-- 
1.7.10.4


