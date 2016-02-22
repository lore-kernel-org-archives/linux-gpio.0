From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: fixup line flags for userspace ABI
Date: Mon, 22 Feb 2016 13:47:10 +0100
Message-ID: <1456145230-7702-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:34710 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955AbcBVMrP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 07:47:15 -0500
Received: by mail-lb0-f171.google.com with SMTP id of3so81128555lbc.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2016 04:47:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

This fixes the wrongly indicated lines in the userspace
ABI: test for the right BITS, do not treat bit numbers as
bitmasks.

Reported-by: Markus Pargmann <mpa@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Ooops I had already merged the patch it seems. OK I have to
do a fixup instead.
---
 drivers/gpio/gpiolib.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b81646982375..872774a404f1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -380,17 +380,19 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		 * this GPIO so it can't use it.
 		 */
 		lineinfo.flags = 0;
-		if (desc->flags & (FLAG_REQUESTED | FLAG_IS_HOGGED |
-				   FLAG_USED_AS_IRQ | FLAG_EXPORT |
-				   FLAG_SYSFS))
+		if (test_bit(FLAG_REQUESTED, &desc->flags) ||
+		    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
+		    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
+		    test_bit(FLAG_EXPORT, &desc->flags) ||
+		    test_bit(FLAG_SYSFS, &desc->flags))
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
-- 
2.4.3

