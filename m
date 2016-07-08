From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: merrifield: Introduce GPIO driver to
 support Merrifield
Date: Fri, 8 Jul 2016 13:11:57 +0300
Message-ID: <20160708101157.GF23527@lahna.fi.intel.com>
References: <1467927959-90737-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:3494 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754177AbcGHKMD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Jul 2016 06:12:03 -0400
Content-Disposition: inline
In-Reply-To: <1467927959-90737-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@linux.intel.com>

On Fri, Jul 08, 2016 at 12:45:59AM +0300, Andy Shevchenko wrote:
> Intel Merrifield platform has a special GPIO controller to drive pads when they
> are muxed in corresponding mode.
> 
> Intel Merrifield GPIO IP is slightly different here and there in comparison to
> the older Intel MID platforms. These differences include in particular the
> shaked register offsets, specific support of level triggered interrupts and
> wake capable sources, as well as a pinctrl which is a separate IP.
> 
> Instead of uglifying existing driver I decide to provide a new one slightly
> based on gpio-intel-mid.c. So, anyone can easily compare what changes are
> happened to be here.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks pretty good to me.

I have a couple of comments see below.

> ---
>  drivers/gpio/Kconfig           |   7 +
>  drivers/gpio/Makefile          |   1 +
>  drivers/gpio/gpio-merrifield.c | 450 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 458 insertions(+)
>  create mode 100644 drivers/gpio/gpio-merrifield.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3054f5f..98dd47a 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1044,6 +1044,13 @@ config GPIO_INTEL_MID
>  	help
>  	  Say Y here to support Intel MID GPIO.
>  
> +config GPIO_MERRIFIELD
> +	tristate "Intel Merrifield GPIO support"
> +	depends on X86_INTEL_MID
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say Y here to support Intel Merrifield GPIO.
> +
>  config GPIO_ML_IOH
>  	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
>  	select GENERIC_IRQ_CHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 6e111fc..2a035ed 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_GPIO_MAX732X)	+= gpio-max732x.o
>  obj-$(CONFIG_GPIO_MAX77620)	+= gpio-max77620.o
>  obj-$(CONFIG_GPIO_MB86S7X)	+= gpio-mb86s7x.o
>  obj-$(CONFIG_GPIO_MENZ127)	+= gpio-menz127.o
> +obj-$(CONFIG_GPIO_MERRIFIELD)	+= gpio-merrifield.o
>  obj-$(CONFIG_GPIO_MC33880)	+= gpio-mc33880.o
>  obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
>  obj-$(CONFIG_GPIO_MCP23S08)	+= gpio-mcp23s08.o
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> new file mode 100644
> index 0000000..f399707
> --- /dev/null
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -0,0 +1,450 @@
> +/*
> + * Intel Merrifield SoC GPIO driver
> + *
> + * Copyright (c) 2016 Intel Corporation.
> + * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/slab.h>

slab.h really?

> +
> +#define GCCR		0x000	/* controller configuration */
> +#define GPLR		0x004	/* pin level r/o */
> +#define GPDR		0x01c	/* pin direction */
> +#define GPSR		0x034	/* pin set w/o */
> +#define GPCR		0x04c	/* pin clear w/o */
> +#define GRER		0x064	/* rising edge detect */
> +#define GFER		0x07c	/* falling edge detect */
> +#define GFBR		0x094	/* glitch filter */
> +#define GIMR		0x0ac	/* interrupt mask */
> +#define GISR		0x0c4	/* interrupt type */
> +#define GITR		0x300	/* input type */
> +#define GLPR		0x318	/* level input polarity */
> +#define GWMR		0x400	/* wake mask */
> +#define GWSR		0x418	/* wake source */
> +#define GSIR		0xc00	/* secure input */
> +
> +/* Intel Merrifield has 192 GPIO pins */
> +#define MRFLD_NGPIO	192
> +
> +struct mrfld_gpio_pinrange {
> +	unsigned gpio_base;
> +	unsigned pin_base;
> +	unsigned npins;

unsigned int

> +};
> +
> +#define GPIO_PINRANGE(gstart, gend, pstart)		\
> +	{						\
> +		.gpio_base = (gstart),			\
> +		.pin_base = (pstart),			\
> +		.npins = (gend) - (gstart) + 1,		\
> +	}
> +
> +struct mrfld_gpio {
> +	struct gpio_chip	chip;
> +	void __iomem		*reg_base;
> +	raw_spinlock_t		lock;
> +	struct device		*dev;
> +};
> +
> +static const struct mrfld_gpio_pinrange mrfld_gpio_ranges[] = {
> +	GPIO_PINRANGE(0, 11, 146),
> +	GPIO_PINRANGE(12, 13, 144),
> +	GPIO_PINRANGE(14, 15, 35),
> +	GPIO_PINRANGE(16, 16, 164),
> +	GPIO_PINRANGE(17, 18, 105),
> +	GPIO_PINRANGE(19, 22, 101),
> +	GPIO_PINRANGE(23, 30, 107),
> +	GPIO_PINRANGE(32, 43, 67),
> +	GPIO_PINRANGE(44, 63, 195),
> +	GPIO_PINRANGE(64, 67, 140),
> +	GPIO_PINRANGE(68, 69, 165),
> +	GPIO_PINRANGE(70, 71, 65),
> +	GPIO_PINRANGE(72, 76, 228),
> +	GPIO_PINRANGE(77, 86, 37),
> +	GPIO_PINRANGE(87, 87, 48),
> +	GPIO_PINRANGE(88, 88, 47),
> +	GPIO_PINRANGE(89, 96, 49),
> +	GPIO_PINRANGE(97, 97, 34),
> +	GPIO_PINRANGE(102, 119, 83),
> +	GPIO_PINRANGE(120, 123, 79),
> +	GPIO_PINRANGE(124, 135, 115),
> +	GPIO_PINRANGE(137, 142, 158),
> +	GPIO_PINRANGE(154, 163, 24),
> +	GPIO_PINRANGE(164, 176, 215),
> +	GPIO_PINRANGE(177, 189, 127),
> +	GPIO_PINRANGE(190, 191, 178),
> +};
> +
> +#define MRFLD_PINCTRL_DEV_NAME		"pinctrl-merrifield"

