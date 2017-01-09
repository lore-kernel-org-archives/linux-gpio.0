From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] gpio: Remove impossible checks on container_of() result
Date: Mon,  9 Jan 2017 11:47:44 -0800
Message-ID: <20170109194744.24152-1-sboyd@codeaurora.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58782 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966836AbdAITrs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2017 14:47:48 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

container_of() does pointer math on the pointer that's passed in.
If it were to return a NULL pointer the value passed in would
need to be perfectly offset from 0 to make that so. Remove these
checks because they don't make sense.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/gpio/gpiolib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 86bf3b84ada5..4864408364ef 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -982,7 +982,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
 					      struct gpio_device, chrdev);
 
 	/* Fail on open if the backing gpiochip is gone */
-	if (!gdev || !gdev->chip)
+	if (!gdev->chip)
 		return -ENODEV;
 	get_device(&gdev->dev);
 	filp->private_data = gdev;
@@ -1001,8 +1001,6 @@ static int gpio_chrdev_release(struct inode *inode, struct file *filp)
 	struct gpio_device *gdev = container_of(inode->i_cdev,
 					      struct gpio_device, chrdev);
 
-	if (!gdev)
-		return -ENODEV;
 	put_device(&gdev->dev);
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

