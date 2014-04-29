From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 06/17] gpio: lynxpoint: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:36:26 +0900
Message-ID: <003701cf6386$1c4f24b0$54ed6e10$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15355 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932115AbaD2Ig2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:36:28 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S000HQAKRWJ70@mailout3.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:36:27 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Mika Westerberg' <mika.westerberg@linux.intel.com>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-lynxpoint.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 9a82a90..2bea89b 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -375,10 +375,8 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	int ret = -ENODEV;
 
 	lg = devm_kzalloc(dev, sizeof(struct lp_gpio), GFP_KERNEL);
-	if (!lg) {
-		dev_err(dev, "can't allocate lp_gpio chip data\n");
+	if (!lg)
 		return -ENOMEM;
-	}
 
 	lg->pdev = pdev;
 	platform_set_drvdata(pdev, lg);
-- 
1.7.10.4


