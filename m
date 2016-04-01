From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v4 2/6] pinctrl: baytrail: Add pin control operations
Date: Fri,  1 Apr 2016 13:56:14 +0300
Message-ID: <1459508183-21843-4-git-send-email-cristina.ciocan@intel.com>
References: <1459508183-21843-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508183-21843-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>
List-Id: linux-gpio@vger.kernel.org

Add implementation for:
	- pin control, group information retrieval: count, name and pins
	- pin muxing:
		- function information (count, name and groups)
		- mux setting
		- gpio control (enable, disable, set direction)
	- pin configuration:
		- pull disable
		- pull up/down and pull strength
		- debounce
		- any other option is treated as not supported.

Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
---
 drivers/pinctrl/intel/Kconfig            |   3 +
 drivers/pinctrl/intel/pinctrl-baytrail.c | 560 +++++++++++++++++++++++++++++--
 2 files changed, 528 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 4d2efad..1c74e03 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -6,6 +6,9 @@ config PINCTRL_BAYTRAIL
 	bool "Intel Baytrail GPIO pin control"
 	depends on GPIOLIB && ACPI
 	select GPIOLIB_IRQCHIP
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
 	help
 	  driver for memory mapped GPIO functionality on Intel Baytrail
 	  platforms. Supports 3 banks with 102, 28 and 44 gpios.
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 364f56c..415d2d5 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -27,6 +27,9 @@
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 
 /* memory mapped register offsets */
 #define BYT_CONF0_REG		0x000
@@ -73,6 +76,14 @@
 #define BYT_NCORE_ACPI_UID	"2"
 #define BYT_SUS_ACPI_UID	"3"
 
+/*
+ * This is the function value most pins have for GPIO muxing. If the value
+ * differs from the default one, it must be explicitly mentioned. Otherwise, the
+ * pin control implementation will set the muxing value to default GPIO if it
+ * does not find a match for the requested function.
+ */
+#define BYT_DEFAULT_GPIO_MUX	0
+
 struct byt_gpio_pin_context {
 	u32 conf0;
 	u32 val;
@@ -722,6 +733,8 @@ struct byt_gpio {
 	void __iomem			*reg_base;
 	struct pinctrl_gpio_range	*range;
 	struct byt_gpio_pin_context	*saved_context;
+	const struct byt_pinctrl_soc_data *soc_data;
+	struct byt_community		*communities_copy;
 };
 
 static const struct byt_pinctrl_soc_data *byt_soc_data[] = {
@@ -731,52 +744,252 @@ static const struct byt_pinctrl_soc_data *byt_soc_data[] = {
 	NULL,
 };
 
-static void __iomem *byt_gpio_reg(struct gpio_chip *chip, unsigned offset,
-				 int reg)
+static struct byt_community *byt_get_community(struct byt_gpio *vg,
+					       unsigned int pin)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
-	u32 reg_offset;
+	struct byt_community *comm;
+	int i;
+
+	for (i = 0; i < vg->soc_data->ncommunities; i++) {
+		comm = vg->communities_copy + i;
+		if (pin < comm->pin_base + comm->npins && pin >= comm->pin_base)
+			return comm;
+	}
 
+	return NULL;
+}
+
+static void __iomem *byt_gpio_reg(struct byt_gpio *vg, unsigned int offset,
+				  int reg)
+{
+	struct byt_community *comm = byt_get_community(vg, offset);
+	u32 reg_offset = 0;
+
+	if (!comm)
+		return NULL;
+
+	offset -= comm->pin_base;
 	if (reg == BYT_INT_STAT_REG)
 		reg_offset = (offset / 32) * 4;
 	else
-		reg_offset = vg->range->pins[offset] * 16;
+		reg_offset = comm->pad_map[offset] * 16;
+
+	return comm->reg_base + reg_offset + reg;
+}
+
+static int byt_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+
+	return vg->soc_data->ngroups;
+}
+
+static const char *byt_get_group_name(struct pinctrl_dev *pctldev,
+				      unsigned int selector)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+
+	return vg->soc_data->groups[selector].name;
+}
+
+static int byt_get_group_pins(struct pinctrl_dev *pctldev,
+			      unsigned int selector,
+			      const unsigned int **pins,
+			      unsigned int *num_pins)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins		= vg->soc_data->groups[selector].pins;
+	*num_pins	= vg->soc_data->groups[selector].npins;
+
+	return 0;
+}
+
+static const struct pinctrl_ops byt_pinctrl_ops = {
+	.get_groups_count	= byt_get_groups_count,
+	.get_group_name		= byt_get_group_name,
+	.get_group_pins		= byt_get_group_pins,
+};
+
+static int byt_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+
+	return vg->soc_data->nfunctions;
+}
+
+static const char *byt_get_function_name(struct pinctrl_dev *pctldev,
+					 unsigned int selector)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+
+	return vg->soc_data->functions[selector].name;
+}
+
+static int byt_get_function_groups(struct pinctrl_dev *pctldev,
+				   unsigned int selector,
+				   const char * const **groups,
+				   unsigned int *num_groups)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups		= vg->soc_data->functions[selector].groups;
+	*num_groups	= vg->soc_data->functions[selector].ngroups;
+
+	return 0;
+}
+
+static int byt_get_group_simple_mux(const struct byt_pingroup group,
+				    const char *func_name,
+				    unsigned short *func)
+{
+	int i;
+
+	for (i = 0; i < group.nfuncs; i++) {
+		if (!strcmp(group.simple_funcs[i].name, func_name)) {
+			*func = group.simple_funcs[i].func;
+			return 0;
+		}
+	}
+
+	return 1;
+}
+
+static int byt_get_group_mixed_mux(const struct byt_pingroup group,
+				   const char *func_name,
+				   const unsigned short **func)
+{
+	int i;
+
+	for (i = 0; i < group.nfuncs; i++) {
+		if (!strcmp(group.mixed_funcs[i].name, func_name)) {
+			*func = group.mixed_funcs[i].func_values;
+			return 0;
+		}
+	}
 
-	return vg->reg_base + reg_offset + reg;
+	return 1;
 }
 
