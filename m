From: Chao Xie <chao.xie@marvell.com>
Subject: [PATCH V2] gpio: mmp: add GPIO driver for Marvell MMP series
Date: Fri, 6 Mar 2015 10:04:43 +0800
Message-ID: <1425607483-8614-1-git-send-email-chao.xie@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, chao.xie@marvell.com, xiechao_mail@163.com, haojian.zhuang@gmail.com
List-Id: linux-gpio@vger.kernel.org

From: Chao Xie <chao.xie@marvell.com>

For some old PXA series, they used PXA GPIO driver.
The IP of GPIO changes since PXA988 which is Marvell MMP
series.
It will use new way to control the GPIO level, direction
and edge status.

Signed-off-by: Chao Xie <chao.xie@marvell.com>
---
 drivers/gpio/Kconfig    |  10 ++
 drivers/gpio/Makefile   |   1 +
 drivers/gpio/gpio-mmp.c | 364 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 375 insertions(+)
 create mode 100644 drivers/gpio/gpio-mmp.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 633ec21..6dce470 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -197,6 +197,16 @@ config GPIO_F7188X
 	  To compile this driver as a module, choose M here: the module will
 	  be called f7188x-gpio.
 
+config GPIO_MMP
+	bool "MMP GPIO support"
+	depends on ARCH_MMP
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the MMP GPIO device at
+	  PXA1088/PXA1908/PXA1928. Comparing with PXA GPIO device, the IP of
+	  MMP GPIO changes a lot. It will use new way to control the GPIO
+	  level, direction and edge status.
+
 config GPIO_MOXART
 	bool "MOXART GPIO support"
 	depends on ARCH_MOXART
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 81755f1..60a7cf5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
 obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
+obj-$(CONFIG_GPIO_MMP)		+= gpio-mmp.o
 obj-$(CONFIG_GPIO_MOXART)	+= gpio-moxart.o
 obj-$(CONFIG_GPIO_MPC5200)	+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)	+= gpio-mpc8xxx.o
