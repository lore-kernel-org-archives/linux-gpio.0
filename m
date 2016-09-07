From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 2/5] gpio: pca953x: refactor pca953x_write_regs()
Date: Wed,  7 Sep 2016 15:37:49 +0200
Message-ID: <1473255472-16090-3-git-send-email-bgolaszewski@baylibre.com>
References: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473255472-16090-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Avoid the unnecessary if-else in pca953x_write_regs() by splitting
the routine into smaller, specialized functions and calling the right
one via a function pointer held in struct pca953x_chip.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pca953x.c | 73 ++++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d47e6f9..b3020ee 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -133,6 +133,8 @@ struct pca953x_chip {
 	unsigned long driver_data;
 
 	const struct pca953x_offset *offset;
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
@@ -754,6 +762,15 @@ static int pca953x_probe(struct i2c_client *client,
 	 */
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
+	if (chip->gpio_chip.ngpio <= 8)
+		chip->write_regs = pca953x_write_regs_8;
+	else if (chip->gpio_chip.ngpio >= 24)
+		chip->write_regs = pca953x_write_regs_24;
+	else
+		chip->write_regs = chip->chip_type == PCA953X_TYPE ?
+					pca953x_write_regs_16 :
+					pca957x_write_regs_16;
+
 	if (chip->chip_type == PCA953X_TYPE)
 		ret = device_pca953x_init(chip, invert);
 	else
-- 
2.7.4
