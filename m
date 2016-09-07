From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 3/5] gpio: pca953x: refactor pca953x_read_regs()
Date: Wed,  7 Sep 2016 16:49:28 +0200
Message-ID: <1473259770-26224-4-git-send-email-bgolaszewski@baylibre.com>
References: <1473259770-26224-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36128 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938707AbcIGOtn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 10:49:43 -0400
Received: by mail-wm0-f51.google.com with SMTP id b187so120180413wme.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 07:49:43 -0700 (PDT)
In-Reply-To: <1473259770-26224-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Avoid the unnecessary if-else in pca953x_read_regs() by spltting the
routine into smaller, specialized functions and calling the right one
via a function pointer held in struct pca953x.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 49 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 093bec1..52165ce 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -135,6 +135,7 @@ struct pca953x_chip {
 	const struct pca953x_offset *offset;
 
 	int (*write_regs)(struct pca953x_chip *, int, u8 *);
+	int (*read_regs)(struct pca953x_chip *, int, u8 *);
 };
 
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
@@ -220,24 +221,41 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 	return 0;
 }
 
-static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_read_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int ret;
 
-	if (chip->gpio_chip.ngpio <= 8) {
-		ret = i2c_smbus_read_byte_data(chip->client, reg);
-		*val = ret;
-	} else if (chip->gpio_chip.ngpio >= 24) {
-		int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	ret = i2c_smbus_read_byte_data(chip->client, reg);
+	*val = ret;
 
-		ret = i2c_smbus_read_i2c_block_data(chip->client,
-					(reg << bank_shift) | REG_ADDR_AI,
-					NBANK(chip), val);
-	} else {
-		ret = i2c_smbus_read_word_data(chip->client, reg << 1);
-		val[0] = (u16)ret & 0xFF;
-		val[1] = (u16)ret >> 8;
-	}
+	return ret;
+}
+
+static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
+{
+	int ret;
+
+	ret = i2c_smbus_read_word_data(chip->client, reg << 1);
+	val[0] = (u16)ret & 0xFF;
+	val[1] = (u16)ret >> 8;
+
+	return ret;
+}
+
+static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
+{
+	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+
+	return i2c_smbus_read_i2c_block_data(chip->client,
+					     (reg << bank_shift) | REG_ADDR_AI,
+					     NBANK(chip), val);
+}
+
+static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
+{
+	int ret;
+
+	ret = chip->read_regs(chip, reg, val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
@@ -764,13 +782,16 @@ static int pca953x_probe(struct i2c_client *client,
 
 	if (chip->gpio_chip.ngpio <= 8) {
 		chip->write_regs = pca953x_write_regs_8;
+		chip->read_regs = pca953x_read_regs_8;
 	} else if (chip->gpio_chip.ngpio >= 24) {
 		chip->write_regs = pca953x_write_regs_24;
+		chip->read_regs = pca953x_read_regs_24;
 	} else {
 		if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
 			chip->write_regs = pca953x_write_regs_16;
 		else
 			chip->write_regs = pca957x_write_regs_16;
+		chip->read_regs = pca953x_read_regs_16;
 	}
 
 	if (chip->chip_type == PCA953X_TYPE)
-- 
2.7.4

