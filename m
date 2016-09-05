From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/5] gpio: pca953x: coding style fixes
Date: Mon,  5 Sep 2016 16:31:31 +0200
Message-ID: <1473085895-31711-2-git-send-email-bgolaszewski@baylibre.com>
References: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:37936 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754902AbcIEObo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 10:31:44 -0400
Received: by mail-wm0-f47.google.com with SMTP id 1so142652238wmz.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2016 07:31:44 -0700 (PDT)
In-Reply-To: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

pca953x_gpio_set_multiple() has some coding style issues that make it
harder to read. Tweak the code a bit.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 02f2a56..2312f8d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -355,13 +355,13 @@ exit:
 }
 
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
-		unsigned long *mask, unsigned long *bits)
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val[MAX_BANK];
-	int ret, offset = 0;
+	int ret, bank, offset = 0;
 	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
-	int bank;
+	unsigned int bankmask, bankval;
 
 	switch (chip->chip_type) {
 	case PCA953X_TYPE:
@@ -374,15 +374,16 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 
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
 	ret = i2c_smbus_write_i2c_block_data(chip->client, offset << bank_shift, NBANK(chip), reg_val);
 	if (ret)
 		goto exit;
-- 
2.7.4

