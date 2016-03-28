From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH v2 5/6] pinctrl: baytrail: Register pin control handling
Date: Mon, 28 Mar 2016 16:29:39 +0300
Message-ID: <1459171780-24856-6-git-send-email-cristina.ciocan@intel.com>
References: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>
List-Id: linux-gpio@vger.kernel.org

This patch updates device's probing, removal and irq handling in order to
register it as pinctrl device. Pin control data is matched by ACPI UID,
since it is passed along as driver data in acpi_device_id structure.

Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 447 +++++++++++++++----------------
 1 file changed, 221 insertions(+), 226 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index d8a6809..0ba28fd 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -181,6 +181,17 @@ struct byt_pinctrl_soc_data {
 	size_t ncommunities;
 };
 
+struct byt_gpio {
+	struct gpio_chip chip;
+	struct platform_device *pdev;
+	struct pinctrl_dev *pctl_dev;
+	struct pinctrl_desc pctl_desc;
+	raw_spinlock_t lock;
+	const struct byt_pinctrl_soc_data *soc_data;
+	struct byt_community *communities_copy;
+	struct byt_gpio_pin_context *saved_context;
+};
+
 /* SCORE pins */
 static const struct pinctrl_pin_desc byt_score_pins[] = {
 	PINCTRL_PIN(0, "SATA_GP[0]"),		/* GPIOC_0 */
@@ -287,20 +298,6 @@ static const struct pinctrl_pin_desc byt_score_pins[] = {
 	PINCTRL_PIN(101, "PMC_PLT_CLK[5]"),	/* GPIOC_101 */
 };
 
-static unsigned const score_pins[BYT_NGPIO_SCORE] = {
-	85, 89, 93, 96, 99, 102, 98, 101, 34, 37,
-	36, 38, 39, 35, 40, 84, 62, 61, 64, 59,
-	54, 56, 60, 55, 63, 57, 51, 50, 53, 47,
-	52, 49, 48, 43, 46, 41, 45, 42, 58, 44,
-	95, 105, 70, 68, 67, 66, 69, 71, 65, 72,
-	86, 90, 88, 92, 103, 77, 79, 83, 78, 81,
-	80, 82, 13, 12, 15, 14, 17, 18, 19, 16,
-	2, 1, 0, 4, 6, 7, 9, 8, 33, 32,
-	31, 30, 29, 27, 25, 28, 26, 23, 21, 20,
-	24, 22, 5, 3, 10, 11, 106, 87, 91, 104,
-	97, 100,
-};
-
 static const unsigned int byt_score_pins_map[BYT_NGPIO_SCORE] = {
 	85, 89, 93, 96, 99, 102, 98, 101, 34, 37,
 	36, 38, 39, 35, 40, 84, 62, 61, 64, 59,
@@ -571,14 +568,6 @@ static const struct pinctrl_pin_desc byt_sus_pins[] = {
 	PINCTRL_PIN(43, "USB_ULPI_REFCLK"),	/* GPIOS_43 */
 };
 
-static const unsigned int sus_pins[BYT_NGPIO_SUS] = {
-	29, 33, 30, 31, 32, 34, 36, 35, 38, 37,
-	18, 7, 11, 20, 17, 1, 8, 10, 19, 12,
-	0, 2, 23, 39, 28, 27, 22, 21, 24, 25,
-	26, 51, 56, 54, 49, 55, 48, 57, 50, 58,
-	52, 53, 59, 40,
-};
-
 static const unsigned int byt_sus_pins_map[BYT_NGPIO_SUS] = {
 	29, 33, 30, 31, 32, 34, 36, 35, 38, 37,
 	18, 7, 11, 20, 17, 1, 8, 10, 19, 12,
@@ -701,43 +690,6 @@ static const struct byt_pinctrl_soc_data byt_ncore_soc_data = {
 	.ncommunities	= ARRAY_SIZE(byt_ncore_communities),
 };
 
-static unsigned const ncore_pins[BYT_NGPIO_NCORE] = {
-	19, 18, 17, 20, 21, 22, 24, 25, 23, 16,
-	14, 15, 12, 26, 27, 1, 4, 8, 11, 0,
-	3, 6, 10, 13, 2, 5, 9, 7,
-};
-
-static struct pinctrl_gpio_range byt_ranges[] = {
-	{
-		.name = BYT_SCORE_ACPI_UID, /* match with acpi _UID in probe */
-		.npins = BYT_NGPIO_SCORE,
-		.pins = score_pins,
-	},
-	{
-		.name = BYT_NCORE_ACPI_UID,
-		.npins = BYT_NGPIO_NCORE,
-		.pins = ncore_pins,
-	},
-	{
-		.name = BYT_SUS_ACPI_UID,
-		.npins = BYT_NGPIO_SUS,
-		.pins = sus_pins,
-	},
-	{
-	},
-};
-
-struct byt_gpio {
-	struct gpio_chip		chip;
-	struct platform_device		*pdev;
-	raw_spinlock_t			lock;
-	void __iomem			*reg_base;
-	struct pinctrl_gpio_range	*range;
-	struct byt_gpio_pin_context	*saved_context;
-	const struct byt_pinctrl_soc_data *soc_data;
-	struct byt_community		*communities_copy;
-};
-
 static const struct byt_pinctrl_soc_data *byt_soc_data[] = {
 	&byt_score_soc_data,
 	&byt_sus_soc_data,
@@ -1023,14 +975,6 @@ static int byt_gpio_request_enable(struct pinctrl_dev *pctl_dev,
 	return 0;
 }
 
-static void byt_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	struct byt_gpio *vg = gpiochip_get_data(chip);
-
-	byt_gpio_clear_triggering(vg, offset);
-	pm_runtime_put(&vg->pdev->dev);
-}
-
 static void byt_gpio_disable_free(struct pinctrl_dev *pctl_dev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned int offset)
@@ -1084,42 +1028,6 @@ static const struct pinmux_ops byt_pinmux_ops = {
 	.gpio_set_direction	= byt_gpio_set_direction,
 };
 
-static int byt_gpio_request(struct gpio_chip *chip, unsigned int offset)
-{
-	struct byt_gpio *vg = gpiochip_get_data(chip);
-	void __iomem *reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
-	u32 value, gpio_mux;
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&vg->lock, flags);
-
-	/*
-	 * In most cases, func pin mux 000 means GPIO function.
-	 * But, some pins may have func pin mux 001 represents
-	 * GPIO function.
-	 *
-	 * Because there are devices out there where some pins were not
-	 * configured correctly we allow changing the mux value from
-	 * request (but print out warning about that).
-	 */
-	value = readl(reg) & BYT_PIN_MUX;
-	gpio_mux = byt_get_gpio_mux(vg, offset);
-	if (WARN_ON(gpio_mux != value)) {
-		value = readl(reg) & ~BYT_PIN_MUX;
-		value |= gpio_mux;
-		writel(value, reg);
-
-		dev_warn(&vg->pdev->dev,
-			 "pin %u forcibly re-configured as GPIO\n", offset);
-	}
-
-	raw_spin_unlock_irqrestore(&vg->lock, flags);
-
-	pm_runtime_get(&vg->pdev->dev);
-
-	return 0;
-}
-
 static void byt_get_pull_strength(u32 reg, u16 *strength)
 {
 	switch (reg & BYT_PULL_STR_MASK) {
@@ -1365,21 +1273,6 @@ static int byt_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 static int byt_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	struct byt_gpio *vg = gpiochip_get_data(chip);
-	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&vg->lock, flags);
-
-	/*
-	 * Before making any direction modifications, do a check if gpio
-	 * is set for direct IRQ.  On baytrail, setting GPIO to output does
-	 * not make sense, so let's at least warn the caller before they shoot
-	 * themselves in the foot.
-	 */
-	WARN(readl(conf_reg) & BYT_DIRECT_IRQ_EN,
-		"Potential Error: Setting GPIO with direct_irq_en to output");
-
 	return pinctrl_gpio_direction_input(chip->base + offset);
 }
 
@@ -1489,28 +1382,6 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	}
 }
 
