From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 21/23] gpio: sysfs: rename active-low helper
Date: Mon,  4 May 2015 17:10:46 +0200
Message-ID: <1430752248-15401-22-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:36747 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869AbbEDPNo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:44 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
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
index 1540f7d60f06..06372c7c822c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -285,7 +285,7 @@ out_unlock:
 static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
-static int sysfs_set_active_low(struct device *dev, int value)
+static int gpio_sysfs_set_active_low(struct device *dev, int value)
 {
 	struct gpiod_data	*data = dev_get_drvdata(dev);
 	struct gpio_desc	*desc = data->desc;
@@ -339,7 +339,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	status = kstrtol(buf, 0, &value);
 	if (status == 0)
-		status = sysfs_set_active_low(dev, value != 0);
+		status = gpio_sysfs_set_active_low(dev, value);
 
 	mutex_unlock(&data->mutex);
 
-- 
2.0.5

