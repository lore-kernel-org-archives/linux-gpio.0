From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 10/23] gpio: sysfs: release irq after class-device deregistration
Date: Tue, 21 Apr 2015 17:42:18 +0200
Message-ID: <1429630951-27082-11-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

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
index 9d9f1f1a2417..d896b6fa7fe8 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -680,7 +680,6 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		dev = class_find_device(&gpio_class, NULL, desc, match_export);
 		if (dev) {
-			gpio_setup_irq(desc, dev, 0);
 			clear_bit(FLAG_SYSFS_DIR, &desc->flags);
 			clear_bit(FLAG_EXPORT, &desc->flags);
 		} else
@@ -691,6 +690,11 @@ void gpiod_unexport(struct gpio_desc *desc)
 
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