No, use the name directly instead of inventing silly macros like this.

> +
> +static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned int offset,
> +			      unsigned int reg_type_offset)
> +{
> +	struct mrfld_gpio *priv = gpiochip_get_data(chip);
> +	u8 reg = offset / 32;
> +
> +	return priv->reg_base + reg_type_offset + reg * 4;
> +}
> +
> +static int mrfld_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	void __iomem *gplr = gpio_reg(chip, offset, GPLR);
> +
> +	return !!(readl(gplr) & BIT(offset % 32));
> +}
> +
> +static void mrfld_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
> +{
> +	void __iomem *gpsr, *gpcr;
> +
> +	if (value) {
> +		gpsr = gpio_reg(chip, offset, GPSR);
> +		writel(BIT(offset % 32), gpsr);
> +	} else {
> +		gpcr = gpio_reg(chip, offset, GPCR);
> +		writel(BIT(offset % 32), gpcr);
> +	}
> +}
> +
> +static int mrfld_gpio_direction_input(struct gpio_chip *chip,
> +				      unsigned int offset)
> +{
> +	struct mrfld_gpio *priv = gpiochip_get_data(chip);
> +	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +	value = readl(gpdr);
> +	value &= ~BIT(offset % 32);
> +	writel(value, gpdr);
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mrfld_gpio_direction_output(struct gpio_chip *chip,
> +				       unsigned int offset, int value)
> +{
> +	struct mrfld_gpio *priv = gpiochip_get_data(chip);
> +	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
> +	unsigned long flags;
> +
> +	mrfld_gpio_set(chip, offset, value);
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +	value = readl(gpdr);
> +	value |= BIT(offset % 32);
> +	writel(value, gpdr);
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static void mrfld_irq_ack(struct irq_data *d)
> +{
> +	struct mrfld_gpio *priv = irq_data_get_irq_chip_data(d);
> +	u32 gpio = irqd_to_hwirq(d);
> +	void __iomem *gisr = gpio_reg(&priv->chip, gpio, GISR);
> +	unsigned long flags;
> +
> +	if (gpio >= priv->chip.ngpio)

Can this even happen? Ditto for other functions having similar check.

> +		return;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	writel(BIT(gpio % 32), gisr);

Do you really need to take the lock for single register write?

> +
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +}
> +
> +static void mrfld_irq_unmask_mask(struct irq_data *d, bool unmask)
> +{
> +	struct mrfld_gpio *priv = irq_data_get_irq_chip_data(d);
> +	u32 gpio = irqd_to_hwirq(d);
> +	void __iomem *gimr = gpio_reg(&priv->chip, gpio, GIMR);
> +	unsigned long flags;
> +	u32 value;
> +
> +	if (gpio >= priv->chip.ngpio)
> +		return;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	if (unmask)
> +		value = readl(gimr) | BIT(gpio % 32);
> +	else
> +		value = readl(gimr) & ~BIT(gpio % 32);
> +	writel(value, gimr);
> +
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +}
> +
> +static void mrfld_irq_mask(struct irq_data *d)
> +{
> +	mrfld_irq_unmask_mask(d, false);
> +}
> +
> +static void mrfld_irq_unmask(struct irq_data *d)
> +{
> +	mrfld_irq_unmask_mask(d, true);
> +}
> +
> +static int mrfld_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct mrfld_gpio *priv = gpiochip_get_data(gc);
> +	u32 gpio = irqd_to_hwirq(d);
> +	void __iomem *grer = gpio_reg(&priv->chip, gpio, GRER);
> +	void __iomem *gfer = gpio_reg(&priv->chip, gpio, GFER);
> +	void __iomem *gitr = gpio_reg(&priv->chip, gpio, GITR);
> +	void __iomem *glpr = gpio_reg(&priv->chip, gpio, GLPR);
> +	unsigned long flags;
> +	u32 value;
> +
> +	if (gpio >= priv->chip.ngpio)
> +		return -EINVAL;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	if (type & IRQ_TYPE_EDGE_RISING)
> +		value = readl(grer) | BIT(gpio % 32);
> +	else
> +		value = readl(grer) & ~BIT(gpio % 32);
> +	writel(value, grer);
> +
> +	if (type & IRQ_TYPE_EDGE_FALLING)
> +		value = readl(gfer) | BIT(gpio % 32);
> +	else
> +		value = readl(gfer) & ~BIT(gpio % 32);
> +	writel(value, gfer);
> +
> +	/*
> +	 * To prevent glitches from triggering an unintended level interrupt,
> +	 * configure GLPR register first and then configure GITR.
> +	 */
> +	if (type & IRQ_TYPE_LEVEL_LOW)
> +		value = readl(glpr) | BIT(gpio % 32);
> +	else
> +		value = readl(glpr) & ~BIT(gpio % 32);
> +	writel(value, glpr);
> +
> +	if (type & IRQ_TYPE_LEVEL_MASK) {
> +		value = readl(gitr) | BIT(gpio % 32);
> +		writel(value, gitr);
> +
> +		irq_set_handler_locked(d, handle_level_irq);
> +	} else if (type & IRQ_TYPE_EDGE_BOTH) {
> +		value = readl(gitr) & ~BIT(gpio % 32);
> +		writel(value, gitr);
> +
> +		irq_set_handler_locked(d, handle_edge_irq);
> +	}
> +
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mrfld_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct mrfld_gpio *priv = gpiochip_get_data(gc);
> +	u32 gpio = irqd_to_hwirq(d);
> +	void __iomem *gwmr = gpio_reg(&priv->chip, gpio, GWMR);
> +	void __iomem *gwsr = gpio_reg(&priv->chip, gpio, GWSR);
> +	u32 value;
> +
> +	if (gpio >= priv->chip.ngpio)
> +		return -EINVAL;
> +
> +	/* Clear the existing wake status */
> +	writel(BIT(gpio % 32), gwsr);
> +
> +	if (on)
> +		value = readl(gwmr) | BIT(gpio % 32);
> +	else
> +		value = readl(gwmr) & ~BIT(gpio % 32);
> +	writel(value, gwmr);
> +
> +	dev_dbg(priv->dev, "%sable wake for pin %u\n", on ? "en" : "dis", gpio);

pin -> gpio

> +	return 0;
> +}
> +
> +static struct irq_chip mrfld_irqchip = {
> +	.name		= "gpio-merrifield",
> +	.irq_ack	= mrfld_irq_ack,
> +	.irq_mask	= mrfld_irq_mask,
> +	.irq_unmask	= mrfld_irq_unmask,
> +	.irq_set_type	= mrfld_irq_set_type,
> +	.irq_set_wake	= mrfld_irq_set_wake,
> +};
> +
> +static const struct pci_device_id mrfld_gpio_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x1199) },

