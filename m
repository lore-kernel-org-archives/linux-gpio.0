From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 05/23] gpio: sysfs: reduce gpiochip-export locking scope
Date: Tue, 21 Apr 2015 17:42:13 +0200
Message-ID: <1429630951-27082-6-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Reduce scope of sysfs_lock protection during chip export and unexport,
which is only needed to prevent gpiod (re-)exports during chip removal.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index da0300224b4a..c433f075f349 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -764,7 +764,6 @@ int gpiochip_export(struct gpio_chip *chip)
 		return 0;
 
 	/* use chip->base for the ID; it's already known to be unique */
-	mutex_lock(&sysfs_lock);
 	dev = device_create_with_groups(&gpio_class, chip->dev, MKDEV(0, 0),
 					chip, gpiochip_groups,
 					"gpiochip%d", chip->base);
@@ -772,6 +771,8 @@ int gpiochip_export(struct gpio_chip *chip)
 		status = PTR_ERR(dev);
 	else
 		status = 0;
+
+	mutex_lock(&sysfs_lock);
 	chip->exported = (status == 0);
 	mutex_unlock(&sysfs_lock);
 
@@ -788,17 +789,17 @@ void gpiochip_unexport(struct gpio_chip *chip)
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
