From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH RESEND] gpio: generic: Use platform_device_id->driver_data field for driver flags
Date: Sun, 16 Mar 2014 09:10:34 +0400
Message-ID: <1394946634-25753-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp53.i.mail.ru ([94.100.177.113]:42979 "EHLO smtp53.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750732AbaCPFKx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 16 Mar 2014 01:10:53 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-generic.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index d815dd2..b5dff9e 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -488,7 +488,7 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	void __iomem *dirout;
 	void __iomem *dirin;
 	unsigned long sz;
-	unsigned long flags = 0;
+	unsigned long flags = pdev->id_entry->driver_data;
 	int err;
 	struct bgpio_chip *bgc;
 	struct bgpio_pdata *pdata = dev_get_platdata(dev);
@@ -519,9 +519,6 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	if (!strcmp(platform_get_device_id(pdev)->name, "basic-mmio-gpio-be"))
-		flags |= BGPIOF_BIG_ENDIAN;
-
 	bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
 	if (!bgc)
 		return -ENOMEM;
@@ -551,9 +548,14 @@ static int bgpio_pdev_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bgpio_id_table[] = {
-	{ "basic-mmio-gpio", },
-	{ "basic-mmio-gpio-be", },
-	{},
+	{
+		.name		= "basic-mmio-gpio",
+		.driver_data	= 0,
+	}, {
+		.name		= "basic-mmio-gpio-be",
+		.driver_data	= BGPIOF_BIG_ENDIAN,
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 
-- 
1.8.3.2

