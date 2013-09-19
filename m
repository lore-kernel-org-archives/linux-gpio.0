From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] gpio: gpio-74x164: Remove redundant spi_set_drvdata
Date: Thu, 19 Sep 2013 17:28:07 +0530
Message-ID: <1379591888-8834-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:40827 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183Ab3ISL54 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2013 07:57:56 -0400
Received: by mail-pb0-f49.google.com with SMTP id xb4so8290318pbc.22
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2013 04:57:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sachin.kamat@linaro.org, Gabor Juhos <juhosg@openwrt.org>

Driver core sets driver data to NULL upon failure or remove.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Gabor Juhos <juhosg@openwrt.org>
---
Compile tested.
---
 drivers/gpio/gpio-74x164.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 5d518d5..a51e893 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -176,7 +176,6 @@ static int gen_74x164_probe(struct spi_device *spi)
 	return ret;
 
 exit_destroy:
-	spi_set_drvdata(spi, NULL);
 	mutex_destroy(&chip->lock);
 	return ret;
 }
@@ -190,8 +189,6 @@ static int gen_74x164_remove(struct spi_device *spi)
 	if (chip == NULL)
 		return -ENODEV;
 
-	spi_set_drvdata(spi, NULL);
-
 	ret = gpiochip_remove(&chip->gpio_chip);
 	if (!ret)
 		mutex_destroy(&chip->lock);
-- 
1.7.9.5