PCI_VDEVICE(INTEL, 0x1199),

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(pci, mrfld_gpio_ids);
> +
> +static void mrfld_irq_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +	struct mrfld_gpio *priv = gpiochip_get_data(gc);
> +	struct irq_data *data = irq_desc_get_irq_data(desc);
> +	struct irq_chip *chip = irq_data_get_irq_chip(data);
> +	unsigned long base, gpio;
> +
> +	/* Check GPIO controller to check which pin triggered the interrupt */
> +	for (base = 0; base < priv->chip.ngpio; base += 32) {
> +		void __iomem *gisr = gpio_reg(&priv->chip, base, GISR);
> +		void __iomem *gimr = gpio_reg(&priv->chip, base, GIMR);
> +		unsigned long pending, enabled;
> +
> +		pending = readl(gisr);
> +		enabled = readl(gimr);
> +
> +		/* Only interrupts that are enabled */
> +		pending &= enabled;
> +
> +		for_each_set_bit(gpio, &pending, 32) {
> +			unsigned int irq;
> +
> +			irq = irq_find_mapping(gc->irqdomain, base + gpio);
> +			generic_handle_irq(irq);
> +		}
> +	}
> +
> +	chip->irq_eoi(data);

For chained irqs you can use chained_irq_enter()/exit() instead.

