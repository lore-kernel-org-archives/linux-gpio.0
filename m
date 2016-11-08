From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: pca953x: Move memcpy into mutex lock for set multiple function.
Date: Tue,  8 Nov 2016 13:18:11 +0800
Message-ID: <1478582291-57976-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:59218 "EHLO
        preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752936AbcKHFxV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 00:53:21 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, preid@electromag.com.au, ben.dooks@codethink.co.uk, yong.b.li@intel.com, linux-gpio@vger.kernel.org

Need to ensure that reg_output is not updated while setting multiple
bits. This makes the mutex locking behaviour for the set_multiple call
consistent with that of the set_value call.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-pca953x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e422568..b0eb113 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -372,8 +372,8 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 
 	bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 
-	memcpy(reg_val, chip->reg_output, NBANK(chip));
 	mutex_lock(&chip->i2c_lock);
+	memcpy(reg_val, chip->reg_output, NBANK(chip));
 	for (bank = 0; bank < NBANK(chip); bank++) {
 		bank_mask = mask[bank / sizeof(*mask)] >>
 			   ((bank % sizeof(*mask)) * 8);
@@ -607,7 +607,6 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 
 	if (client->irq && irq_base != -1
 			&& (chip->driver_data & PCA_INT)) {
-
 		ret = pca953x_read_regs(chip,
 					chip->regs->input, chip->irq_stat);
 		if (ret)
-- 
1.8.3.1

