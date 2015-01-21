From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: ge: Convert to use devm_kstrdup
Date: Wed, 21 Jan 2015 09:50:06 +0800
Message-ID: <1421805006.9831.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:62891 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751293AbbAUBuL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jan 2015 20:50:11 -0500
Received: by mail-pa0-f45.google.com with SMTP id lf10so49500979pab.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2015 17:50:10 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, Martyn Welch <martyn.welch@ge.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Use devm_kstrdup to simplify the error handling path.
Also return -ENOMEM instead of 0 if devm_kstrdup fails.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-ge.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index 6ea9303..f9ac3f3 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -76,9 +76,12 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* Setup pointers to chip functions */
-	bgc->gc.label = kstrdup(pdev->dev.of_node->full_name, GFP_KERNEL);
-	if (!bgc->gc.label)
+	bgc->gc.label = devm_kstrdup(&pdev->dev, pdev->dev.of_node->full_name,
+				     GFP_KERNEL);
+	if (!bgc->gc.label) {
+		ret = -ENOMEM;
 		goto err0;
+	}
 
 	bgc->gc.base = -1;
 	bgc->gc.ngpio = (u16)(uintptr_t)of_id->data;
@@ -88,11 +91,9 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 	/* This function adds a memory mapped GPIO chip */
 	ret = gpiochip_add(&bgc->gc);
 	if (ret)
-		goto err1;
+		goto err0;
 
 	return 0;
-err1:
-	kfree(bgc->gc.label);
 err0:
 	iounmap(regs);
 	pr_err("%s: GPIO chip registration failed\n",
-- 
1.9.1



