From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH 1/5] pinctrl: cherryview: convert bare unsigned to unsigned int
Date: Thu,  2 Jun 2016 22:55:39 +0100
Message-ID: <1464904543-4094-2-git-send-email-dan@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:60785 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932240AbcFBVyT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Jun 2016 17:54:19 -0400
In-Reply-To: <1464904543-4094-1-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, linus.walleij@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Dan O'Donovan <dan@emutex.com>

Addresses checkpatch warnings such as the following for this driver:

 WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 130 +++++++++++++++--------------
 1 file changed, 66 insertions(+), 64 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index ac4f564..c79f4cc 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -75,7 +75,7 @@
  * @invert_oe: Invert OE for this pin
  */
 struct chv_alternate_function {
-	unsigned pin;
+	unsigned int pin;
 	u8 mode;
 	bool invert_oe;
 };
@@ -92,7 +92,7 @@ struct chv_alternate_function {
  */
 struct chv_pingroup {
 	const char *name;
-	const unsigned *pins;
+	const unsigned int *pins;
 	size_t npins;
 	struct chv_alternate_function altfunc;
 	const struct chv_alternate_function *overrides;
@@ -117,8 +117,8 @@ struct chv_function {
  * @npins: Number of pins in this range
  */
 struct chv_gpio_pinrange {
-	unsigned base;
-	unsigned npins;
+	unsigned int base;
+	unsigned int npins;
 };
 
 /**
@@ -175,7 +175,7 @@ struct chv_pinctrl {
 	struct gpio_chip chip;
 	void __iomem *regs;
 	raw_spinlock_t lock;
-	unsigned intr_lines[16];
+	unsigned int intr_lines[16];
 	const struct chv_community *community;
 	u32 saved_intmask;
 	struct chv_pin_context *saved_pin_context;
@@ -286,24 +286,26 @@ static const struct pinctrl_pin_desc southwest_pins[] = {
 	PINCTRL_PIN(97, "GP_SSP_2_TXD"),
 };
 
-static const unsigned southwest_fspi_pins[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
-static const unsigned southwest_uart0_pins[] = { 16, 20 };
-static const unsigned southwest_uart1_pins[] = { 15, 16, 18, 20 };
-static const unsigned southwest_uart2_pins[] = { 17, 19, 21, 22 };
-static const unsigned southwest_i2c0_pins[] = { 61, 65 };
-static const unsigned southwest_hda_pins[] = { 30, 31, 32, 33, 34, 35, 36, 37 };
-static const unsigned southwest_lpe_pins[] = {
+static const unsigned int southwest_fspi_pins[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
+static const unsigned int southwest_uart0_pins[] = { 16, 20 };
+static const unsigned int southwest_uart1_pins[] = { 15, 16, 18, 20 };
+static const unsigned int southwest_uart2_pins[] = { 17, 19, 21, 22 };
+static const unsigned int southwest_i2c0_pins[] = { 61, 65 };
+static const unsigned int southwest_hda_pins[] = {
+	30, 31, 32, 33, 34, 35, 36, 37,
+};
+static const unsigned int southwest_lpe_pins[] = {
 	30, 31, 32, 33, 34, 35, 36, 37, 92, 94, 96, 97,
 };
-static const unsigned southwest_i2c1_pins[] = { 60, 63 };
-static const unsigned southwest_i2c2_pins[] = { 62, 66 };
-static const unsigned southwest_i2c3_pins[] = { 64, 67 };
-static const unsigned southwest_i2c4_pins[] = { 46, 50 };
-static const unsigned southwest_i2c5_pins[] = { 45, 48 };
-static const unsigned southwest_i2c6_pins[] = { 47, 51 };
-static const unsigned southwest_i2c_nfc_pins[] = { 49, 52 };
-static const unsigned southwest_smbus_pins[] = { 79, 81, 82 };
-static const unsigned southwest_spi3_pins[] = { 76, 79, 80, 81, 82 };
+static const unsigned int southwest_i2c1_pins[] = { 60, 63 };
+static const unsigned int southwest_i2c2_pins[] = { 62, 66 };
+static const unsigned int southwest_i2c3_pins[] = { 64, 67 };
+static const unsigned int southwest_i2c4_pins[] = { 46, 50 };
+static const unsigned int southwest_i2c5_pins[] = { 45, 48 };
+static const unsigned int southwest_i2c6_pins[] = { 47, 51 };
+static const unsigned int southwest_i2c_nfc_pins[] = { 49, 52 };
+static const unsigned int southwest_smbus_pins[] = { 79, 81, 82 };
+static const unsigned int southwest_spi3_pins[] = { 76, 79, 80, 81, 82 };
 
 /* LPE I2S TXD pins need to have invert_oe set */
 static const struct chv_alternate_function southwest_lpe_altfuncs[] = {
@@ -588,17 +590,17 @@ static const struct pinctrl_pin_desc southeast_pins[] = {
 	PINCTRL_PIN(85, "SDMMC3_1P8_EN"),
 };
 
-static const unsigned southeast_pwm0_pins[] = { 5 };
-static const unsigned southeast_pwm1_pins[] = { 1 };
-static const unsigned southeast_sdmmc1_pins[] = {
+static const unsigned int southeast_pwm0_pins[] = { 5 };
+static const unsigned int southeast_pwm1_pins[] = { 1 };
+static const unsigned int southeast_sdmmc1_pins[] = {
 	16, 17, 20, 23, 24, 26, 63, 65, 67, 68, 69,
 };
-static const unsigned southeast_sdmmc2_pins[] = { 15, 18, 19, 21, 22, 25 };
-static const unsigned southeast_sdmmc3_pins[] = {
+static const unsigned int southeast_sdmmc2_pins[] = { 15, 18, 19, 21, 22, 25 };
+static const unsigned int southeast_sdmmc3_pins[] = {
 	30, 31, 32, 33, 34, 35, 78, 81, 85,
 };
-static const unsigned southeast_spi1_pins[] = { 60, 61, 62, 64, 66 };
-static const unsigned southeast_spi2_pins[] = { 2, 3, 4, 6, 7 };
+static const unsigned int southeast_spi1_pins[] = { 60, 61, 62, 64, 66 };
+static const unsigned int southeast_spi2_pins[] = { 2, 3, 4, 6, 7 };
 
 static const struct chv_pingroup southeast_groups[] = {
 	PIN_GROUP("pwm0_grp", southeast_pwm0_pins, 1, false),
@@ -657,11 +659,11 @@ static const struct chv_community *chv_communities[] = {
 	&southeast_community,
 };
 
-static void __iomem *chv_padreg(struct chv_pinctrl *pctrl, unsigned offset,
-				unsigned reg)
+static void __iomem *chv_padreg(struct chv_pinctrl *pctrl, unsigned int offset,
+				unsigned int reg)
 {
-	unsigned family_no = offset / MAX_FAMILY_PAD_GPIO_NO;
-	unsigned pad_no = offset % MAX_FAMILY_PAD_GPIO_NO;
+	unsigned int family_no = offset / MAX_FAMILY_PAD_GPIO_NO;
+	unsigned int pad_no = offset % MAX_FAMILY_PAD_GPIO_NO;
 
 	offset = FAMILY_PAD_REGS_OFF + FAMILY_PAD_REGS_SIZE * family_no +
 		 GPIO_REGS_SIZE * pad_no;
@@ -677,7 +679,7 @@ static void chv_writel(u32 value, void __iomem *reg)
 }
 
 /* When Pad Cfg is locked, driver can only change GPIOTXState or GPIORXState */
-static bool chv_pad_locked(struct chv_pinctrl *pctrl, unsigned offset)
+static bool chv_pad_locked(struct chv_pinctrl *pctrl, unsigned int offset)
 {
 	void __iomem *reg;
 
@@ -693,15 +695,15 @@ static int chv_get_groups_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *chv_get_group_name(struct pinctrl_dev *pctldev,
-				      unsigned group)
+				      unsigned int group)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->community->groups[group].name;
 }
 
-static int chv_get_group_pins(struct pinctrl_dev *pctldev, unsigned group,
-			      const unsigned **pins, unsigned *npins)
+static int chv_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
+			      const unsigned int **pins, unsigned int *npins)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -711,7 +713,7 @@ static int chv_get_group_pins(struct pinctrl_dev *pctldev, unsigned group,
 }
 
 static void chv_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
-			     unsigned offset)
+			     unsigned int offset)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
@@ -758,7 +760,7 @@ static int chv_get_functions_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *chv_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
+					 unsigned int function)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -766,9 +768,9 @@ static const char *chv_get_function_name(struct pinctrl_dev *pctldev,
 }
 
 static int chv_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
+				   unsigned int function,
 				   const char * const **groups,
-				   unsigned * const ngroups)
+				   unsigned int * const ngroups)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -777,8 +779,8 @@ static int chv_get_function_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
-			      unsigned group)
+static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			      unsigned int function, unsigned int group)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct chv_pingroup *grp;
@@ -844,7 +846,7 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 
 static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 				   struct pinctrl_gpio_range *range,
