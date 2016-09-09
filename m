From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 1/5] gpio: pca953x: code shrink
Date: Fri,  9 Sep 2016 11:17:34 +0200
Message-ID: <1473412658-13120-2-git-send-email-bgolaszewski@baylibre.com>
References: <1473412658-13120-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473412658-13120-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

There are multiple places in the driver code where a
switch (chip->chip_type) is used to determine the proper register
offset.

Unduplicate the code by adding a simple structure holding the possible
offsets that differ between the pca953x and pca957x chip families and
use it to avoid the checks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 133 ++++++++++++++++----------------------------
 1 file changed, 48 insertions(+), 85 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b9d31d7..5d65c9e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -95,6 +95,24 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
 
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
@@ -115,6 +133,8 @@ struct pca953x_chip {
 	int	chip_type;
 	unsigned long driver_data;
 	struct regulator *regulator;
+
+	const struct pca953x_reg_config *regs;
 };
 
 static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
@@ -224,20 +244,12 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
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
 
@@ -252,7 +264,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
-	int ret, offset = 0;
+	int ret;
 
 	mutex_lock(&chip->i2c_lock);
 	/* set output level */
@@ -263,15 +275,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
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
 
@@ -279,15 +283,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 
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
 
@@ -301,18 +297,10 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
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
@@ -329,7 +317,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 reg_val;
-	int ret, offset = 0;
+	int ret;
 
 	mutex_lock(&chip->i2c_lock);
 	if (val)
@@ -339,15 +327,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
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
 
@@ -361,19 +341,10 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
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
@@ -385,7 +356,9 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 			reg_val[bank] = (reg_val[bank] & ~bankmask) | bankval;
 		}
 	}
-	ret = i2c_smbus_write_i2c_block_data(chip->client, offset << bank_shift, NBANK(chip), reg_val);
+	ret = i2c_smbus_write_i2c_block_data(chip->client,
+					     chip->regs->output << bank_shift,
+					     NBANK(chip), reg_val);
 	if (ret)
 		goto exit;
 
@@ -517,7 +490,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 	bool pending_seen = false;
 	bool trigger_seen = false;
 	u8 trigger[MAX_BANK];
-	int ret, i, offset = 0;
+	int ret, i;
 
 	if (chip->driver_data & PCA_PCAL) {
 		/* Read the current interrupt status from the device */
@@ -542,15 +515,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
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
 
@@ -610,20 +575,13 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
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
 
@@ -686,12 +644,14 @@ static int device_pca953x_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
-	ret = pca953x_read_regs(chip, PCA953X_OUTPUT, chip->reg_output);
+	chip->regs = &pca953x_regs;
+
+	ret = pca953x_read_regs(chip, chip->regs->output, chip->reg_output);
 	if (ret)
 		goto out;
 
-	ret = pca953x_read_regs(chip, PCA953X_DIRECTION,
-			       chip->reg_direction);
+	ret = pca953x_read_regs(chip, chip->regs->direction,
+				chip->reg_direction);
 	if (ret)
 		goto out;
 
@@ -711,10 +671,13 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 	u8 val[MAX_BANK];
 
-	ret = pca953x_read_regs(chip, PCA957X_OUT, chip->reg_output);
+	chip->regs = &pca957x_regs;
+
+	ret = pca953x_read_regs(chip, chip->regs->output, chip->reg_output);
 	if (ret)
 		goto out;
-	ret = pca953x_read_regs(chip, PCA957X_CFG, chip->reg_direction);
+	ret = pca953x_read_regs(chip, chip->regs->direction,
+				chip->reg_direction);
 	if (ret)
 		goto out;
 
-- 
2.7.4