-static void byt_gpio_clear_triggering(struct byt_gpio *vg, unsigned offset)
+static void byt_set_group_simple_mux(struct byt_gpio *vg,
+				     const struct byt_pingroup group,
+				     unsigned short func)
 {
-	void __iomem *reg = byt_gpio_reg(&vg->chip, offset, BYT_CONF0_REG);
 	unsigned long flags;
-	u32 value;
+	int i;
 
 	raw_spin_lock_irqsave(&vg->lock, flags);
-	value = readl(reg);
-	value &= ~(BYT_TRIG_POS | BYT_TRIG_NEG | BYT_TRIG_LVL);
-	writel(value, reg);
+
+	for (i = 0; i < group.npins; i++) {
+		void __iomem *padcfg0;
+		u32 value;
+
+		padcfg0 = byt_gpio_reg(vg, group.pins[i], BYT_CONF0_REG);
+		if (!padcfg0) {
+			dev_warn(&vg->pdev->dev,
+				 "Group %s, pin %i not muxed (no padcfg0)\n",
+				 group.name, i);
+			continue;
+		}
+
+		value = readl(padcfg0);
+		value &= ~BYT_PIN_MUX;
+		value |= func;
+		writel(value, padcfg0);
+	}
+
 	raw_spin_unlock_irqrestore(&vg->lock, flags);
 }
 
