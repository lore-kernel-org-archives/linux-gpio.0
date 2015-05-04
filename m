From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 10/23] gpio: sysfs: release irq after class-device deregistration
Date: Mon,  4 May 2015 17:10:35 +0200
Message-ID: <1430752248-15401-11-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:34302 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873AbbEDPNo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:44 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Make sure to release any irq only after the class device has been
deregistered.

This avoids a race between gpiod_unexport and edge_store, where an irq
could be allocated just before the gpio class device is deregistered
without relying on FLAG_EXPORT and the global sysfs lock.

Note that there is no need to hold the sysfs lock when releasing the irq
after the class device is gone as kernfs will prevent further attribute
operations.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index a78dabd4035b..e4b079eec9bc 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -695,7 +695,6 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		dev = class_find_device(&gpio_class, NULL, desc, match_export);
 		if (dev) {
-			gpio_setup_irq(desc, dev, 0);
 			clear_bit(FLAG_SYSFS_DIR, &desc->flags);
 			clear_bit(FLAG_EXPORT, &desc->flags);
 		} else
@@ -706,6 +705,11 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 	if (dev) {
 		device_unregister(dev);
+		/*
+		 * Release irq after deregistration to prevent race with
+		 * edge_store.
+		 */
+		gpio_setup_irq(desc, dev, 0);
 		put_device(dev);
 	}
 
-- 
2.0.5

