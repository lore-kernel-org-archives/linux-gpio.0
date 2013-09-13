From: Graeme Smecher <gsmecher@threespeedlogic.com>
Subject: [PATCH] gpio: pca953x: Don't flip bits on PCA957x GPIO expanders when probing them.
Date: Fri, 13 Sep 2013 14:41:48 -0700
Message-ID: <1379108508-19933-1-git-send-email-gsmecher@threespeedlogic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from threespeedlogic.com ([75.98.167.93]:35028 "EHLO
	threespeedlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755452Ab3IMWtg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2013 18:49:36 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, Graeme Smecher <gsmecher@threespeedlogic.com>

The pca957x driver supports a handful of I2C GPIO expanders from NXP, Maxim,
and TI. For the PCA9574 and PCA9575 devices only, the driver resets the GPIO
level and direction in the pca957x_probe function. This seems like the wrong
thing to do, since it can cause hardware bit twiddles during warm reboots when
the chip state and reset values don't match.

This kind of initialization is best left upstream (in a bootloader) or
downstream (in userspace). It's also an inconsistency across devices supported
by this driver.

This patch is NOT boot-tested: the SoC I'm  using is stuck on 2.6.37, and the
patch doesn't apply trivially.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
Acked-by: Haojian Zhuang <haojian.zhuang@gmail.com>
---
 drivers/gpio/gpio-pca953x.c |   11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cdd1aa1..6e48c07 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -683,17 +683,6 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
-	/* Let every port in proper state, that could save power */
-	memset(val, 0, NBANK(chip));
-	pca953x_write_regs(chip, PCA957X_PUPD, val);
-	memset(val, 0xFF, NBANK(chip));
-	pca953x_write_regs(chip, PCA957X_CFG, val);
-	memset(val, 0, NBANK(chip));
-	pca953x_write_regs(chip, PCA957X_OUT, val);
-
-	ret = pca953x_read_regs(chip, PCA957X_IN, val);
-	if (ret)
-		goto out;
 	ret = pca953x_read_regs(chip, PCA957X_OUT, chip->reg_output);
 	if (ret)
 		goto out;
-- 
1.7.10.4

