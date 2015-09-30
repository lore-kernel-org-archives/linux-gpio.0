From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 1/3] gpio: generic: improve error handling in bgpio_map
Date: Wed, 30 Sep 2015 23:50:20 +0200
Message-ID: <560C591C.2030709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:34857 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932907AbbI3VxJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2015 17:53:09 -0400
Received: by wicge5 with SMTP id ge5so2770410wic.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2015 14:53:08 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

If bgpio_map returns NULL then err should always be set.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpio/gpio-generic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index a3f0753..eefff1a 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -591,8 +591,10 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 	*err = 0;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!r)
+	if (!r) {
+		*err = -EINVAL;
 		return NULL;
+	}
 
 	sz = resource_size(r);
 	if (sz != sane_sz) {
@@ -637,8 +639,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	sz = resource_size(r);
 
 	dat = bgpio_map(pdev, "dat", sz, &err);
-	if (!dat)
-		return err ? err : -EINVAL;
+	if (err)
+		return err;
 
 	set = bgpio_map(pdev, "set", sz, &err);
 	if (err)
-- 
2.6.0

