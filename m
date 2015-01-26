From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] gpio: sysfs: fix gpio-chip device-attribute leak
Date: Mon, 26 Jan 2015 19:04:55 +0100
Message-ID: <1422295496-6194-2-git-send-email-johan@kernel.org>
References: <1422295496-6194-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422295496-6194-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Commit 121b6a79955a3a3fd7bbb9b8cb88d5b9dad6283d upstream.

The gpio-chip device attributes were never destroyed when the device was
removed.

Fix by using device_create_with_groups() to create the device attributes
of the chip class device.

Note that this also fixes the attribute-creation race with userspace.

Fixes: d8f388d8dc8d ("gpio: sysfs interface")
Cc: stable <stable@vger.kernel.org>	# v2.6.27+
Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0dee0e0c247a..dd4d6ffacc30 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -627,16 +627,13 @@ static ssize_t chip_ngpio_show(struct device *dev,
 }
 static DEVICE_ATTR(ngpio, 0444, chip_ngpio_show, NULL);
 
-static const struct attribute *gpiochip_attrs[] = {
+static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
 	&dev_attr_ngpio.attr,
 	NULL,
 };
-
-static const struct attribute_group gpiochip_attr_group = {
-	.attrs = (struct attribute **) gpiochip_attrs,
-};
+ATTRIBUTE_GROUPS(gpiochip);
 
 /*
  * /sys/class/gpio/export ... write-only
@@ -1001,13 +998,13 @@ static int gpiochip_export(struct gpio_chip *chip)
 
 	/* use chip->base for the ID; it's already known to be unique */
 	mutex_lock(&sysfs_lock);
-	dev = device_create(&gpio_class, chip->dev, MKDEV(0, 0), chip,
-				"gpiochip%d", chip->base);
-	if (!IS_ERR(dev)) {
-		status = sysfs_create_group(&dev->kobj,
-				&gpiochip_attr_group);
-	} else
+	dev = device_create_with_groups(&gpio_class, chip->dev, MKDEV(0, 0),
+					chip, gpiochip_groups,
+					"gpiochip%d", chip->base);
+	if (IS_ERR(dev))
 		status = PTR_ERR(dev);
+	else
+		status = 0;
 	chip->exported = (status == 0);
 	mutex_unlock(&sysfs_lock);
 
-- 
2.0.5
