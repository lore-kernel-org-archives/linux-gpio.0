From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] gpiolib: Do not use devm functions when registering gpio chip
Date: Thu, 31 Mar 2016 08:11:29 -0700
Message-ID: <1459437090-10029-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58220 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757144AbcCaPLc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 11:11:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Alexandre Courbot <gnurou@gmail.com>, Greg Ungerer <gerg@uclinux.org>

It is possible that a gpio chip is registered before the gpiolib
initialization code has run. This means we can not use devm_ functions
to allocate memory at that time. Do it the old fashioned way.

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Greg Ungerer <gerg@uclinux.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpio/gpiolib.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 72065532c1c7..f1531070814d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -440,6 +440,8 @@ static void gpiodevice_release(struct device *dev)
 	cdev_del(&gdev->chrdev);
 	list_del(&gdev->list);
 	ida_simple_remove(&gpio_ida, gdev->id);
+	kfree(gdev->label);
+	kfree(gdev->descs);
 	kfree(gdev);
 }
 
@@ -504,8 +506,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	else
 		gdev->owner = THIS_MODULE;
 
-	gdev->descs = devm_kcalloc(&gdev->dev, chip->ngpio,
-				   sizeof(gdev->descs[0]), GFP_KERNEL);
+	gdev->descs = kcalloc(chip->ngpio, sizeof(gdev->descs[0]), GFP_KERNEL);
 	if (!gdev->descs) {
 		status = -ENOMEM;
 		goto err_free_gdev;
@@ -518,12 +519,12 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	}
 
 	if (chip->label)
-		gdev->label = devm_kstrdup(&gdev->dev, chip->label, GFP_KERNEL);
+		gdev->label = kstrdup(chip->label, GFP_KERNEL);
 	else
-		gdev->label = devm_kstrdup(&gdev->dev, "unknown", GFP_KERNEL);
+		gdev->label = kstrdup("unknown", GFP_KERNEL);
 	if (!gdev->label) {
 		status = -ENOMEM;
-		goto err_free_gdev;
+		goto err_free_descs;
 	}
 
 	gdev->ngpio = chip->ngpio;
@@ -543,7 +544,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 		if (base < 0) {
 			status = base;
 			spin_unlock_irqrestore(&gpio_lock, flags);
-			goto err_free_gdev;
+			goto err_free_label;
 		}
 		/*
 		 * TODO: it should not be necessary to reflect the assigned
@@ -558,7 +559,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	status = gpiodev_add_to_list(gdev);
 	if (status) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
-		goto err_free_gdev;
+		goto err_free_label;
 	}
 
 	for (i = 0; i < chip->ngpio; i++) {
@@ -637,6 +638,10 @@ err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_del(&gdev->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
+err_free_label:
+	kfree(gdev->label);
+err_free_descs:
+	kfree(gdev->descs);
 err_free_gdev:
 	ida_simple_remove(&gpio_ida, gdev->id);
 	/* failures here can mean systems won't boot... */
-- 
2.5.0