> +}
> +
> +static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
> +{
> +	void __iomem *reg;
> +	unsigned base;

unsigned int

Ditto for other places.

> +
> +	for (base = 0; base < priv->chip.ngpio; base += 32) {
> +		/* Clear the rising-edge detect register */
> +		reg = gpio_reg(&priv->chip, base, GRER);
> +		writel(0, reg);
> +		/* Clear the falling-edge detect register */
> +		reg = gpio_reg(&priv->chip, base, GFER);
> +		writel(0, reg);
> +	}
> +}
> +
> +static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	const struct mrfld_gpio_pinrange *range;
> +	struct mrfld_gpio *priv;
> +	void __iomem *base;
> +	unsigned int i;
> +	u32 gpio_base;
> +	u32 irq_base;

u32 gpio_base, irq_base;

> +	int retval;
> +
> +	retval = pcim_enable_device(pdev);
> +	if (retval)
> +		return retval;
> +
> +	retval = pcim_iomap_regions(pdev, BIT(1) | BIT(0), pci_name(pdev));
> +	if (retval) {
> +		dev_err(&pdev->dev, "I/O memory mapping error\n");
> +		return retval;
> +	}
> +
> +	base = pcim_iomap_table(pdev)[1];
> +
> +	irq_base = readl(base);
> +	gpio_base = readl(sizeof(u32) + base);
> +
> +	/* Release the IO mapping, since we already get the info from BAR1 */
> +	pcim_iounmap_regions(pdev, BIT(1));
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		dev_err(&pdev->dev, "can't allocate chip data\n");
> +		return -ENOMEM;
> +	}
> +
> +	priv->dev = &pdev->dev;
> +	priv->reg_base = pcim_iomap_table(pdev)[0];
> +
> +	priv->chip.label = dev_name(&pdev->dev);
> +	priv->chip.parent = &pdev->dev;
> +	priv->chip.request = gpiochip_generic_request;
> +	priv->chip.free = gpiochip_generic_free;
> +	priv->chip.direction_input = mrfld_gpio_direction_input;
> +	priv->chip.direction_output = mrfld_gpio_direction_output;
> +	priv->chip.get = mrfld_gpio_get;
> +	priv->chip.set = mrfld_gpio_set;
> +	priv->chip.base = gpio_base;
> +	priv->chip.ngpio = MRFLD_NGPIO;
> +	priv->chip.can_sleep = false;
> +
> +	raw_spin_lock_init(&priv->lock);
> +
> +	pci_set_drvdata(pdev, priv);
> +	retval = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
> +	if (retval) {
> +		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
> +		return retval;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
> +		range = &mrfld_gpio_ranges[i];
> +		retval = gpiochip_add_pin_range(&priv->chip,
> +						MRFLD_PINCTRL_DEV_NAME,
> +						range->gpio_base,
> +						range->pin_base,
> +						range->npins);
> +		if (retval) {
> +			dev_err(&pdev->dev, "failed to add GPIO pin range\n");
> +			return retval;
> +		}
> +	}
> +
> +	retval = gpiochip_irqchip_add(&priv->chip,
> +				      &mrfld_irqchip,
> +				      irq_base,
> +				      handle_simple_irq,
> +				      IRQ_TYPE_NONE);
> +	if (retval) {
> +		dev_err(&pdev->dev,
> +			"could not connect irqchip to gpiochip\n");

Should fit into 80 cols.

> +		return retval;
> +	}
> +
> +	mrfld_irq_init_hw(priv);
> +
> +	gpiochip_set_chained_irqchip(&priv->chip,
> +				     &mrfld_irqchip,
> +				     pdev->irq,
> +				     mrfld_irq_handler);

Why not spell it like:

	gpiochip_set_chained_irqchip(&priv->chip, &mrfld_irqchip, pdev->irq,
				     mrfld_irq_handler);

Ditto for the gpiochip_add() above.

> +
> +	return 0;
> +}

Move mrfld_gpio_ids and MODULE_DEVICE_TABLE here.

> +
> +static struct pci_driver mrfld_gpio_driver = {

const?

> +	.name		= "gpio-merrifield",
> +	.id_table	= mrfld_gpio_ids,
> +	.probe		= mrfld_gpio_probe,
> +};
> +
> +module_pci_driver(mrfld_gpio_driver);
> +
> +MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
> +MODULE_DESCRIPTION("Intel Merrifield SoC GPIO driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.8.1
