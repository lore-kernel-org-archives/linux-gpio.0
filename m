From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/5] gpio: pca953x: refactor pca953x_write_regs()
Date: Mon,  5 Sep 2016 16:31:33 +0200
Message-ID: <1473085895-31711-4-git-send-email-bgolaszewski@baylibre.com>
References: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:32941 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755059AbcIEObr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 10:31:47 -0400
Received: by mail-wm0-f53.google.com with SMTP id w12so5965328wmf.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2016 07:31:46 -0700 (PDT)
In-Reply-To: <1473085895-31711-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Avoid the unnecessary if-else in pca953x_write_regs() by splitting
the routine into smaller, specialized functions and calling the right
one via a function pointer held in struct pca953x_chip.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 75 ++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 17cba0a..b64a7bb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -133,6 +133,8 @@ struct pca953x_chip {
 	unsigned long driver_data;
 
 	struct pca953x_offset *offset;
+
+	int (*write_regs)(struct pca953x_chip *, int, u8 *);
 };
 
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
@@ -172,38 +174,44 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
 	return 0;
 }
 
-static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	int ret = 0;
+	return i2c_smbus_write_byte_data(chip->client, reg, *val);
+}
 
-	if (chip->gpio_chip.ngpio <= 8)
-		ret = i2c_smbus_write_byte_data(chip->client, reg, *val);
-	else if (chip->gpio_chip.ngpio >= 24) {
-		int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
-		ret = i2c_smbus_write_i2c_block_data(chip->client,
-					(reg << bank_shift) | REG_ADDR_AI,
-					NBANK(chip), val);
-	} else {
-		switch (chip->chip_type) {
-		case PCA953X_TYPE: {
-			__le16 word = cpu_to_le16(get_unaligned((u16 *)val));
+static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
+{
+	__le16 word = cpu_to_le16(get_unaligned((u16 *)val));
 
-			ret = i2c_smbus_write_word_data(chip->client, reg << 1,
-							(__force u16)word);
-			break;
-		}
-		case PCA957X_TYPE:
-			ret = i2c_smbus_write_byte_data(chip->client, reg << 1,
-							val[0]);
-			if (ret < 0)
-				break;
-			ret = i2c_smbus_write_byte_data(chip->client,
-							(reg << 1) + 1,
-							val[1]);
-			break;
-		}
-	}
+	return i2c_smbus_write_word_data(chip->client,
+					 reg << 1, (__force u16)word);
+}
+
+static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
+{
+	int ret;
 
+	ret = i2c_smbus_write_byte_data(chip->client, reg << 1, val[0]);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(chip->client, (reg << 1) + 1, val[1]);
+}
+
+static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
+{
+	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+
+	return i2c_smbus_write_i2c_block_data(chip->client,
+					      (reg << bank_shift) | REG_ADDR_AI,
+					      NBANK(chip), val);
+}
+
+static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
+{
+	int ret = 0;
+
+	ret = chip->write_regs(chip, reg, val);
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -645,6 +653,9 @@ static int device_pca953x_init(struct pca953x_chip *chip, u32 invert)
 
 	chip->offset = &pca953x_offsets;
 
+	if (!chip->write_regs)
+		chip->write_regs = pca953x_write_regs_16;
+
 	ret = pca953x_read_regs(chip, PCA953X_OUTPUT, chip->reg_output);
 	if (ret)
 		goto out;
@@ -672,6 +683,9 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 
 	chip->offset = &pca957x_offsets;
 
+	if (!chip->write_regs)
+		chip->write_regs = pca957x_write_regs_16;
+
 	ret = pca953x_read_regs(chip, PCA957X_OUT, chip->reg_output);
 	if (ret)
 		goto out;
@@ -755,6 +769,11 @@ static int pca953x_probe(struct i2c_client *client,
 	 */
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
+	if (chip->gpio_chip.ngpio <= 8)
+		chip->write_regs = pca953x_write_regs_8;
+	else if (chip->gpio_chip.ngpio >= 24)
+		chip->write_regs = pca953x_write_regs_24;
+
 	if (chip->chip_type == PCA953X_TYPE)
 		ret = device_pca953x_init(chip, invert);
 	else
-- 
2.7.4