diff --git a/drivers/gpio/gpio-mmp.c b/drivers/gpio/gpio-mmp.c
new file mode 100644
index 0000000..4202654
--- /dev/null
+++ b/drivers/gpio/gpio-mmp.c
@@ -0,0 +1,364 @@
+/*
+ *  Copyright (C) 2015 Marvell International Ltd.
+ *
+ *  Generic MMP GPIO handling
+ *
+ *	Chao Xie <chao.xie@marvell.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/gpio/driver.h>
+#include <linux/clk.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#define GPLR		0x0
+#define GPDR		0xc
+#define GPSR		0x18
+#define GPCR		0x24
+#define GRER		0x30
+#define GFER		0x3c
+#define GEDR		0x48
+#define GSDR		0x54
+#define GCDR		0x60
+#define GSRER		0x6c
+#define GCRER		0x78
+#define GSFER		0x84
+#define GCFER		0x90
+#define GAPMASK		0x9c
+#define GCPMASK		0xa8
+
+/* Bank will have 2^n GPIOes, and for mmp-gpio n = 5 */
+#define BANK_GPIO_ORDER		5
+#define BANK_GPIO_NUMBER	(1 << BANK_GPIO_ORDER)
+#define BANK_GPIO_MASK		(BANK_GPIO_NUMBER - 1)
+
+#define mmp_gpio_to_bank_idx(gpio)	((gpio) >> BANK_GPIO_ORDER)
+#define mmp_gpio_to_bank_offset(gpio)	((gpio) & BANK_GPIO_MASK)
+#define mmp_bank_to_gpio(idx, offset)	(((idx) << BANK_GPIO_ORDER)	\
+						| ((offset) & BANK_GPIO_MASK))
+
+struct mmp_gpio_bank {
+	void __iomem *reg_bank;
+	u32 irq_mask;
+	u32 irq_rising_edge;
+	u32 irq_falling_edge;
+};
+
+struct mmp_gpio_chip {
+	struct gpio_chip chip;
+	void __iomem *reg_base;
+	int irq;
+	unsigned int ngpio;
+	unsigned int nbank;
+	struct mmp_gpio_bank *banks;
+};
+
+static int mmp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct mmp_gpio_chip *mmp_chip =
+			container_of(chip, struct mmp_gpio_chip, chip);
+	struct mmp_gpio_bank *bank =
+			&mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
+	u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
+
+	writel(bit, bank->reg_bank + GCDR);
+
+	return 0;
+}
+
+static int mmp_gpio_direction_output(struct gpio_chip *chip,
+				     unsigned offset, int value)
+{
+	struct mmp_gpio_chip *mmp_chip =
+			container_of(chip, struct mmp_gpio_chip, chip);
+	struct mmp_gpio_bank *bank =
+			&mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
+	u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
+
+	/* Set value first. */
+	writel(bit, bank->reg_bank + (value ? GPSR : GPCR));
+
+	writel(bit, bank->reg_bank + GSDR);
+
+	return 0;
+}
+
+static int mmp_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct mmp_gpio_chip *mmp_chip =
+			container_of(chip, struct mmp_gpio_chip, chip);
+	struct mmp_gpio_bank *bank =
+			&mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
+	u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
+	u32 gplr;
+
+	gplr  = readl(bank->reg_bank + GPLR);
+
+	return !!(gplr & bit);
+}
+
+static void mmp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct mmp_gpio_chip *mmp_chip =
+			container_of(chip, struct mmp_gpio_chip, chip);
+	struct mmp_gpio_bank *bank =
+			&mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
+	u32 bit = (1 << mmp_gpio_to_bank_offset(offset));
+	u32 gpdr;
+
+	gpdr = readl(bank->reg_bank + GPDR);
+	/* Is it configured as output? */
+	if (gpdr & bit)
+		writel(bit, bank->reg_bank + (value ? GPSR : GPCR));
+}
+
+static int mmp_gpio_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct mmp_gpio_chip *mmp_chip = irq_data_get_irq_chip_data(d);
+	int gpio = irqd_to_hwirq(d);
+	struct mmp_gpio_bank *bank =
+			&mmp_chip->banks[mmp_gpio_to_bank_idx(gpio)];
+	u32 bit = (1 << mmp_gpio_to_bank_offset(gpio));
+
+	if (type & IRQ_TYPE_EDGE_RISING) {
+		bank->irq_rising_edge |= bit;
+		writel(bit, bank->reg_bank + GSRER);
+	} else {
+		bank->irq_rising_edge &= ~bit;
+		writel(bit, bank->reg_bank + GCRER);
+	}
+
+	if (type & IRQ_TYPE_EDGE_FALLING) {
+		bank->irq_falling_edge |= bit;
+		writel(bit, bank->reg_bank + GSFER);
+	} else {
+		bank->irq_falling_edge &= ~bit;
+		writel(bit, bank->reg_bank + GCFER);
+	}
+
+	return 0;
+}
+
+static void mmp_gpio_demux_handler(unsigned int irq, struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct mmp_gpio_chip *mmp_chip = irq_get_handler_data(irq);
+	struct mmp_gpio_bank *bank;
+	int i, n;
+	u32 gedr;
+	unsigned long pending = 0;
+
+	chained_irq_enter(chip, desc);
+
+	for (i = 0; i < mmp_chip->nbank; i++) {
+		bank = &mmp_chip->banks[i];
+
+		gedr = readl(bank->reg_bank + GEDR);
+		writel(gedr, bank->reg_bank + GEDR);
+		gedr = gedr & bank->irq_mask;
+
+		if (!gedr)
+			continue;
+		pending = gedr;
+		for_each_set_bit(n, &pending, BANK_GPIO_NUMBER)
+			generic_handle_irq(irq_find_mapping(
+						mmp_chip->chip.irqdomain,
+						mmp_bank_to_gpio(i, n)));
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void mmp_mask_muxed_gpio(struct irq_data *d)
+{
+	struct mmp_gpio_chip *mmp_chip = irq_data_get_irq_chip_data(d);
+	int gpio = irqd_to_hwirq(d);
+	struct mmp_gpio_bank *bank =
+			&mmp_chip->banks[mmp_gpio_to_bank_idx(gpio)];
+	u32 bit = (1 << mmp_gpio_to_bank_offset(gpio));
+
+	bank->irq_mask &= ~bit;
+
+	/* Clear the bit of rising and falling edge detection. */
+	writel(bit, bank->reg_bank + GCRER);
+	writel(bit, bank->reg_bank + GCFER);
+}
+
+static void mmp_unmask_muxed_gpio(struct irq_data *d)
+{
+	struct mmp_gpio_chip *mmp_chip = irq_data_get_irq_chip_data(d);
+	int gpio = irqd_to_hwirq(d);
+	struct mmp_gpio_bank *bank =
+			&mmp_chip->banks[mmp_gpio_to_bank_idx(gpio)];
+	u32 bit = (1 << mmp_gpio_to_bank_offset(gpio));
+
+	bank->irq_mask |= bit;
+
+	/* Set the bit of rising and falling edge detection if the gpio has. */
+	writel(bit & bank->irq_rising_edge, bank->reg_bank + GSRER);
+	writel(bit & bank->irq_falling_edge, bank->reg_bank + GSFER);
+}
+
+static struct irq_chip mmp_muxed_gpio_chip = {
+	.name		= "mmp-gpio-irqchip",
+	.irq_mask	= mmp_mask_muxed_gpio,
+	.irq_unmask	= mmp_unmask_muxed_gpio,
+	.irq_set_type	= mmp_gpio_irq_type,
+	.flags		= IRQCHIP_SKIP_SET_WAKE,
+};
+
+static struct of_device_id mmp_gpio_dt_ids[] = {
+	{ .compatible = "marvell,mmp-gpio"},
+	{}
+};
+
+static int mmp_gpio_probe_dt(struct platform_device *pdev,
+				struct mmp_gpio_chip *mmp_chip)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child;
+	u32 offset;
+	int i, nbank, ret;
+
+	if (!np)
+		return -EINVAL;
+
+	nbank = of_get_child_count(np);
+	if (nbank == 0)
+		return -EINVAL;
+
+	mmp_chip->banks = devm_kzalloc(&pdev->dev,
+				sizeof(*mmp_chip->banks) * nbank,
+				GFP_KERNEL);
+	if (!mmp_chip->banks)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_child_of_node(np, child) {
+		ret = of_property_read_u32(child, "reg-offset", &offset);
+		if (ret)
+			return ret;
+		mmp_chip->banks[i].reg_bank = mmp_chip->reg_base + offset;
+		i++;
+	}
+
+	mmp_chip->nbank = nbank;
+	mmp_chip->ngpio = mmp_chip->nbank * BANK_GPIO_NUMBER;
+
+	return 0;
+}
+
+static int mmp_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mmp_gpio_platform_data *pdata;
+	struct device_node *np;
+	struct mmp_gpio_chip *mmp_chip;
+	struct mmp_gpio_bank *bank;
+	struct resource *res;
+	struct clk *clk;
+	int irq, i, ret;
+	void __iomem *base;
+
+	pdata = dev_get_platdata(dev);
+	np = pdev->dev.of_node;
+	if (!np && !pdata)
+		return -EINVAL;
+
+	mmp_chip = devm_kzalloc(dev, sizeof(*mmp_chip), GFP_KERNEL);
+	if (!mmp_chip)
+		return -ENOMEM;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+	base = devm_ioremap_resource(dev, res);
+	if (!base)
+		return -EINVAL;
+
+	mmp_chip->irq = irq;
+	mmp_chip->reg_base = base;
+
+	ret = mmp_gpio_probe_dt(pdev, mmp_chip);
+	if (ret) {
+		dev_err(dev, "Fail to initialize gpio unit, error %d.\n", ret);
+		return ret;
+	}
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Fail to get gpio clock, error %ld.\n",
+			PTR_ERR(clk));
+		return PTR_ERR(clk);
+	}
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(dev, "Fail to enable gpio clock, error %d.\n", ret);
+		return ret;
+	}
+
+	/* Initialize the gpio chip */
+	mmp_chip->chip.label = dev_name(dev);
+	mmp_chip->chip.ngpio = mmp_chip->ngpio;
+	mmp_chip->chip.dev = dev;
+	mmp_chip->chip.base = 0;
+
+	mmp_chip->chip.direction_input  = mmp_gpio_direction_input;
+	mmp_chip->chip.direction_output = mmp_gpio_direction_output;
+	mmp_chip->chip.get = mmp_gpio_get;
+	mmp_chip->chip.set = mmp_gpio_set;
+
+	gpiochip_add(&mmp_chip->chip);
+
+	/* clear all GPIO edge detects */
+	for (i = 0; i < mmp_chip->nbank; i++) {
+		bank = &mmp_chip->banks[i];
+		writel(0xffffffff, bank->reg_bank + GCFER);
+		writel(0xffffffff, bank->reg_bank + GCRER);
+		/* Unmask edge detection to AP. */
+		writel(0xffffffff, bank->reg_bank + GAPMASK);
+	}
+
+	ret = gpiochip_irqchip_add(&mmp_chip->chip, &mmp_muxed_gpio_chip, 0,
+				   handle_simple_irq, IRQ_TYPE_NONE);
+	if (ret) {
+		dev_err(dev, "failed to add irqchip\n");
+		clk_disable_unprepare(clk);
+		gpiochip_remove(&mmp_chip->chip);
+		return ret;
+	}
+
+	gpiochip_set_chained_irqchip(&mmp_chip->chip, &mmp_muxed_gpio_chip,
+				     mmp_chip->irq, mmp_gpio_demux_handler);
+
+	return 0;
+}
+
+static struct platform_driver mmp_gpio_driver = {
+	.probe		= mmp_gpio_probe,
+	.driver		= {
+		.name	= "mmp-gpio",
+		.of_match_table = mmp_gpio_dt_ids,
+	},
+};
+
+/*
+ * gpio driver register needs to be done before
+ * machine_init functions access gpio APIs.
+ * Hence register the driver in postcore initcall.
+ */
+static int __init mmp_gpio_init(void)
+{
+	return platform_driver_register(&mmp_gpio_driver);
+}
+postcore_initcall(mmp_gpio_init);
-- 
1.8.3.2
