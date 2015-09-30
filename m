From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 3/3] gpio: generic: replace error variable with errptr
 functionality in bgpio_map
Date: Wed, 30 Sep 2015 23:52:36 +0200
Message-ID: <560C59A4.1070003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:37095 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932904AbbI3VxM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2015 17:53:12 -0400
Received: by wicfx3 with SMTP id fx3so2655823wic.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2015 14:53:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Use the ERRPTR standard way to return an error code in a pointer
thus simplifiying the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpio/gpio-generic.c | 56 +++++++++++++++++----------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 0cdbe10..d8b1700 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -579,34 +579,20 @@ EXPORT_SYMBOL_GPL(bgpio_init);
 
 static void __iomem *bgpio_map(struct platform_device *pdev,
 			       const char *name,
-			       resource_size_t sane_sz,
-			       int *err)
+			       resource_size_t sane_sz)
 {
 	struct resource *r;
 	resource_size_t sz;
-	void __iomem *ret;
-
-	*err = 0;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!r) {
-		*err = -EINVAL;
-		return NULL;
-	}
+	if (!r)
+		return IOMEM_ERR_PTR(-EINVAL);
 
 	sz = resource_size(r);
-	if (sz != sane_sz) {
-		*err = -EINVAL;
-		return NULL;
-	}
+	if (sz != sane_sz)
+		return IOMEM_ERR_PTR(-EINVAL);
 
-	ret = devm_ioremap_resource(&pdev->dev, r);
-	if (IS_ERR(ret)) {
-		*err = PTR_ERR(ret);
-		return NULL;
-	}
-
-	return ret;
+	return devm_ioremap_resource(&pdev->dev, r);
 }
 
 static int bgpio_pdev_probe(struct platform_device *pdev)
@@ -630,25 +616,25 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 
 	sz = resource_size(r);
 
-	dat = bgpio_map(pdev, "dat", sz, &err);
-	if (err)
-		return err;
+	dat = bgpio_map(pdev, "dat", sz);
+	if (IS_ERR(dat))
+		return PTR_ERR(dat);
 
-	set = bgpio_map(pdev, "set", sz, &err);
-	if (err)
-		return err;
+	set = bgpio_map(pdev, "set", sz);
+	if (IS_ERR(set))
+		return PTR_ERR(set);
 
-	clr = bgpio_map(pdev, "clr", sz, &err);
-	if (err)
-		return err;
+	clr = bgpio_map(pdev, "clr", sz);
+	if (IS_ERR(clr))
+		return PTR_ERR(clr);
 
-	dirout = bgpio_map(pdev, "dirout", sz, &err);
-	if (err)
-		return err;
+	dirout = bgpio_map(pdev, "dirout", sz);
+	if (IS_ERR(dirout))
+		return PTR_ERR(dirout);
 
-	dirin = bgpio_map(pdev, "dirin", sz, &err);
-	if (err)
-		return err;
+	dirin = bgpio_map(pdev, "dirin", sz);
+	if (IS_ERR(dirin))
+		return PTR_ERR(dirin);
 
 	bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
 	if (!bgc)
-- 
2.6.0

