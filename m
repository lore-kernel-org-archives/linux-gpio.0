From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 01/23] gpio: sysfs: fix memory leaks and device hotplug
Date: Tue, 21 Apr 2015 17:42:09 +0200
Message-ID: <1429630951-27082-2-git-send-email-johan@kernel.org>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:34276 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755696AbbDUPnM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 11:43:12 -0400
In-Reply-To: <1429630951-27082-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>

Unregister GPIOs requested through sysfs at chip remove to avoid leaking
the associated memory and sysfs entries.

The stale sysfs entries prevented the gpio numbers from being exported
when the gpio range was later reused (e.g. at device reconnect).

This also fixes the related module-reference leak.

Note that kernfs makes sure that any on-going sysfs operations finish
before the class devices are unregistered and that further accesses
fail.

The chip exported flag is used to prevent gpiod exports during removal.
This also makes it harder to trigger, but does not fix, the related race
between gpiochip_remove and export_store, which is really a race with
gpiod_request that needs to be addressed separately.

Also note that this would prevent the crashes (e.g. NULL-dereferences)
at reconnect that affects pre-3.18 kernels, as well as use-after-free on
operations on open attribute files on pre-3.14 kernels (prior to
kernfs).

Fixes: d8f388d8dc8d ("gpio: sysfs interface")
Cc: stable <stable@vger.kernel.org>	# v2.6.27: 01cca93a9491
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 7722ed53bd65..af3bc7a8033b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -551,6 +551,7 @@ static struct class gpio_class = {
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
+	struct gpio_chip	*chip;
 	unsigned long		flags;
 	int			status;
 	const char		*ioname = NULL;
@@ -568,8 +569,16 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		return -EINVAL;
 	}
 
+	chip = desc->chip;
+
 	mutex_lock(&sysfs_lock);
 
+	/* check if chip is being removed */
+	if (!chip || !chip->exported) {
+		status = -ENODEV;
+		goto fail_unlock;
+	}
+
 	spin_lock_irqsave(&gpio_lock, flags);
 	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
 	     test_bit(FLAG_EXPORT, &desc->flags)) {
@@ -783,12 +792,15 @@ void gpiochip_unexport(struct gpio_chip *chip)
 {
 	int			status;
 	struct device		*dev;
+	struct gpio_desc *desc;
+	unsigned int i;
 
 	mutex_lock(&sysfs_lock);
 	dev = class_find_device(&gpio_class, NULL, chip, match_export);
 	if (dev) {
 		put_device(dev);
 		device_unregister(dev);
+		/* prevent further gpiod exports */
 		chip->exported = false;
 		status = 0;
 	} else
@@ -797,6 +809,13 @@ void gpiochip_unexport(struct gpio_chip *chip)
 
 	if (status)
 		chip_dbg(chip, "%s: status %d\n", __func__, status);
+
+	/* unregister gpiod class devices owned by sysfs */
+	for (i = 0; i < chip->ngpio; i++) {
+		desc = &chip->desc[i];
+		if (test_and_clear_bit(FLAG_SYSFS, &desc->flags))
+			gpiod_free(desc);
+	}
 }
 
 static int __init gpiolib_sysfs_init(void)
-- 
2.0.5

