From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] gpio: max730x: Remove redundant dev_set_drvdata
Date: Sat, 21 Dec 2013 12:55:38 +0530
Message-ID: <1387610738-14881-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:33970 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456Ab3LUH2y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Dec 2013 02:28:54 -0500
Received: by mail-pa0-f42.google.com with SMTP id lj1so3560884pab.29
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 23:28:54 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

Driver core sets it to NULL upon probe failure or release.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-max730x.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index 89226a36b08c..8672755f95c9 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -220,7 +220,6 @@ int __max730x_probe(struct max7301 *ts)
 	return ret;
 
 exit_destroy:
-	dev_set_drvdata(dev, NULL);
 	mutex_destroy(&ts->lock);
 	return ret;
 }
@@ -234,8 +233,6 @@ int __max730x_remove(struct device *dev)
 	if (ts == NULL)
 		return -ENODEV;
 
-	dev_set_drvdata(dev, NULL);
-
 	/* Power down the chip and disable IRQ output */
 	ts->write(dev, 0x04, 0x00);
 
-- 
1.7.9.5