+static void byt_set_group_mixed_mux(struct byt_gpio *vg,
+				    const struct byt_pingroup group,
+				    const unsigned short *func)
+{
+	unsigned long flags;
+	int i;
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
+
+	for (i = 0; i < group.npins; i++) {
+		void __iomem *padcfg0;
+		u32 value;
+
+		padcfg0 = byt_gpio_reg(vg, group.pins[i], BYT_CONF0_REG);
+		if (!padcfg0) {
+			dev_warn(&vg->pdev->dev,
+				 "Group %s, pin %i not muxed (no padcfg0)\n",
+				 group.name, i);
+			continue;
+		}
+
+		value = readl(padcfg0);
+		value &= ~BYT_PIN_MUX;
+		value |= func[i];
+		writel(value, padcfg0);
+	}
+
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
+}
+
+static int byt_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+		       unsigned int group_selector)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctldev);
+	const struct byt_function func = vg->soc_data->functions[func_selector];
+	const struct byt_pingroup group = vg->soc_data->groups[group_selector];
+	const unsigned short *mixed_func;
+	unsigned short simple_func;
+	int ret = 1;
+
+	if (group.has_simple_funcs)
+		ret = byt_get_group_simple_mux(group, func.name, &simple_func);
+	else
+		ret = byt_get_group_mixed_mux(group, func.name, &mixed_func);
+
+	if (ret)
+		byt_set_group_simple_mux(vg, group, BYT_DEFAULT_GPIO_MUX);
+	else if (group.has_simple_funcs)
+		byt_set_group_simple_mux(vg, group, simple_func);
+	else
+		byt_set_group_mixed_mux(vg, group, mixed_func);
+
+	return 0;
+}
+
 static u32 byt_get_gpio_mux(struct byt_gpio *vg, unsigned offset)
 {
 	/* SCORE pin 92-93 */
-	if (!strcmp(vg->range->name, BYT_SCORE_ACPI_UID) &&
-		offset >= 92 && offset <= 93)
+	if (!strcmp(vg->soc_data->uid, BYT_SCORE_ACPI_UID) &&
+	    offset >= 92 && offset <= 93)
 		return 1;
 
 	/* SUS pin 11-21 */
-	if (!strcmp(vg->range->name, BYT_SUS_ACPI_UID) &&
-		offset >= 11 && offset <= 21)
+	if (!strcmp(vg->soc_data->uid, BYT_SUS_ACPI_UID) &&
+	    offset >= 11 && offset <= 21)
 		return 1;
 
 	return 0;
 }
 
-static int byt_gpio_request(struct gpio_chip *chip, unsigned offset)
+static void byt_gpio_clear_triggering(struct byt_gpio *vg, unsigned int offset)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
-	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_CONF0_REG);
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
+	value = readl(reg);
+	value &= ~(BYT_TRIG_POS | BYT_TRIG_NEG | BYT_TRIG_LVL);
+	writel(value, reg);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
+}
+
+static int byt_gpio_request_enable(struct pinctrl_dev *pctl_dev,
+				   struct pinctrl_gpio_range *range,
+				   unsigned int offset)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	u32 value, gpio_mux;
 	unsigned long flags;
 
@@ -817,13 +1030,102 @@ static void byt_gpio_free(struct gpio_chip *chip, unsigned offset)
 	pm_runtime_put(&vg->pdev->dev);
 }
 