-static void byt_gpio_irq_handler(struct irq_desc *desc)
-{
-	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct byt_gpio *vg = gpiochip_get_data(irq_desc_get_handler_data(desc));
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
-	u32 base, pin;
-	void __iomem *reg;
-	unsigned long pending;
-	unsigned virq;
-
-	/* check from GPIO controller which pin triggered the interrupt */
-	for (base = 0; base < vg->chip.ngpio; base += 32) {
-		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
-		pending = readl(reg);
-		for_each_set_bit(pin, &pending, 32) {
-			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
-			generic_handle_irq(virq);
-		}
-	}
-	chip->irq_eoi(data);
-}
-
 static const struct gpio_chip byt_gpio_chip = {
 	.owner			= THIS_MODULE,
 	.request		= gpiochip_generic_request,
@@ -1628,6 +1499,37 @@ static struct irq_chip byt_irqchip = {
 	.flags		= IRQCHIP_SKIP_SET_WAKE,
 };
 
+static void byt_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_data *data = irq_desc_get_irq_data(desc);
+	struct byt_gpio *vg = gpiochip_get_data(
+				irq_desc_get_handler_data(desc));
+	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	u32 base, pin;
+	void __iomem *reg;
+	unsigned long pending;
+	unsigned int virq;
+
+	/* check from GPIO controller which pin triggered the interrupt */
+	for (base = 0; base < vg->chip.ngpio; base += 32) {
+		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
+
+		if (!reg) {
+			dev_warn(&vg->pdev->dev,
+				 "Pin %i: could not retrieve interrupt status register\n",
+				 base);
+			continue;
+		}
+
+		pending = readl(reg);
+		for_each_set_bit(pin, &pending, 32) {
+			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
+			generic_handle_irq(virq);
+		}
+	}
+	chip->irq_eoi(data);
+}
+
 static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 {
 	void __iomem *reg;
@@ -1639,8 +1541,18 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 	 * do not use direct IRQ mode. This will prevent spurious
 	 * interrupts from misconfigured pins.
 	 */
-	for (i = 0; i < vg->chip.ngpio; i++) {
-		value = readl(byt_gpio_reg(vg, i, BYT_CONF0_REG));
+	for (i = 0; i < vg->soc_data->npins; i++) {
+		unsigned int pin = vg->soc_data->pins[i].number;
+
+		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
+		if (!reg) {
+			dev_warn(&vg->pdev->dev,
+				 "Pin %i: could not retrieve conf0 register\n",
+				 i);
+			continue;
+		}
+
+		value = readl(reg);
 		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i) &&
 		    !(value & BYT_DIRECT_IRQ_EN)) {
 			byt_gpio_clear_triggering(vg, i);
@@ -1649,8 +1561,16 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 	}
 
 	/* clear interrupt status trigger registers */
-	for (base = 0; base < vg->chip.ngpio; base += 32) {
+	for (base = 0; base < vg->soc_data->npins; base += 32) {
 		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
+
+		if (!reg) {
+			dev_warn(&vg->pdev->dev,
+				 "Pin %i: could not retrieve irq status reg\n",
+				 base);
+			continue;
+		}
+
 		writel(0xffffffff, reg);
 		/* make sure trigger bits are cleared, if not then a pin
 		   might be misconfigured in bios */
@@ -1661,82 +1581,47 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 	}
 }
 
-static int byt_gpio_probe(struct platform_device *pdev)
+static int byt_gpio_probe(struct byt_gpio *vg)
 {
-	struct byt_gpio *vg;
 	struct gpio_chip *gc;
-	struct resource *mem_rc, *irq_rc;
-	struct device *dev = &pdev->dev;
-	struct acpi_device *acpi_dev;
-	struct pinctrl_gpio_range *range;
-	acpi_handle handle = ACPI_HANDLE(dev);
+	struct resource *irq_rc;
 	int ret;
 
-	if (acpi_bus_get_device(handle, &acpi_dev))
-		return -ENODEV;
-
-	vg = devm_kzalloc(dev, sizeof(struct byt_gpio), GFP_KERNEL);
-	if (!vg) {
-		dev_err(&pdev->dev, "can't allocate byt_gpio chip data\n");
-		return -ENOMEM;
-	}
-
-	for (range = byt_ranges; range->name; range++) {
-		if (!strcmp(acpi_dev->pnp.unique_id, range->name)) {
-			vg->chip.ngpio = range->npins;
-			vg->range = range;
-			break;
-		}
-	}
-
-	if (!vg->chip.ngpio || !vg->range)
-		return -ENODEV;
-
-	vg->pdev = pdev;
-	platform_set_drvdata(pdev, vg);
-
-	mem_rc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	vg->reg_base = devm_ioremap_resource(dev, mem_rc);
-	if (IS_ERR(vg->reg_base))
-		return PTR_ERR(vg->reg_base);
-
-	raw_spin_lock_init(&vg->lock);
-
-	gc = &vg->chip;
-	gc->label = dev_name(&pdev->dev);
-	gc->owner = THIS_MODULE;
-	gc->request = byt_gpio_request;
-	gc->free = byt_gpio_free;
-	gc->direction_input = byt_gpio_direction_input;
-	gc->direction_output = byt_gpio_direction_output;
-	gc->get = byt_gpio_get;
-	gc->set = byt_gpio_set;
-	gc->dbg_show = byt_gpio_dbg_show;
-	gc->base = -1;
-	gc->can_sleep = false;
-	gc->parent = dev;
+	/* Set up gpio chip */
+	vg->chip	= byt_gpio_chip;
+	gc		= &vg->chip;
+	gc->label	= dev_name(&vg->pdev->dev);
+	gc->base	= -1;
+	gc->can_sleep	= false;
+	gc->parent	= &vg->pdev->dev;
+	gc->ngpio	= vg->soc_data->npins;
 
 #ifdef CONFIG_PM_SLEEP
-	vg->saved_context = devm_kcalloc(&pdev->dev, gc->ngpio,
+	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
 				       sizeof(*vg->saved_context), GFP_KERNEL);
 #endif
-
 	ret = gpiochip_add_data(gc, vg);
 	if (ret) {
-		dev_err(&pdev->dev, "failed adding byt-gpio chip\n");
+		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
 		return ret;
 	}
 
+	ret = gpiochip_add_pin_range(&vg->chip, dev_name(&vg->pdev->dev),
+				     0, 0, vg->soc_data->npins);
+	if (ret) {
+		dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
+		goto fail;
+	}
+
 	/* set up interrupts  */
-	irq_rc = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
 	if (irq_rc && irq_rc->start) {
 		byt_gpio_irq_init_hw(vg);
 		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
 					   handle_simple_irq, IRQ_TYPE_NONE);
 		if (ret) {
-			dev_err(dev, "failed to add irqchip\n");
-			gpiochip_remove(gc);
-			return ret;
+			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
+			goto fail;
 		}
 
 		gpiochip_set_chained_irqchip(gc, &byt_irqchip,
@@ -1744,7 +1629,120 @@ static int byt_gpio_probe(struct platform_device *pdev)
 					     byt_gpio_irq_handler);
 	}
 
-	pm_runtime_enable(dev);
+	return ret;
+
+fail:
+	gpiochip_remove(&vg->chip);
+
+	return ret;
+}
+
+static int byt_set_soc_data(struct byt_gpio *vg,
+			    const struct byt_pinctrl_soc_data *soc_data)
+{
+	int i;
+
+	vg->soc_data = soc_data;
+	vg->communities_copy = devm_kcalloc(&vg->pdev->dev,
+					    soc_data->ncommunities,
+					    sizeof(*vg->communities_copy),
+					    GFP_KERNEL);
+	if (!vg->communities_copy)
+		return -ENOMEM;
+
+	for (i = 0; i < soc_data->ncommunities; i++) {
+		struct byt_community *comm = vg->communities_copy + i;
+		struct resource *mem_rc;
+
+		*comm = vg->soc_data->communities[i];
+
+		mem_rc = platform_get_resource(vg->pdev, IORESOURCE_MEM, 0);
+		comm->reg_base = devm_ioremap_resource(&vg->pdev->dev, mem_rc);
+		if (IS_ERR(comm->reg_base))
+			return PTR_ERR(comm->reg_base);
+	}
+
+	return 0;
+}
+
+static const struct acpi_device_id byt_gpio_acpi_match[] = {
+	{ "INT33B2", (kernel_ulong_t)byt_soc_data },
+	{ "INT33FC", (kernel_ulong_t)byt_soc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, byt_gpio_acpi_match);
+
+static int byt_pinctrl_probe(struct platform_device *pdev)
+{
+	const struct byt_pinctrl_soc_data *soc_data = NULL;
+	const struct byt_pinctrl_soc_data **soc_table;
+	const struct acpi_device_id *acpi_id;
+	struct acpi_device *acpi_dev;
+	struct byt_gpio *vg;
+	int i, ret;
+
+	acpi_dev = ACPI_COMPANION(&pdev->dev);
+	if (!acpi_dev)
+		return -ENODEV;
+
+	acpi_id = acpi_match_device(byt_gpio_acpi_match, &pdev->dev);
+	if (!acpi_id)
+		return -ENODEV;
+
+	soc_table = (const struct byt_pinctrl_soc_data **)acpi_id->driver_data;
+
+	for (i = 0; soc_table[i]; i++) {
+		if (!strcmp(acpi_dev->pnp.unique_id, soc_table[i]->uid)) {
+			soc_data = soc_table[i];
+			break;
+		}
+	}
+
+	if (!soc_data)
+		return -ENODEV;
+
+	vg = devm_kzalloc(&pdev->dev, sizeof(*vg), GFP_KERNEL);
+	if (!vg)
+		return -ENOMEM;
+
+	vg->pdev = pdev;
+	ret = byt_set_soc_data(vg, soc_data);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to set soc data\n");
+		return ret;
+	}
+
+	vg->pctl_desc		= byt_pinctrl_desc;
+	vg->pctl_desc.name	= dev_name(&pdev->dev);
+	vg->pctl_desc.pins	= vg->soc_data->pins;
+	vg->pctl_desc.npins	= vg->soc_data->npins;
+
+	vg->pctl_dev = pinctrl_register(&vg->pctl_desc, &pdev->dev, vg);
+	if (IS_ERR(vg->pctl_dev)) {
+		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
+		return PTR_ERR(vg->pctl_dev);
+	}
+
+	ret = byt_gpio_probe(vg);
+	if (ret) {
+		pinctrl_unregister(vg->pctl_dev);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, vg);
+	raw_spin_lock_init(&vg->lock);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int byt_pinctrl_remove(struct platform_device *pdev)
+{
+	struct byt_gpio *vg = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	gpiochip_remove(&vg->chip);
+	pinctrl_unregister(vg->pctl_dev);
 
 	return 0;
 }
@@ -1756,15 +1754,22 @@ static int byt_gpio_suspend(struct device *dev)
 	struct byt_gpio *vg = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < vg->chip.ngpio; i++) {
+	for (i = 0; i < vg->soc_data->npins; i++) {
 		void __iomem *reg;
 		u32 value;
+		unsigned int pin = vg->soc_data->pins[i].number;
 
-		reg = byt_gpio_reg(vg, i, BYT_CONF0_REG);
+		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
+		if (!reg) {
+			dev_warn(&vg->pdev->dev,
+				 "Pin %i: could not retrieve conf0 register\n",
+				 i);
+			continue;
+		}
 		value = readl(reg) & BYT_CONF0_RESTORE_MASK;
 		vg->saved_context[i].conf0 = value;
 
-		reg = byt_gpio_reg(vg, i, BYT_VAL_REG);
+		reg = byt_gpio_reg(vg, pin, BYT_VAL_REG);
 		value = readl(reg) & BYT_VAL_RESTORE_MASK;
 		vg->saved_context[i].val = value;
 	}
@@ -1778,11 +1783,18 @@ static int byt_gpio_resume(struct device *dev)
 	struct byt_gpio *vg = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < vg->chip.ngpio; i++) {
+	for (i = 0; i < vg->soc_data->npins; i++) {
 		void __iomem *reg;
 		u32 value;
+		unsigned int pin = vg->soc_data->pins[i].number;
 
-		reg = byt_gpio_reg(vg, i, BYT_CONF0_REG);
+		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
+		if (!reg) {
+			dev_warn(&vg->pdev->dev,
+				 "Pin %i: could not retrieve conf0 register\n",
+				 i);
+			continue;
+		}
 		value = readl(reg);
 		if ((value & BYT_CONF0_RESTORE_MASK) !=
 		     vg->saved_context[i].conf0) {
@@ -1792,7 +1804,7 @@ static int byt_gpio_resume(struct device *dev)
 			dev_info(dev, "restored pin %d conf0 %#08x", i, value);
 		}
 
-		reg = byt_gpio_reg(vg, i, BYT_VAL_REG);
+		reg = byt_gpio_reg(vg, pin, BYT_VAL_REG);
 		value = readl(reg);
 		if ((value & BYT_VAL_RESTORE_MASK) !=
 		     vg->saved_context[i].val) {
@@ -1830,26 +1842,9 @@ static const struct dev_pm_ops byt_gpio_pm_ops = {
 			   NULL)
 };
 
-static const struct acpi_device_id byt_gpio_acpi_match[] = {
-	{ "INT33B2", (kernel_ulong_t)byt_soc_data },
-	{ "INT33FC", (kernel_ulong_t)byt_soc_data },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, byt_gpio_acpi_match);
-
-static int byt_gpio_remove(struct platform_device *pdev)
-{
-	struct byt_gpio *vg = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-	gpiochip_remove(&vg->chip);
-
-	return 0;
-}
-
 static struct platform_driver byt_gpio_driver = {
-	.probe          = byt_gpio_probe,
-	.remove         = byt_gpio_remove,
+	.probe          = byt_pinctrl_probe,
+	.remove         = byt_pinctrl_remove,
 	.driver         = {
 		.name   = "byt_gpio",
 		.pm	= &byt_gpio_pm_ops,
-- 
1.9.1
