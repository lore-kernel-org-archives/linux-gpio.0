From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] gpio: gpio-mc33880: Remove redundant spi_set_drvdata
Date: Thu, 19 Sep 2013 17:30:53 +0530
Message-ID: <1379592053-9860-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:57168 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078Ab3ISMAm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2013 08:00:42 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so9634231pad.28
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2013 05:00:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org

Driver core sets driver data to NULL upon failure or remove.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpio/gpio-mc33880.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index 3fd2caa..c0b7835 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -142,7 +142,6 @@ static int mc33880_probe(struct spi_device *spi)
 	return ret;
 
 exit_destroy:
-	spi_set_drvdata(spi, NULL);
 	mutex_destroy(&mc->lock);
 	return ret;
 }
@@ -156,8 +155,6 @@ static int mc33880_remove(struct spi_device *spi)
 	if (mc == NULL)
 		return -ENODEV;
 
-	spi_set_drvdata(spi, NULL);
-
 	ret = gpiochip_remove(&mc->chip);
 	if (!ret)
 		mutex_destroy(&mc->lock);
-- 
1.7.9.5