+static void byt_gpio_disable_free(struct pinctrl_dev *pctl_dev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int offset)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+
+	byt_gpio_clear_triggering(vg, offset);
+	pm_runtime_put(&vg->pdev->dev);
+}
+
+static int byt_gpio_set_direction(struct pinctrl_dev *pctl_dev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int offset,
+				  bool input)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
+	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
+
+	value = readl(val_reg);
+	value &= ~BYT_DIR_MASK;
+	if (input)
+		value |= BYT_OUTPUT_EN;
+	else
+		/*
+		 * Before making any direction modifications, do a check if gpio
+		 * is set for direct IRQ.  On baytrail, setting GPIO to output
+		 * does not make sense, so let's at least warn the caller before
+		 * they shoot themselves in the foot.
+		 */
+		WARN(readl(conf_reg) & BYT_DIRECT_IRQ_EN,
+		     "Potential Error: Setting GPIO with direct_irq_en to output");
+	writel(value, val_reg);
+
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
+
+	return 0;
+}
+
+static const struct pinmux_ops byt_pinmux_ops = {
+	.get_functions_count	= byt_get_functions_count,
+	.get_function_name	= byt_get_function_name,
+	.get_function_groups	= byt_get_function_groups,
+	.set_mux		= byt_set_mux,
+	.gpio_request_enable	= byt_gpio_request_enable,
+	.gpio_disable_free	= byt_gpio_disable_free,
+	.gpio_set_direction	= byt_gpio_set_direction,
+};
+
+static int byt_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct byt_gpio *vg = gpiochip_get_data(chip);
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
+	u32 value, gpio_mux;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
+
+	/*
+	 * In most cases, func pin mux 000 means GPIO function.
+	 * But, some pins may have func pin mux 001 represents
+	 * GPIO function.
+	 *
+	 * Because there are devices out there where some pins were not
+	 * configured correctly we allow changing the mux value from
+	 * request (but print out warning about that).
+	 */
+	value = readl(reg) & BYT_PIN_MUX;
+	gpio_mux = byt_get_gpio_mux(vg, offset);
+	if (WARN_ON(gpio_mux != value)) {
+		value = readl(reg) & ~BYT_PIN_MUX;
+		value |= gpio_mux;
+		writel(value, reg);
+
+		dev_warn(&vg->pdev->dev,
+			 "pin %u forcibly re-configured as GPIO\n", offset);
+	}
+
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
+
+	pm_runtime_get(&vg->pdev->dev);
+
+	return 0;
+}
+
 static int byt_irq_type(struct irq_data *d, unsigned type)
 {
 	struct byt_gpio *vg = gpiochip_get_data(irq_data_get_irq_chip_data(d));
 	u32 offset = irqd_to_hwirq(d);
 	u32 value;
 	unsigned long flags;
-	void __iomem *reg = byt_gpio_reg(&vg->chip, offset, BYT_CONF0_REG);
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 
 	if (offset >= vg->chip.ngpio)
 		return -EINVAL;
@@ -832,7 +1134,7 @@ static int byt_irq_type(struct irq_data *d, unsigned type)
 	value = readl(reg);
 
 	WARN(value & BYT_DIRECT_IRQ_EN,
-		"Bad pad config for io mode, force direct_irq_en bit clearing");
+	     "Bad pad config for io mode, force direct_irq_en bit clearing");
 
 	/* For level trigges the BYT_TRIG_POS and BYT_TRIG_NEG bits
 	 * are used to indicate high and low level triggering
@@ -852,10 +1154,198 @@ static int byt_irq_type(struct irq_data *d, unsigned type)
 	return 0;
 }
 
+static void byt_get_pull_strength(u32 reg, u16 *strength)
+{
+	switch (reg & BYT_PULL_STR_MASK) {
+	case BYT_PULL_STR_2K:
+		*strength = 2000;
+		break;
+	case BYT_PULL_STR_10K:
+		*strength = 10000;
+		break;
+	case BYT_PULL_STR_20K:
+		*strength = 20000;
+		break;
+	case BYT_PULL_STR_40K:
+		*strength = 40000;
+		break;
+	}
+}
+
+static int byt_set_pull_strength(u32 *reg, u16 strength)
+{
+	*reg &= ~BYT_PULL_STR_MASK;
+
+	switch (strength) {
+	case 2000:
+		*reg |= BYT_PULL_STR_2K;
+		break;
+	case 10000:
+		*reg |= BYT_PULL_STR_10K;
+		break;
+	case 20000:
+		*reg |= BYT_PULL_STR_20K;
+		break;
+	case 40000:
+		*reg |= BYT_PULL_STR_40K;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int byt_pin_config_get(struct pinctrl_dev *pctl_dev, unsigned int offset,
+			      unsigned long *config)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
+	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
+	unsigned long flags;
+	u32 conf, pull, val;
+	u16 arg = 0;
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
+	conf = readl(conf_reg);
+	pull = conf & BYT_PULL_ASSIGN_MASK;
+	val = readl(val_reg);
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (pull)
+			return -EINVAL;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		/* Pull assignment is only applicable in input mode */
+		if ((val & BYT_INPUT_EN) || pull != BYT_PULL_ASSIGN_DOWN)
+			return -EINVAL;
+
+		byt_get_pull_strength(conf, &arg);
+
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		/* Pull assignment is only applicable in input mode */
+		if ((val & BYT_INPUT_EN) || pull != BYT_PULL_ASSIGN_UP)
+			return -EINVAL;
+
+		byt_get_pull_strength(conf, &arg);
+
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
+			      unsigned int offset,
+			      unsigned long *configs,
+			      unsigned int num_configs)
+{
+	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
+	unsigned int param, arg;
+	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
+	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
+	unsigned long flags;
+	u32 conf, val;
+	int i, ret = 0;
+
+	raw_spin_lock_irqsave(&vg->lock, flags);
+
+	conf = readl(conf_reg);
+	val = readl(val_reg);
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			conf &= ~BYT_PULL_ASSIGN_MASK;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			/* Set default strength value in case none is given */
+			if (arg == 1)
+				arg = 2000;
+
+			/*
+			 * Pull assignment is only applicable in input mode. If
+			 * chip is not in input mode, set it and warn about it.
+			 */
+			if (val & BYT_INPUT_EN) {
+				val &= ~BYT_INPUT_EN;
+				writel(val, val_reg);
+				dev_warn(&vg->pdev->dev,
+					 "pin %u forcibly set to input mode\n",
+					 offset);
+			}
+
+			conf &= ~BYT_PULL_ASSIGN_MASK;
+			conf |= BYT_PULL_ASSIGN_DOWN;
+			ret = byt_set_pull_strength(&conf, arg);
+
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			/* Set default strength value in case none is given */
+			if (arg == 1)
+				arg = 2000;
+
+			/*
+			 * Pull assignment is only applicable in input mode. If
+			 * chip is not in input mode, set it and warn about it.
+			 */
+			if (val & BYT_INPUT_EN) {
+				val &= ~BYT_INPUT_EN;
+				writel(val, val_reg);
+				dev_warn(&vg->pdev->dev,
+					 "pin %u forcibly set to input mode\n",
+					 offset);
+			}
+
+			conf &= ~BYT_PULL_ASSIGN_MASK;
+			conf |= BYT_PULL_ASSIGN_UP;
+			ret = byt_set_pull_strength(&conf, arg);
+
+			break;
+		default:
+			ret = -ENOTSUPP;
+		}
+
+		if (ret)
+			break;
+	}
+
+	if (!ret)
+		writel(conf, conf_reg);
+
+	raw_spin_unlock_irqrestore(&vg->lock, flags);
+
+	return ret;
+}
+
+static const struct pinconf_ops byt_pinconf_ops = {
+	.is_generic	= true,
+	.pin_config_get	= byt_pin_config_get,
+	.pin_config_set	= byt_pin_config_set,
+};
+
+static const struct pinctrl_desc byt_pinctrl_desc = {
+	.pctlops	= &byt_pinctrl_ops,
+	.pmxops		= &byt_pinmux_ops,
+	.confops	= &byt_pinconf_ops,
+	.owner		= THIS_MODULE,
+};
+
 static int byt_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_VAL_REG);
 	struct byt_gpio *vg = gpiochip_get_data(chip);
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 val;
 
