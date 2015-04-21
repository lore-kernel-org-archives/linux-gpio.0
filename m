From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 21/23] gpio: sysfs: rename active-low helper
Date: Tue, 21 Apr 2015 17:42:29 +0200
Message-ID: <1429630951-27082-22-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:35861 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932392AbbDUPoF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 11:44:05 -0400
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Rename active-low helper using common prefix.

Also remove unnecessary manipulation of value argument.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 5eee3d0b3a81..00609e197f50 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -270,7 +270,7 @@ out_unlock:
 static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
-static int sysfs_set_active_low(struct device *dev, int value)
+static int gpio_sysfs_set_active_low(struct device *dev, int value)
 {
 	struct gpiod_data	*data = dev_get_drvdata(dev);
 	struct gpio_desc	*desc = data->desc;
@@ -324,7 +324,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	status = kstrtol(buf, 0, &value);
 	if (status == 0)
-		status = sysfs_set_active_low(dev, value != 0);
+		status = gpio_sysfs_set_active_low(dev, value);
 
 	mutex_unlock(&data->mutex);
 
-- 
2.0.5