-				   unsigned offset)
+				   unsigned int offset)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
@@ -904,7 +906,7 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 static void chv_gpio_disable_free(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
-				  unsigned offset)
+				  unsigned int offset)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
@@ -922,7 +924,7 @@ static void chv_gpio_disable_free(struct pinctrl_dev *pctldev,
 
 static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
-				  unsigned offset, bool input)
+				  unsigned int offset, bool input)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *reg = chv_padreg(pctrl, offset, CHV_PADCTRL0);
@@ -953,7 +955,7 @@ static const struct pinmux_ops chv_pinmux_ops = {
 	.gpio_set_direction = chv_gpio_set_direction,
 };
 
-static int chv_config_get(struct pinctrl_dev *pctldev, unsigned pin,
+static int chv_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			  unsigned long *config)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
@@ -1033,7 +1035,7 @@ static int chv_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 	return 0;
 }
 
-static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
+static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
 			       enum pin_config_param param, u16 arg)
 {
 	void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL0);
@@ -1099,8 +1101,8 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned pin,
 	return 0;
 }
 
-static int chv_config_set(struct pinctrl_dev *pctldev, unsigned pin,
-			  unsigned long *configs, unsigned nconfigs)
+static int chv_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			  unsigned long *configs, unsigned int nconfigs)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
@@ -1147,13 +1149,13 @@ static struct pinctrl_desc chv_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static unsigned chv_gpio_offset_to_pin(struct chv_pinctrl *pctrl,
-				       unsigned offset)
+static unsigned int chv_gpio_offset_to_pin(struct chv_pinctrl *pctrl,
+					   unsigned int offset)
 {
 	return pctrl->community->pins[offset].number;
 }
 