@@ -869,7 +1359,7 @@ static int byt_gpio_get(struct gpio_chip *chip, unsigned offset)
 static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
-	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_VAL_REG);
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 old_val;
 
@@ -888,7 +1378,7 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
-	void __iomem *reg = byt_gpio_reg(chip, offset, BYT_VAL_REG);
+	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
 	u32 value;
 
@@ -907,8 +1397,8 @@ static int byt_gpio_direction_output(struct gpio_chip *chip,
 				     unsigned gpio, int value)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
-	void __iomem *conf_reg = byt_gpio_reg(chip, gpio, BYT_CONF0_REG);
-	void __iomem *reg = byt_gpio_reg(chip, gpio, BYT_VAL_REG);
+	void __iomem *conf_reg = byt_gpio_reg(vg, gpio, BYT_CONF0_REG);
+	void __iomem *reg = byt_gpio_reg(vg, gpio, BYT_VAL_REG);
 	unsigned long flags;
 	u32 reg_val;
 
@@ -1019,7 +1509,7 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 
 	/* check from GPIO controller which pin triggered the interrupt */
 	for (base = 0; base < vg->chip.ngpio; base += 32) {
-		reg = byt_gpio_reg(&vg->chip, base, BYT_INT_STAT_REG);
+		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
 		pending = readl(reg);
 		for_each_set_bit(pin, &pending, 32) {
 			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
@@ -1037,7 +1527,7 @@ static void byt_irq_ack(struct irq_data *d)
 	void __iomem *reg;
 
 	raw_spin_lock(&vg->lock);
-	reg = byt_gpio_reg(&vg->chip, offset, BYT_INT_STAT_REG);
+	reg = byt_gpio_reg(vg, offset, BYT_INT_STAT_REG);
 	writel(BIT(offset % 32), reg);
 	raw_spin_unlock(&vg->lock);
 }
@@ -1051,7 +1541,7 @@ static void byt_irq_unmask(struct irq_data *d)
 	void __iomem *reg;
 	u32 value;
 
-	reg = byt_gpio_reg(&vg->chip, offset, BYT_CONF0_REG);
+	reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 
 	raw_spin_lock_irqsave(&vg->lock, flags);
 	value = readl(reg);
@@ -1106,7 +1596,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 	 * interrupts from misconfigured pins.
 	 */
 	for (i = 0; i < vg->chip.ngpio; i++) {
-		value = readl(byt_gpio_reg(&vg->chip, i, BYT_CONF0_REG));
+		value = readl(byt_gpio_reg(vg, i, BYT_CONF0_REG));
 		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i) &&
 		    !(value & BYT_DIRECT_IRQ_EN)) {
 			byt_gpio_clear_triggering(vg, i);
@@ -1116,7 +1606,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 
 	/* clear interrupt status trigger registers */
 	for (base = 0; base < vg->chip.ngpio; base += 32) {
-		reg = byt_gpio_reg(&vg->chip, base, BYT_INT_STAT_REG);
+		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
 		writel(0xffffffff, reg);
 		/* make sure trigger bits are cleared, if not then a pin
 		   might be misconfigured in bios */
@@ -1226,11 +1716,11 @@ static int byt_gpio_suspend(struct device *dev)
 		void __iomem *reg;
 		u32 value;
 
-		reg = byt_gpio_reg(&vg->chip, i, BYT_CONF0_REG);
+		reg = byt_gpio_reg(vg, i, BYT_CONF0_REG);
 		value = readl(reg) & BYT_CONF0_RESTORE_MASK;
 		vg->saved_context[i].conf0 = value;
 
-		reg = byt_gpio_reg(&vg->chip, i, BYT_VAL_REG);
+		reg = byt_gpio_reg(vg, i, BYT_VAL_REG);
 		value = readl(reg) & BYT_VAL_RESTORE_MASK;
 		vg->saved_context[i].val = value;
 	}
@@ -1248,7 +1738,7 @@ static int byt_gpio_resume(struct device *dev)
 		void __iomem *reg;
 		u32 value;
 
-		reg = byt_gpio_reg(&vg->chip, i, BYT_CONF0_REG);
+		reg = byt_gpio_reg(vg, i, BYT_CONF0_REG);
 		value = readl(reg);
 		if ((value & BYT_CONF0_RESTORE_MASK) !=
 		     vg->saved_context[i].conf0) {
@@ -1258,7 +1748,7 @@ static int byt_gpio_resume(struct device *dev)
 			dev_info(dev, "restored pin %d conf0 %#08x", i, value);
 		}
 
-		reg = byt_gpio_reg(&vg->chip, i, BYT_VAL_REG);
+		reg = byt_gpio_reg(vg, i, BYT_VAL_REG);
 		value = readl(reg);
 		if ((value & BYT_VAL_RESTORE_MASK) !=
 		     vg->saved_context[i].val) {
-- 
1.9.1
