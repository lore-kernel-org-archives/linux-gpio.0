From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpiolib: shifters used as flags in gpio_ioctl()
Date: Tue, 23 Feb 2016 12:44:50 +0300
Message-ID: <20160223094450.GB4030@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:44850 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbcBWJpH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2016 04:45:07 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We weren't testing whether the bits were set correctly because we used
shifters as flags.  It means that we give the user incorrect line
information in this new ioctl.

Fixes: 521a2ad6f862 ('gpio: add userspace ABI for GPIO line information')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b816469..d609e03 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -380,17 +380,19 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		 * this GPIO so it can't use it.
 		 */
 		lineinfo.flags = 0;
-		if (desc->flags & (FLAG_REQUESTED | FLAG_IS_HOGGED |
-				   FLAG_USED_AS_IRQ | FLAG_EXPORT |
-				   FLAG_SYSFS))
+		if (desc->flags & ((1 << FLAG_REQUESTED) |
+				   (1 << FLAG_IS_HOGGED) |
+				   (1 << FLAG_USED_AS_IRQ) |
+				   (1 << FLAG_EXPORT) |
+				   (1 << FLAG_SYSFS)))
 			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
-		if (desc->flags & FLAG_IS_OUT)
+		if (test_bit(FLAG_IS_OUT, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
-		if (desc->flags & FLAG_ACTIVE_LOW)
+		if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_ACTIVE_LOW;
-		if (desc->flags & FLAG_OPEN_DRAIN)
+		if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_OPEN_DRAIN;
-		if (desc->flags & FLAG_OPEN_SOURCE)
+		if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_OPEN_SOURCE;
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
