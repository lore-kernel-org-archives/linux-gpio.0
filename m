From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 1/6] gpio: pca953x: code shrink
Date: Thu,  8 Sep 2016 12:48:17 +0200
Message-ID: <1473331702-26711-2-git-send-email-bgolaszewski@baylibre.com>
References: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37574 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751284AbcIHKs3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2016 06:48:29 -0400
Received: by mail-wm0-f53.google.com with SMTP id w12so81255358wmf.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2016 03:48:28 -0700 (PDT)
In-Reply-To: <1473331702-26711-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are multiple places in the driver code where a
switch (chip->chip_type) is used to determine the proper register
offset.

Unduplicate the code by adding a simple structure holding the possible
offsets that differ between the pca953x and pca957x chip families and
use it to avoid the checks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 122 +++++++++++++++-----------------------------
 1 file changed, 42 insertions(+), 80 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 02f2a56..2a3194f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -94,6 +94,24 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
 
 #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
 
+struct pca953x_reg_config {
+	int direction;
+	int output;
+	int input;
+};
+
+static const struct pca953x_reg_config pca953x_regs = {
+	.direction = PCA953X_DIRECTION,
+	.output = PCA953X_OUTPUT,
+	.input = PCA953X_INPUT,
+};
+
+static const struct pca953x_reg_config pca957x_regs = {
+	.direction = PCA957X_CFG,
+	.output = PCA957X_OUT,
+	.input = PCA957X_IN,
+};
+
 struct pca953x_chip {
 	unsigned gpio_start;
 	u8 reg_output[MAX_BANK];
@@ -113,6 +131,8 @@ struct pca953x_chip {
 	const char *const *names;
 	int	chip_type;
 	unsigned long driver_data;
+
+	const struct pca953x_reg_config *regs;
 };
 
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
@@ -222,20 +242,12 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
-	int ret, offset = 0;
+	int ret;
 
 	mutex_lock(&chip->i2c_lock);
 	reg_val = chip->reg_direction[off / BANK_SZ] | (1u << (off % BANK_SZ));
 
-	switch (chip->chip_type) {
-	case PCA953X_TYPE:
-		offset = PCA953X_DIRECTION;
-		break;
-	case PCA957X_TYPE:
-		offset = PCA957X_CFG;
-		break;
-	}
-	ret = pca953x_write_single(chip, offset, reg_val, off);
+	ret = pca953x_write_single(chip, chip->regs->direction, reg_val, off);
 	if (ret)
 		goto exit;
 
@@ -250,7 +262,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
-	int ret, offset = 0;
+	int ret;
 
 	mutex_lock(&chip->i2c_lock);
 	/* set output level */
@@ -261,15 +273,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		reg_val = chip->reg_output[off / BANK_SZ]
 			& ~(1u << (off % BANK_SZ));
 
-	switch (chip->chip_type) {
-	case PCA953X_TYPE:
-		offset = PCA953X_OUTPUT;
-		break;
-	case PCA957X_TYPE:
-		offset = PCA957X_OUT;
-		break;
-	}
-	ret = pca953x_write_single(chip, offset, reg_val, off);
+	ret = pca953x_write_single(chip, chip->regs->output, reg_val, off);
 	if (ret)
 		goto exit;
 
@@ -277,15 +281,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 
 	/* then direction */
 	reg_val = chip->reg_direction[off / BANK_SZ] & ~(1u << (off % BANK_SZ));
-	switch (chip->chip_type) {
-	case PCA953X_TYPE:
-		offset = PCA953X_DIRECTION;
-		break;
-	case PCA957X_TYPE:
-		offset = PCA957X_CFG;
-		break;
-	}
-	ret = pca953x_write_single(chip, offset, reg_val, off);
+	ret = pca953x_write_single(chip, chip->regs->direction, reg_val, off);
 	if (ret)
 		goto exit;
 
@@ -299,18 +295,10 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u32 reg_val;
-	int ret, offset = 0;
+	int ret;
 
 	mutex_lock(&chip->i2c_lock);
-	switch (chip->chip_type) {
-	case PCA953X_TYPE:
-		offset = PCA953X_INPUT;
-		break;
-	case PCA957X_TYPE:
-		offset = PCA957X_IN;
-		break;
-	}
-	ret = pca953x_read_single(chip, offset, &reg_val, off);
+	ret = pca953x_read_single(chip, chip->regs->input, &reg_val, off);
 	mutex_unlock(&chip->i2c_lock);
 	if (ret < 0) {
 		/* NOTE:  diagnostic already emitted; that's all we should
@@ -327,7 +315,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
-	int ret, offset = 0;
+	int ret;
 
 	mutex_lock(&chip->i2c_lock);
 	if (val)
@@ -337,15 +325,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 		reg_val = chip->reg_output[off / BANK_SZ]
 			& ~(1u << (off % BANK_SZ));
 
-	switch (chip->chip_type) {
-	case PCA953X_TYPE:
-		offset = PCA953X_OUTPUT;
-		break;
-	case PCA957X_TYPE:
-		offset = PCA957X_OUT;
-		break;
-	}
-	ret = pca953x_write_single(chip, offset, reg_val, off);
+	ret = pca953x_write_single(chip, chip->regs->output, reg_val, off);
 	if (ret)
 		goto exit;
 
@@ -359,19 +339,10 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val[MAX_BANK];
-	int ret, offset = 0;
+	int ret;
 	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 	int bank;
 
-	switch (chip->chip_type) {
-	case PCA953X_TYPE:
-		offset = PCA953X_OUTPUT;
-		break;
-	case PCA957X_TYPE:
-		offset = PCA957X_OUT;
-		break;
-	}
-
 	memcpy(reg_val, chip->reg_output, NBANK(chip));
 	mutex_lock(&chip->i2c_lock);
 	for(bank=0; bank<NBANK(chip); bank++) {
@@ -383,7 +354,9 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 			reg_val[bank] = (reg_val[bank] & ~bankmask) | bankval;
 		}
 	}
-	ret = i2c_smbus_write_i2c_block_data(chip->client, offset << bank_shift, NBANK(chip), reg_val);
+	ret = i2c_smbus_write_i2c_block_data(chip->client,
+					     chip->regs->output << bank_shift,
+					     NBANK(chip), reg_val);
 	if (ret)
 		goto exit;
 
@@ -515,7 +488,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 	bool pending_seen = false;
 	bool trigger_seen = false;
 	u8 trigger[MAX_BANK];
-	int ret, i, offset = 0;
+	int ret, i;
 
 	if (chip->driver_data & PCA_PCAL) {
 		/* Read the current interrupt status from the device */
@@ -540,15 +513,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 		return pending_seen;
 	}
 
-	switch (chip->chip_type) {
-	case PCA953X_TYPE:
-		offset = PCA953X_INPUT;
-		break;
-	case PCA957X_TYPE:
-		offset = PCA957X_IN;
-		break;
-	}
-	ret = pca953x_read_regs(chip, offset, cur_stat);
+	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
 	if (ret)
 		return false;
 
@@ -608,20 +573,13 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 			     int irq_base)
 {
 	struct i2c_client *client = chip->client;
-	int ret, i, offset = 0;
+	int ret, i;
 
 	if (client->irq && irq_base != -1
 			&& (chip->driver_data & PCA_INT)) {
 
-		switch (chip->chip_type) {
-		case PCA953X_TYPE:
-			offset = PCA953X_INPUT;
-			break;
-		case PCA957X_TYPE:
-			offset = PCA957X_IN;
-			break;
-		}
-		ret = pca953x_read_regs(chip, offset, chip->irq_stat);
+		ret = pca953x_read_regs(chip,
+					chip->regs->input, chip->irq_stat);
 		if (ret)
 			return ret;
 
@@ -684,6 +642,8 @@ static int device_pca953x_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
+	chip->regs = &pca953x_regs;
+
 	ret = pca953x_read_regs(chip, PCA953X_OUTPUT, chip->reg_output);
 	if (ret)
 		goto out;
@@ -709,6 +669,8 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
+	chip->regs = &pca957x_regs;
+
 	ret = pca953x_read_regs(chip, PCA957X_OUT, chip->reg_output);
 	if (ret)
 		goto out;
-- 
2.7.4

