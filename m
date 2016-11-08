From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: pca953x: Fix corruption of other gpios in set_multiple.
Date: Tue,  8 Nov 2016 14:00:45 +0800
Message-ID: <1478584845-75666-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:59226 "EHLO
        preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751062AbcKHGAx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 01:00:53 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, preid@electromag.com.au, ben.dooks@codethink.co.uk, yong.b.li@intel.com, linux-gpio@vger.kernel.org

gpiod_set_array_value_complex does not clear the bits field.
Therefore when the drivers set_multiple funciton is called bits outside
the mask are undefined and can be either set or not. So bank_val needs
to be masked with bank_mask before or with the reg_val cache.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b0eb113..fe731f0 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -380,6 +380,7 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 		if (bank_mask) {
 			bank_val = bits[bank / sizeof(*bits)] >>
 				  ((bank % sizeof(*bits)) * 8);
+			bank_val &= bank_mask;
 			reg_val[bank] = (reg_val[bank] & ~bank_mask) | bank_val;
 		}
 	}
-- 
1.8.3.1

