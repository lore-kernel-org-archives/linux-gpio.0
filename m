From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/3] gpio: generic: replace devm_request_mem_region /
 devm_ioremap with devm_ioremap_resource
Date: Wed, 30 Sep 2015 23:51:08 +0200
Message-ID: <560C594C.7090804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:36040 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932769AbbI3VxL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2015 17:53:11 -0400
Received: by wicgb1 with SMTP id gb1so2700095wic.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2015 14:53:09 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Replace devm_request_mem_region / devm_ioremap with devm_ioremap_resource.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpio/gpio-generic.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index eefff1a..0cdbe10 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -582,9 +582,7 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 			       resource_size_t sane_sz,
 			       int *err)
 {
-	struct device *dev = &pdev->dev;
 	struct resource *r;
-	resource_size_t start;
 	resource_size_t sz;
 	void __iomem *ret;
 
@@ -602,15 +600,9 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 		return NULL;
 	}
 
-	start = r->start;
-	if (!devm_request_mem_region(dev, start, sz, r->name)) {
-		*err = -EBUSY;
-		return NULL;
-	}
-
-	ret = devm_ioremap(dev, start, sz);
-	if (!ret) {
-		*err = -ENOMEM;
+	ret = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(ret)) {
+		*err = PTR_ERR(ret);
 		return NULL;
 	}
 
-- 
2.6.0

