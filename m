From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 05/23] gpio: sysfs: reduce gpiochip-export locking scope
Date: Mon,  4 May 2015 17:10:30 +0200
Message-ID: <1430752248-15401-6-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:36718 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504AbbEDPNm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:42 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Reduce scope of sysfs_lock protection during chip export and unexport,
which is only needed to prevent gpiod (re-)exports during chip removal.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 658ed28e6d7d..d19bf234e878 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -779,7 +779,6 @@ int gpiochip_export(struct gpio_chip *chip)
 		return 0;
 
 	/* use chip->base for the ID; it's already known to be unique */
-	mutex_lock(&sysfs_lock);
 	dev = device_create_with_groups(&gpio_class, chip->dev, MKDEV(0, 0),
 					chip, gpiochip_groups,
 					"gpiochip%d", chip->base);
@@ -787,6 +786,8 @@ int gpiochip_export(struct gpio_chip *chip)
 		status = PTR_ERR(dev);
 	else
 		status = 0;
+
+	mutex_lock(&sysfs_lock);
 	chip->exported = (status == 0);
 	mutex_unlock(&sysfs_lock);
 
@@ -803,17 +804,17 @@ void gpiochip_unexport(struct gpio_chip *chip)
 	struct gpio_desc *desc;
 	unsigned int i;
 
-	mutex_lock(&sysfs_lock);
 	dev = class_find_device(&gpio_class, NULL, chip, match_export);
 	if (dev) {
 		put_device(dev);
 		device_unregister(dev);
 		/* prevent further gpiod exports */
+		mutex_lock(&sysfs_lock);
 		chip->exported = false;
+		mutex_unlock(&sysfs_lock);
 		status = 0;
 	} else
 		status = -ENODEV;
-	mutex_unlock(&sysfs_lock);
 
 	if (status)
 		chip_dbg(chip, "%s: status %d\n", __func__, status);
-- 
2.0.5

