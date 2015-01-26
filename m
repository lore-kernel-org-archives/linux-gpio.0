From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] gpio: sysfs: fix gpio-chip device-attribute leak
Date: Mon, 26 Jan 2015 19:05:59 +0100
Message-ID: <1422295560-6284-2-git-send-email-johan@kernel.org>
References: <1422295496-6194-1-git-send-email-johan@kernel.org>
 <1422295560-6284-1-git-send-email-johan@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1422295560-6284-1-git-send-email-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
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
[johan: fix leak without device_create_with_groups, which wasn't
introduced until 3.11 ]
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0dee0e0c247a..bc3d59efe80b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -627,7 +627,7 @@ static ssize_t chip_ngpio_show(struct device *dev,
 }
 static DEVICE_ATTR(ngpio, 0444, chip_ngpio_show, NULL);
 
-static const struct attribute *gpiochip_attrs[] = {
+static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
 	&dev_attr_ngpio.attr,
@@ -635,7 +635,7 @@ static const struct attribute *gpiochip_attrs[] = {
 };
 
 static const struct attribute_group gpiochip_attr_group = {
-	.attrs = (struct attribute **) gpiochip_attrs,
+	.attrs = gpiochip_attrs,
 };
 
 /*
@@ -1036,6 +1036,7 @@ static void gpiochip_unexport(struct gpio_chip *chip)
 	mutex_lock(&sysfs_lock);
 	dev = class_find_device(&gpio_class, NULL, chip, match_export);
 	if (dev) {
+		sysfs_remove_group(&dev->kobj, &gpiochip_attr_group);
 		put_device(dev);
 		device_unregister(dev);
 		chip->exported = 0;
-- 
2.0.5
