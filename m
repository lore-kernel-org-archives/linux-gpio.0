From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 18/23] gpio: sysfs: clean up gpiod_export_link locking
Date: Mon,  4 May 2015 17:10:43 +0200
Message-ID: <1430752248-15401-19-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:34344 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065AbbEDPNq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:46 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Drop unnecessary locking from gpiod_export_link. If the class device has
not already been unregistered, class_find_device returns the ref-counted
class device so there's no need for locking.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 1161a46618dd..682e4d34999c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -631,34 +631,22 @@ static int match_export(struct device *dev, const void *desc)
 int gpiod_export_link(struct device *dev, const char *name,
 		      struct gpio_desc *desc)
 {
-	int			status = -EINVAL;
+	struct device *cdev;
+	int ret;
 
 	if (!desc) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
 
-	mutex_lock(&sysfs_lock);
-
-	if (test_bit(FLAG_EXPORT, &desc->flags)) {
-		struct device *tdev;
-
-		tdev = class_find_device(&gpio_class, NULL, desc, match_export);
-		if (tdev != NULL) {
-			status = sysfs_create_link(&dev->kobj, &tdev->kobj,
-						name);
-			put_device(tdev);
-		} else {
-			status = -ENODEV;
-		}
-	}
-
-	mutex_unlock(&sysfs_lock);
+	cdev = class_find_device(&gpio_class, NULL, desc, match_export);
+	if (!cdev)
+		return -ENODEV;
 
-	if (status)
-		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
+	ret = sysfs_create_link(&dev->kobj, &cdev->kobj, name);
+	put_device(cdev);
 
-	return status;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_export_link);
 
-- 
2.0.5

