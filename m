From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 5/5] gpio: pca953x: coding style fixes
Date: Fri,  9 Sep 2016 11:17:38 +0200
Message-ID: <1473412658-13120-6-git-send-email-bgolaszewski@baylibre.com>
References: <1473412658-13120-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473412658-13120-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

pca953x_gpio_set_multiple() has some coding style issues that make it
harder to read. Tweak the code a bit.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e36a9bf..5d05986 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -362,25 +362,28 @@ exit:
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
