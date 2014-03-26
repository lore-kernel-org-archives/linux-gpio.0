From: Michael Heimpold <mhei@heimpold.de>
Subject: [PATCH] gpiolib: trim userspace representation of "value" to 0/1
Date: Thu, 27 Mar 2014 00:09:38 +0100
Message-ID: <1395875378-28592-1-git-send-email-mhei@heimpold.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:37364 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756610AbaCZXJt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Mar 2014 19:09:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Michael Heimpold <mhei@heimpold.de>

According to Documentation/gpio/sysfs.txt:
  ...
  "value" ... reads as either 0 (low) or 1 (high).

Since some gpio implementations return non-zero if GPIO is set
but not 1, filter the return value to fit the documentation.

Signed-off-by: Michael Heimpold <mhei@heimpold.de>
---
 drivers/gpio/gpiolib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 50c4922..45aa695 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -376,7 +376,7 @@ static ssize_t gpio_value_show(struct device *dev,
 	if (!test_bit(FLAG_EXPORT, &desc->flags))
 		status = -EIO;
 	else
-		status = sprintf(buf, "%d\n", gpiod_get_value_cansleep(desc));
+		status = sprintf(buf, "%d\n", !!gpiod_get_value_cansleep(desc));
 
 	mutex_unlock(&sysfs_lock);
 	return status;
-- 
1.7.10.4

