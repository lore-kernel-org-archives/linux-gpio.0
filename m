From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH] GPIO: gpio-generic: Add label to platform data
Date: Thu, 30 Jan 2014 13:18:57 +0000
Message-ID: <1391087937-6025-1-git-send-email-pawel.moll@arm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:27726 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752398AbaA3NTH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 30 Jan 2014 08:19:07 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Anton Vorontsov <anton@enomsg.org>, Andreas Larsson <andreas@gaisler.com>, linux-gpio@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>

When registering more than one platform device, it is
useful to set the gpio chip label in the platform data.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 drivers/gpio/gpio-generic.c     | 2 ++
 include/linux/basic_mmio_gpio.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index d2196bf..8c778af 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -531,6 +531,8 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 		return err;
 
 	if (pdata) {
+		if (pdata->label)
+			bgc->gc.label = pdata->label;
 		bgc->gc.base = pdata->base;
 		if (pdata->ngpio > 0)
 			bgc->gc.ngpio = pdata->ngpio;
diff --git a/include/linux/basic_mmio_gpio.h b/include/linux/basic_mmio_gpio.h
index d8a97ec..0e97856 100644
--- a/include/linux/basic_mmio_gpio.h
+++ b/include/linux/basic_mmio_gpio.h
@@ -19,6 +19,7 @@
 #include <linux/spinlock_types.h>
 
 struct bgpio_pdata {
+	const char *label;
 	int base;
 	int ngpio;
 };
-- 
1.8.3.2

