From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/2] gpio: pl061: Use devm_ioremap_resource()
Date: Wed, 12 Feb 2014 11:53:58 +0900
Message-ID: <000101cf279d$acf1f300$06d5d900$%han@samsung.com>
References: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53654 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753104AbaBLCx7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2014 21:53:59 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0V0096G41YRYE0@mailout4.samsung.com> for
 linux-gpio@vger.kernel.org; Wed, 12 Feb 2014 11:53:58 +0900 (KST)
In-reply-to: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, 'Baruch Siach' <baruch@tkos.co.il>, 'Haojian Zhuang' <haojian.zhuang@linaro.org>

Use devm_ioremap_resource() in order to make the code simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-pl061.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index b4d4211..1d21968 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -277,14 +277,9 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		irq_base = 0;
 	}
 
-	if (!devm_request_mem_region(dev, adev->res.start,
-				     resource_size(&adev->res), "pl061"))
-		return -EBUSY;
-
-	chip->base = devm_ioremap(dev, adev->res.start,
-				  resource_size(&adev->res));
-	if (!chip->base)
-		return -ENOMEM;
+	chip->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(chip->base))
+		return PTR_ERR(chip->base);
 
 	spin_lock_init(&chip->lock);
 
-- 
1.7.10.4


