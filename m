From: Bamvor Jian Zhang <bamv2005@gmail.com>
Subject: [RFD] gpiolib: gpiochip is always dangling after remove
Date: Fri, 26 Feb 2016 21:06:14 +0800
Message-ID: <1456491974-26997-1-git-send-email-bamv2005@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:32962 "EHLO
	mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751488AbcBZNGx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 08:06:53 -0500
Received: by mail-pf0-f171.google.com with SMTP id q63so51993878pfb.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2016 05:06:53 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, broonie@kernel.org, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>

In my gpiochip mockup driver, after call gpiochip_remove, the
gpipchip is not actually removed even if there is no clients in
userspace. It could be removed if remove the corresonding reference
count in this patch.

But such gpiochip will be removed even if user space open the
corresponding chardev. I am not sure If I do not right thing.
Please correct me if I am wrong.

Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
---
 drivers/gpio/gpiolib.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bc788b9..862b574 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -452,7 +452,6 @@ static void gpiodevice_release(struct device *dev)
 {
 	struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	cdev_del(&gdev->chrdev);
 	list_del(&gdev->list);
 	ida_simple_remove(&gpio_ida, gdev->id);
 	kfree(gdev);
@@ -633,7 +632,6 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 
 	/* From this point, the .release() function cleans up gpio_device */
 	gdev->dev.release = gpiodevice_release;
-	get_device(&gdev->dev);
 	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
 		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
 		 dev_name(&gdev->dev), chip->label ? : "generic");
@@ -713,12 +711,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 		dev_crit(&gdev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
-	/*
-	 * The gpiochip side puts its use of the device to rest here:
-	 * if there are no userspace clients, the chardev and device will
-	 * be removed, else it will be dangling until the last user is
-	 * gone.
-	 */
+	device_del(&gdev->dev);
+	cdev_del(&gdev->chrdev);
 	put_device(&gdev->dev);
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
-- 
2.6.2

