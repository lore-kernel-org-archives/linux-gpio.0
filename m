From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v2 3/6] pinctrl: baytrail: Update gpio chip operations
Date: Mon, 28 Mar 2016 16:29:37 +0300
Message-ID: <1459171780-24856-4-git-send-email-cristina.ciocan@intel.com>
References: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:27570 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752983AbcC1N1A (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 28 Mar 2016 09:27:00 -0400
In-Reply-To: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>

This patch updates the gpio chip implementation in order to interact with
the pin control model: the chip contains reference to SOC data and
pin/group/community information is retrieved through the SOC reference.

Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 97 ++++++++++++++++++++++----------
 1 file changed, 68 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 6901964..eb06bf7 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -20,6 +20,7 @@
 #include <linux/types.h>
 #include <linux/bitops.h>
 #include <linux/interrupt.h>
+#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
@@ -1363,44 +1364,45 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	unsigned long flags;
 	u32 old_val;
 
-	raw_spin_lock_irqsave(&vg->lock, flags);
+	if (!reg)
+		return;
 
+	raw_spin_lock_irqsave(&vg->lock, flags);
 	old_val = readl(reg);
-
 	if (value)
 		writel(old_val | BYT_LEVEL, reg);
 	else
 		writel(old_val & ~BYT_LEVEL, reg);
-
 	raw_spin_unlock_irqrestore(&vg->lock, flags);
 }
 
-static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int byt_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
 	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 value;
 
-	raw_spin_lock_irqsave(&vg->lock, flags);
-
-	value = readl(reg) | BYT_DIR_MASK;
-	value &= ~BYT_INPUT_EN;		/* active low */
-	writel(value, reg);
+	if (!reg)
+		return -EINVAL;
 
+	raw_spin_lock_irqsave(&vg->lock, flags);
+	value = readl(reg);
 	raw_spin_unlock_irqrestore(&vg->lock, flags);
 
-	return 0;
+	if (!(value & BYT_OUTPUT_EN))
+		return GPIOF_DIR_OUT;
+	if (!(value & BYT_INPUT_EN))
+		return GPIOF_DIR_IN;
+
+	return -EINVAL;
 }
 
-static int byt_gpio_direction_output(struct gpio_chip *chip,
-				     unsigned gpio, int value)
+static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
-	void __iomem *conf_reg = byt_gpio_reg(vg, gpio, BYT_CONF0_REG);
-	void __iomem *reg = byt_gpio_reg(vg, gpio, BYT_VAL_REG);
+	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	unsigned long flags;
-	u32 reg_val;
 
 	raw_spin_lock_irqsave(&vg->lock, flags);
 
@@ -1413,15 +1415,18 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
 	WARN(readl(conf_reg) & BYT_DIRECT_IRQ_EN,
 		"Potential Error: Setting GPIO with direct_irq_en to output");
 
-	reg_val = readl(reg) | BYT_DIR_MASK;
-	reg_val &= ~(BYT_OUTPUT_EN | BYT_INPUT_EN);
+	return pinctrl_gpio_direction_input(chip->base + offset);
+}
 
-	if (value)
-		writel(reg_val | BYT_LEVEL, reg);
-	else
-		writel(reg_val & ~BYT_LEVEL, reg);
+static int byt_gpio_direction_output(struct gpio_chip *chip,
+				     unsigned int offset, int value)
+{
+	int ret = pinctrl_gpio_direction_output(chip->base + offset);
 
-	raw_spin_unlock_irqrestore(&vg->lock, flags);
+	if (ret)
+		return ret;
+
+	byt_gpio_set(chip, offset, value);
 
 	return 0;
 }
@@ -1430,20 +1435,42 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
 	int i;
-	u32 conf0, val, offs;
+	u32 conf0, val;
 
-	for (i = 0; i < vg->chip.ngpio; i++) {
+	for (i = 0; i < vg->soc_data->npins; i++) {
+		const struct byt_community *comm;
 		const char *pull_str = NULL;
 		const char *pull = NULL;
+		void __iomem *reg;
 		unsigned long flags;
 		const char *label;
-		offs = vg->range->pins[i] * 16;
+		unsigned int pin;
 
 		raw_spin_lock_irqsave(&vg->lock, flags);
-		conf0 = readl(vg->reg_base + offs + BYT_CONF0_REG);
-		val = readl(vg->reg_base + offs + BYT_VAL_REG);
+		pin = vg->soc_data->pins[i].number;
+		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
+		if (!reg) {
+			seq_printf(s,
+				   "Could not retrieve pin %i conf0 reg\n",
+				   pin);
+			continue;
+		}
+		conf0 = readl(reg);
+
+		reg = byt_gpio_reg(vg, pin, BYT_VAL_REG);
+		if (!reg) {
+			seq_printf(s,
+				   "Could not retrieve pin %i val reg\n", pin);
+		}
+		val = readl(reg);
 		raw_spin_unlock_irqrestore(&vg->lock, flags);
 
+		comm = byt_get_community(vg, pin);
+		if (!comm) {
+			seq_printf(s,
+				   "Could not get community for pin %i\n", pin);
+			continue;
+		}
 		label = gpiochip_is_requested(chip, i);
 		if (!label)
 			label = "Unrequested";
@@ -1474,12 +1501,12 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		seq_printf(s,
 			   " gpio-%-3d (%-20.20s) %s %s %s pad-%-3d offset:0x%03x mux:%d %s%s%s",
-			   i,
+			   pin,
 			   label,
 			   val & BYT_INPUT_EN ? "  " : "in",
 			   val & BYT_OUTPUT_EN ? "   " : "out",
 			   val & BYT_LEVEL ? "hi" : "lo",
-			   vg->range->pins[i], offs,
+			   comm->pad_map[i], comm->pad_map[i] * 32,
 			   conf0 & 0x7,
 			   conf0 & BYT_TRIG_NEG ? " fall" : "     ",
 			   conf0 & BYT_TRIG_POS ? " rise" : "     ",
@@ -1519,6 +1546,18 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 	chip->irq_eoi(data);
 }
 
+static const struct gpio_chip byt_gpio_chip = {
+	.owner			= THIS_MODULE,
+	.request		= gpiochip_generic_request,
+	.free			= gpiochip_generic_free,
+	.get_direction		= byt_gpio_get_direction,
+	.direction_input	= byt_gpio_direction_input,
+	.direction_output	= byt_gpio_direction_output,
+	.get			= byt_gpio_get,
+	.set			= byt_gpio_set,
+	.dbg_show		= byt_gpio_dbg_show,
+};
+
 static void byt_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-- 
1.9.1