-static int chv_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int chv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
 	int pin = chv_gpio_offset_to_pin(pctrl, offset);
@@ -1172,10 +1174,10 @@ static int chv_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(ctrl0 & CHV_PADCTRL0_GPIORXSTATE);
 }
 
-static void chv_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
-	unsigned pin = chv_gpio_offset_to_pin(pctrl, offset);
+	unsigned int pin = chv_gpio_offset_to_pin(pctrl, offset);
 	unsigned long flags;
 	void __iomem *reg;
 	u32 ctrl0;
@@ -1195,10 +1197,10 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
-static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
-	unsigned pin = chv_gpio_offset_to_pin(pctrl, offset);
+	unsigned int pin = chv_gpio_offset_to_pin(pctrl, offset);
 	u32 ctrl0, direction;
 	unsigned long flags;
 
@@ -1212,13 +1214,13 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return direction != CHV_PADCTRL0_GPIOCFG_GPO;
 }
 
-static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	return pinctrl_gpio_direction_input(chip->base + offset);
 }
 
-static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
-				     int value)
+static int chv_gpio_direction_output(struct gpio_chip *chip,
+				     unsigned int offset, int value)
 {
 	chv_gpio_set(chip, offset, value);
 	return pinctrl_gpio_direction_output(chip->base + offset);
@@ -1286,7 +1288,7 @@ static void chv_gpio_irq_unmask(struct irq_data *d)
 	chv_gpio_irq_mask_unmask(d, false);
 }
 
-static unsigned chv_gpio_irq_startup(struct irq_data *d)
+static unsigned int chv_gpio_irq_startup(struct irq_data *d)
 {
 	/*
 	 * Check if the interrupt has been requested with 0 as triggering
@@ -1301,7 +1303,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_NONE) {
 		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 		struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
-		unsigned offset = irqd_to_hwirq(d);
+		unsigned int offset = irqd_to_hwirq(d);
 		int pin = chv_gpio_offset_to_pin(pctrl, offset);
 		irq_flow_handler_t handler;
 		unsigned long flags;
@@ -1329,11 +1331,11 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 	return 0;
 }
 
-static int chv_gpio_irq_type(struct irq_data *d, unsigned type)
+static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
-	unsigned offset = irqd_to_hwirq(d);
+	unsigned int offset = irqd_to_hwirq(d);
 	int pin = chv_gpio_offset_to_pin(pctrl, offset);
 	unsigned long flags;
 	u32 value;
@@ -1414,7 +1416,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 
 	pending = readl(pctrl->regs + CHV_INTSTAT);
 	for_each_set_bit(intr_line, &pending, 16) {
-		unsigned irq, offset;
+		unsigned int irq, offset;
 
 		offset = pctrl->intr_lines[intr_line];
 		irq = irq_find_mapping(gc->irqdomain, offset);
-- 
2.1.4

