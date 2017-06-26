From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset calculation
Date: Mon, 26 Jun 2017 10:37:04 -0700
Message-ID: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:64201 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751457AbdFZRhM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Jun 2017 13:37:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

According to Whiskey Cove PMIC GPIO controller specification, for GPIO
pins 0-12, GPIO input and output register control address range from,

0x4e44-0x4e50 for GPIO outputs control register

0x4e51-0x4e5d for GPIO input control register

But, currently when calculating the GPIO register offsets in to_reg()
function, all GPIO pins in the same bank uses the same GPIO control
register address. This logic is incorrect. This patch fixes this
issue.

This patch also adds support to selectively skip register modification
for virtual GPIOs.

In case of Whiskey Cove PMIC, ACPI code may use up 94 virtual GPIOs.
These virtual GPIOs are used by the ACPI code as means to access various
non GPIO bits of PMIC. So for these virtual GPIOs, we don't need to
manipulate the physical GPIO pin register. A similar patch has been
merged recently by Hans for Crystal Cove PMIC GPIO driver. You can
find more details about it in Commit 9a752b4c9ab9 ("gpio: crystalcove:
Do not write regular gpio registers for virtual GPIOs")

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reported-by: Jukka Laitinen <jukka.laitinen@intel.com>
---
 drivers/gpio/gpio-wcove.c | 75 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 24 deletions(-)

Changes since v1: 
 * Removed some unnecessary comments.

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 7b1bc20..37c103e 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -108,19 +108,14 @@ struct wcove_gpio {
 static inline unsigned int to_reg(int gpio, enum ctrl_register reg_type)
 {
 	unsigned int reg;
-	int bank;
 
-	if (gpio < BANK0_NR_PINS)
-		bank = 0;
-	else if (gpio < BANK0_NR_PINS + BANK1_NR_PINS)
-		bank = 1;
-	else
-		bank = 2;
+	if (gpio >= WCOVE_GPIO_NUM)
+		return -EOPNOTSUPP;
 
 	if (reg_type == CTRL_IN)
-		reg = GPIO_IN_CTRL_BASE + bank;
+		reg = GPIO_IN_CTRL_BASE + gpio;
 	else
-		reg = GPIO_OUT_CTRL_BASE + bank;
+		reg = GPIO_OUT_CTRL_BASE + gpio;
 
 	return reg;
 }
@@ -145,7 +140,10 @@ static void wcove_update_irq_mask(struct wcove_gpio *wg, int gpio)
 
 static void wcove_update_irq_ctrl(struct wcove_gpio *wg, int gpio)
 {
-	unsigned int reg = to_reg(gpio, CTRL_IN);
+	int reg = to_reg(gpio, CTRL_IN);
+
+	if (reg < 0)
+		return;
 
 	regmap_update_bits(wg->regmap, reg, CTLI_INTCNT_BE, wg->intcnt);
 }
@@ -153,27 +151,36 @@ static void wcove_update_irq_ctrl(struct wcove_gpio *wg, int gpio)
 static int wcove_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
+	int reg = to_reg(gpio, CTRL_OUT);
+
+	if (reg < 0)
+		return 0;
 
-	return regmap_write(wg->regmap, to_reg(gpio, CTRL_OUT),
-			    CTLO_INPUT_SET);
+	return regmap_write(wg->regmap, reg, CTLO_INPUT_SET);
 }
 
 static int wcove_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
 				    int value)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
+	int reg = to_reg(gpio, CTRL_OUT);
 
-	return regmap_write(wg->regmap, to_reg(gpio, CTRL_OUT),
-			    CTLO_OUTPUT_SET | value);
+	if (reg < 0)
+		return 0;
+
+	return regmap_write(wg->regmap, reg, CTLO_OUTPUT_SET | value);
 }
 
 static int wcove_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 	unsigned int val;
-	int ret;
+	int ret, reg = to_reg(gpio, CTRL_OUT);
+
+	if (reg < 0)
+		return 0;
 
-	ret = regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &val);
+	ret = regmap_read(wg->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -184,9 +191,12 @@ static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 	unsigned int val;
-	int ret;
+	int ret, reg = to_reg(gpio, CTRL_IN);
+
+	if (reg < 0)
+		return 0;
 
-	ret = regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &val);
+	ret = regmap_read(wg->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -197,25 +207,33 @@ static void wcove_gpio_set(struct gpio_chip *chip,
 				 unsigned int gpio, int value)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
+	int reg = to_reg(gpio, CTRL_OUT);
+
+	if (reg < 0)
+		return;
 
 	if (value)
-		regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT), 1, 1);
+		regmap_update_bits(wg->regmap, reg, 1, 1);
 	else
-		regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT), 1, 0);
+		regmap_update_bits(wg->regmap, reg, 1, 0);
 }
 
 static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
 				 unsigned long config)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
+	int reg = to_reg(gpio, CTRL_OUT);
+
+	if (reg < 0)
+		return 0;
 
 	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
-						CTLO_DRV_MASK, CTLO_DRV_OD);
+		return regmap_update_bits(wg->regmap, reg, CTLO_DRV_MASK,
+					  CTLO_DRV_OD);
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
-						CTLO_DRV_MASK, CTLO_DRV_CMOS);
+		return regmap_update_bits(wg->regmap, reg, CTLO_DRV_MASK,
+					  CTLO_DRV_CMOS);
 	default:
 		break;
 	}
@@ -228,6 +246,9 @@ static int wcove_irq_type(struct irq_data *data, unsigned int type)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 
+	if (data->hwirq >= WCOVE_GPIO_NUM)
+		return 0;
+
 	switch (type) {
 	case IRQ_TYPE_NONE:
 		wg->intcnt = CTLI_INTCNT_DIS;
@@ -278,6 +299,9 @@ static void wcove_irq_unmask(struct irq_data *data)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 
+	if (data->hwirq >= WCOVE_GPIO_NUM)
+		return;
+
 	wg->set_irq_mask = false;
 	wg->update |= UPDATE_IRQ_MASK;
 }
@@ -287,6 +311,9 @@ static void wcove_irq_mask(struct irq_data *data)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 
+	if (data->hwirq >= WCOVE_GPIO_NUM)
+		return;
+
 	wg->set_irq_mask = true;
 	wg->update |= UPDATE_IRQ_MASK;
 }
-- 
2.7.4

