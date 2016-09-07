From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 5/5] gpio: pca953x: coding style fixes
Date: Wed,  7 Sep 2016 16:49:30 +0200
Message-ID: <1473259770-26224-6-git-send-email-bgolaszewski@baylibre.com>
References: <1473259770-26224-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37287 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938729AbcIGOtp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 10:49:45 -0400
Received: by mail-wm0-f51.google.com with SMTP id w12so37255798wmf.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 07:49:45 -0700 (PDT)
In-Reply-To: <1473259770-26224-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

pca953x_gpio_set_multiple() has some coding style issues that make it
harder to read. Tweak the code a bit.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b08ed52..079c311 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -360,25 +360,27 @@ exit:
 }
 
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
-		unsigned long *mask, unsigned long *bits)
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	unsigned int bankmask, bankval;
+	int bank_shift, bank, ret;
 	u8 reg_val[MAX_BANK];
-	int ret;
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
+	for (bank = 0; bank < NBANK(chip); bank++) {
+		bankmask = mask[bank / sizeof(*mask)] >>
+			   ((bank % sizeof(*mask)) * 8);
+		if (bankmask) {
+			bankval = bits[bank / sizeof(*bits)] >>
+				  ((bank % sizeof(*bits)) * 8);
 			reg_val[bank] = (reg_val[bank] & ~bankmask) | bankval;
 		}
 	}
+
 	ret = i2c_smbus_write_i2c_block_data(chip->client,
 					     chip->offset->output << bank_shift,
 					     NBANK(chip), reg_val);
-- 
2.7.4

