From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 5/6] gpio: pca953x: coding style fixes
Date: Thu,  8 Sep 2016 12:48:21 +0200
Message-ID: <1473331702-26711-6-git-send-email-bgolaszewski@baylibre.com>
References: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35384 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758945AbcIHKsf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 06:48:35 -0400
Received: by mail-wm0-f48.google.com with SMTP id w12so27972187wmf.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2016 03:48:34 -0700 (PDT)
In-Reply-To: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

pca953x_gpio_set_multiple() has some coding style issues that make it
harder to read. Tweak the code a bit.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 02893c6..71e1344 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -360,25 +360,28 @@ exit:
 }
 
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
-		unsigned long *mask, unsigned long *bits)
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	unsigned int bank_mask, bank_val;
+	int bank_shift, bank;
 	u8 reg_val[MAX_BANK];
 	int ret;
-	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
-	int bank;
+
+	bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 
 	memcpy(reg_val, chip->reg_output, NBANK(chip));
 	mutex_lock(&chip->i2c_lock);
-	for(bank=0; bank<NBANK(chip); bank++) {
-		unsigned bankmask = mask[bank / sizeof(*mask)] >>
-				    ((bank % sizeof(*mask)) * 8);
-		if(bankmask) {
-			unsigned bankval  = bits[bank / sizeof(*bits)] >>
-					    ((bank % sizeof(*bits)) * 8);
-			reg_val[bank] = (reg_val[bank] & ~bankmask) | bankval;
+	for (bank = 0; bank < NBANK(chip); bank++) {
+		bank_mask = mask[bank / sizeof(*mask)] >>
+			   ((bank % sizeof(*mask)) * 8);
+		if (bank_mask) {
+			bank_val = bits[bank / sizeof(*bits)] >>
+				  ((bank % sizeof(*bits)) * 8);
+			reg_val[bank] = (reg_val[bank] & ~bank_mask) | bank_val;
 		}
 	}
+
 	ret = i2c_smbus_write_i2c_block_data(chip->client,
 					     chip->regs->output << bank_shift,
 					     NBANK(chip), reg_val);
-- 
2.7.4

