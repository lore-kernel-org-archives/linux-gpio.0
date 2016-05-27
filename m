From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: handle compatible ioctl() pointers
Date: Fri, 27 May 2016 14:32:53 +0200
Message-ID: <1464352373-25108-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36067 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750957AbcE0MdA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 May 2016 08:33:00 -0400
Received: by mail-lf0-f42.google.com with SMTP id b73so22782979lfb.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 May 2016 05:32:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

If we're using the compatible ioctl() we need to handle the
argument pointer in a special way or there will be trouble.

Fixes: 3c702e9987e2 ("gpio: add a userspace chardev ABI for GPIOs")
Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e901d2666b46..f1ef27014e6e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -20,6 +20,7 @@
 #include <linux/cdev.h>
 #include <linux/fs.h>
 #include <linux/uaccess.h>
+#include <linux/compat.h>
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
@@ -316,7 +317,7 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct gpio_device *gdev = filp->private_data;
 	struct gpio_chip *chip = gdev->chip;
-	int __user *ip = (int __user *)arg;
+	void __user *ip = (void __user *)arg;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
 	if (!chip)
@@ -388,6 +389,14 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	return -EINVAL;
 }
 
+#ifdef CONFIG_COMPAT
+static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
+			      unsigned long arg)
+{
+	return gpio_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
 /**
  * gpio_chrdev_open() - open the chardev for ioctl operations
  * @inode: inode for this chardev
@@ -431,7 +440,9 @@ static const struct file_operations gpio_fileops = {
 	.owner = THIS_MODULE,
 	.llseek = noop_llseek,
 	.unlocked_ioctl = gpio_ioctl,
-	.compat_ioctl = gpio_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = gpio_ioctl_compat,
+#endif
 };
 
 static void gpiodevice_release(struct device *dev)
-- 
2.4.11

