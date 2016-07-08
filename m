From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to
 support Merrifield
Date: Fri, 08 Jul 2016 20:05:41 +0300
Message-ID: <1467997541.30123.523.camel@linux.intel.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <89AE17FDD09DD746ACFB52B7F3E0AF788895FA89@ORSMSX115.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:3391 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932568AbcGHRGM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Jul 2016 13:06:12 -0400
In-Reply-To: <89AE17FDD09DD746ACFB52B7F3E0AF788895FA89@ORSMSX115.amr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Wood, Brian J" <brian.j.wood@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>, "Koskinen, Ilkka" <ilkka.koskinen@intel.com>

On Fri, 2016-07-08 at 16:54 +0000, Wood, Brian J wrote:
> +Ilkka (he's investigating adding in pinctrl code for getting/setting
> the GPIO pins on BXT platform)=C2=A0

We already have a driver in upstream for Broxton.

>=20
> Ilkka, not being too familiar with pinctrl would there need to be mor=
e
> added to these functions mrfld_gpio_get()/mrfld_gpio_set() for the
> mux'ing needs we were discussing for Brillo?

No, you don't need anything else there. To control pins accordingly to
the hardware we have FLIS on a separate memory chunk which already has =
a
driver. i.e. drivers/pinctrl/intel/pinctrl-merrifield.c. By the way,
this GPIO driver will not work without that one, since it's using the
pinmux facility (see gpiochip_generic_request() and
gpiochip_generic_free() functions).

P.S. Just in case to remind you that this is a public discussion.

>=20
> Andy, the code looks good. +1 from me :-)
>=20
> Thanks,=C2=A0
>=20
> Brian Wood
> Software Design Engineer Intel Corporation
> Android Kernel Feature Team - OTC-SSG
>=20
> -----Original Message-----
> From: Andy Shevchenko [mailto:andriy.shevchenko@linux.intel.com]=C2=A0
> Sent: Friday, July 08, 2016 4:08 AM
> To: linux-gpio@vger.kernel.org; Linus Walleij <linus.walleij@linaro.o=
r
> g>; Mika Westerberg <mika.westerberg@linux.intel.com>; David Cohen <d=
a
> vid.a.cohen@linux.intel.com>; Wood, Brian J <brian.j.wood@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Subject: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to
> support Merrifield
>=20
> Intel Merrifield platform has a special GPIO controller to drive pads
> when they
> are muxed in corresponding mode.
>=20
> Intel Merrifield GPIO IP is slightly different here and there in
> comparison to
> the older Intel MID platforms. These differences include in particula=
r
> the
> shaked register offsets, specific support of level triggered
> interrupts and
> wake capable sources, as well as a pinctrl which is a separate IP.
>=20
> Instead of uglifying existing driver I decide to provide a new one
> slightly
> based on gpio-intel-mid.c. So, anyone can easily compare what changes
> are
> happened to be here.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> In v2:
> - address Mika's comments
> =C2=A0drivers/gpio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A07 +
> =C2=A0drivers/gpio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/gpio/gpio-merrifield.c | 433
> +++++++++++++++++++++++++++++++++++++++++
> =C2=A03 files changed, 441 insertions(+)
> =C2=A0create mode 100644 drivers/gpio/gpio-merrifield.c
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 275a364..fa28b7a 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1032,6 +1032,13 @@ config GPIO_INTEL_MID
> =C2=A0	help
> =C2=A0	=C2=A0=C2=A0Say Y here to support Intel MID GPIO.
> =C2=A0
> +config GPIO_MERRIFIELD
> +	tristate "Intel Merrifield GPIO support"
> +	depends on X86_INTEL_MID
> +	select GPIOLIB_IRQCHIP
> +	help
> +	=C2=A0=C2=A0Say Y here to support Intel Merrifield GPIO.
> +
> =C2=A0config GPIO_ML_IOH
> =C2=A0	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
> =C2=A0	select GENERIC_IRQ_CHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 991598e..d6ba958 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_GPIO_MAX7301)	+=3D gpio-max7301.o
> =C2=A0obj-$(CONFIG_GPIO_MAX732X)	+=3D gpio-max732x.o
> =C2=A0obj-$(CONFIG_GPIO_MB86S7X)	+=3D gpio-mb86s7x.o
> =C2=A0obj-$(CONFIG_GPIO_MENZ127)	+=3D gpio-menz127.o
> +obj-$(CONFIG_GPIO_MERRIFIELD)	+=3D gpio-merrifield.o
> =C2=A0obj-$(CONFIG_GPIO_MC33880)	+=3D gpio-mc33880.o
> =C2=A0obj-$(CONFIG_GPIO_MC9S08DZ60)	+=3D gpio-mc9s08dz60.o
> =C2=A0obj-$(CONFIG_GPIO_MCP23S08)	+=3D gpio-mcp23s08.o
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-
> merrifield.c
> new file mode 100644
> index 0000000..11066f6
> --- /dev/null
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -0,0 +1,433 @@
> +/*
> + * Intel Merrifield SoC GPIO driver
> + *
> + * Copyright (c) 2016 Intel Corporation.
> + * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify
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
> +
> +#define GCCR		0x000	/* controller configuration
> */
> +#define GPLR		0x004	/* pin level r/o */
> +#define GPDR		0x01c	/* pin direction */
> +#define GPSR		0x034	/* pin set w/o */
> +#define GPCR		0x04c	/* pin clear w/o */
> +#define GRER		0x064	/* rising edge detect */
> +#define GFER		0x07c	/* falling edge detect */
> +#define GFBR		0x094	/* glitch filter bypass */
> +#define GIMR		0x0ac	/* interrupt mask */
> +#define GISR		0x0c4	/* interrupt source */
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
> +	unsigned int gpio_base;
> +	unsigned int pin_base;
> +	unsigned int npins;
> +};
> +
> +#define GPIO_PINRANGE(gstart, gend, pstart)		\
> +	{						\
> +		.gpio_base =3D (gstart),			\
> +		.pin_base =3D (pstart),			\
> +		.npins =3D (gend) - (gstart) + 1,		\
> +	}
> +
> +struct mrfld_gpio {
> +	struct gpio_chip	chip;
> +	void __iomem		*reg_base;
> +	raw_spinlock_t		lock;
> +	struct device		*dev;
> +};
> +
> +static const struct mrfld_gpio_pinrange mrfld_gpio_ranges[] =3D {
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
> +static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned int
> offset,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int reg_type_offset)
> +{
> +	struct mrfld_gpio *priv =3D gpiochip_get_data(chip);
> +	u8 reg =3D offset / 32;
> +
> +	return priv->reg_base + reg_type_offset + reg * 4;
> +}
> +
> +static int mrfld_gpio_get(struct gpio_chip *chip, unsigned int
> offset)
> +{
> +	void __iomem *gplr =3D gpio_reg(chip, offset, GPLR);
> +
> +	return !!(readl(gplr) & BIT(offset % 32));
> +}
> +
> +static void mrfld_gpio_set(struct gpio_chip *chip, unsigned int
> offset,
> +			=C2=A0=C2=A0=C2=A0int value)
> +{
> +	void __iomem *gpsr, *gpcr;
> +
> +	if (value) {
> +		gpsr =3D gpio_reg(chip, offset, GPSR);
> +		writel(BIT(offset % 32), gpsr);
> +	} else {
> +		gpcr =3D gpio_reg(chip, offset, GPCR);
> +		writel(BIT(offset % 32), gpcr);
> +	}
> +}
> +
> +static int mrfld_gpio_direction_input(struct gpio_chip *chip,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int offset)
> +{
> +	struct mrfld_gpio *priv =3D gpiochip_get_data(chip);
> +	void __iomem *gpdr =3D gpio_reg(chip, offset, GPDR);
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	value =3D readl(gpdr);
> +	value &=3D ~BIT(offset % 32);
> +	writel(value, gpdr);
> +
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mrfld_gpio_direction_output(struct gpio_chip *chip,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int offset, i=
nt
> value)
> +{
> +	struct mrfld_gpio *priv =3D gpiochip_get_data(chip);
> +	void __iomem *gpdr =3D gpio_reg(chip, offset, GPDR);
> +	unsigned long flags;
> +
> +	mrfld_gpio_set(chip, offset, value);
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	value =3D readl(gpdr);
> +	value |=3D BIT(offset % 32);
> +	writel(value, gpdr);
> +
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static void mrfld_irq_ack(struct irq_data *d)
> +{
> +	struct mrfld_gpio *priv =3D irq_data_get_irq_chip_data(d);
> +	u32 gpio =3D irqd_to_hwirq(d);
> +	void __iomem *gisr =3D gpio_reg(&priv->chip, gpio, GISR);
> +
> +	writel(BIT(gpio % 32), gisr);
> +}
> +
> +static void mrfld_irq_unmask_mask(struct irq_data *d, bool unmask)
> +{
> +	struct mrfld_gpio *priv =3D irq_data_get_irq_chip_data(d);
> +	u32 gpio =3D irqd_to_hwirq(d);
> +	void __iomem *gimr =3D gpio_reg(&priv->chip, gpio, GIMR);
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	if (unmask)
> +		value =3D readl(gimr) | BIT(gpio % 32);
> +	else
> +		value =3D readl(gimr) & ~BIT(gpio % 32);
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
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct mrfld_gpio *priv =3D gpiochip_get_data(gc);
> +	u32 gpio =3D irqd_to_hwirq(d);
> +	void __iomem *grer =3D gpio_reg(&priv->chip, gpio, GRER);
> +	void __iomem *gfer =3D gpio_reg(&priv->chip, gpio, GFER);
> +	void __iomem *gitr =3D gpio_reg(&priv->chip, gpio, GITR);
> +	void __iomem *glpr =3D gpio_reg(&priv->chip, gpio, GLPR);
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	if (type & IRQ_TYPE_EDGE_RISING)
> +		value =3D readl(grer) | BIT(gpio % 32);
> +	else
> +		value =3D readl(grer) & ~BIT(gpio % 32);
> +	writel(value, grer);
> +
> +	if (type & IRQ_TYPE_EDGE_FALLING)
> +		value =3D readl(gfer) | BIT(gpio % 32);
> +	else
> +		value =3D readl(gfer) & ~BIT(gpio % 32);
> +	writel(value, gfer);
> +
> +	/*
> +	=C2=A0* To prevent glitches from triggering an unintended level
> interrupt,
> +	=C2=A0* configure GLPR register first and then configure GITR.
> +	=C2=A0*/
> +	if (type & IRQ_TYPE_LEVEL_LOW)
> +		value =3D readl(glpr) | BIT(gpio % 32);
> +	else
> +		value =3D readl(glpr) & ~BIT(gpio % 32);
> +	writel(value, glpr);
> +
> +	if (type & IRQ_TYPE_LEVEL_MASK) {
> +		value =3D readl(gitr) | BIT(gpio % 32);
> +		writel(value, gitr);
> +
> +		irq_set_handler_locked(d, handle_level_irq);
> +	} else if (type & IRQ_TYPE_EDGE_BOTH) {
> +		value =3D readl(gitr) & ~BIT(gpio % 32);
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
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct mrfld_gpio *priv =3D gpiochip_get_data(gc);
> +	u32 gpio =3D irqd_to_hwirq(d);
> +	void __iomem *gwmr =3D gpio_reg(&priv->chip, gpio, GWMR);
> +	void __iomem *gwsr =3D gpio_reg(&priv->chip, gpio, GWSR);
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&priv->lock, flags);
> +
> +	/* Clear the existing wake status */
> +	writel(BIT(gpio % 32), gwsr);
> +
> +	if (on)
> +		value =3D readl(gwmr) | BIT(gpio % 32);
> +	else
> +		value =3D readl(gwmr) & ~BIT(gpio % 32);
> +	writel(value, gwmr);
> +
> +	raw_spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	dev_dbg(priv->dev, "%sable wake for gpio %u\n", on ? "en" :
> "dis", gpio);
> +	return 0;
> +}
> +
> +static struct irq_chip mrfld_irqchip =3D {
> +	.name		=3D "gpio-merrifield",
> +	.irq_ack	=3D mrfld_irq_ack,
> +	.irq_mask	=3D mrfld_irq_mask,
> +	.irq_unmask	=3D mrfld_irq_unmask,
> +	.irq_set_type	=3D mrfld_irq_set_type,
> +	.irq_set_wake	=3D mrfld_irq_set_wake,
> +};
> +
> +static void mrfld_irq_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
> +	struct mrfld_gpio *priv =3D gpiochip_get_data(gc);
> +	struct irq_chip *irqchip =3D irq_desc_get_chip(desc);
> +	unsigned long base, gpio;
> +
> +	chained_irq_enter(irqchip, desc);
> +
> +	/* Check GPIO controller to check which pin triggered the
> interrupt */
> +	for (base =3D 0; base < priv->chip.ngpio; base +=3D 32) {
> +		void __iomem *gisr =3D gpio_reg(&priv->chip, base,
> GISR);
> +		void __iomem *gimr =3D gpio_reg(&priv->chip, base,
> GIMR);
> +		unsigned long pending, enabled;
> +
> +		pending =3D readl(gisr);
> +		enabled =3D readl(gimr);
> +
> +		/* Only interrupts that are enabled */
> +		pending &=3D enabled;
> +
> +		for_each_set_bit(gpio, &pending, 32) {
> +			unsigned int irq;
> +
> +			irq =3D irq_find_mapping(gc->irqdomain, base +
> gpio);
> +			generic_handle_irq(irq);
> +		}
> +	}
> +
> +	chained_irq_exit(irqchip, desc);
> +}
> +
> +static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
> +{
> +	void __iomem *reg;
> +	unsigned int base;
> +
> +	for (base =3D 0; base < priv->chip.ngpio; base +=3D 32) {
> +		/* Clear the rising-edge detect register */
> +		reg =3D gpio_reg(&priv->chip, base, GRER);
> +		writel(0, reg);
> +		/* Clear the falling-edge detect register */
> +		reg =3D gpio_reg(&priv->chip, base, GFER);
> +		writel(0, reg);
> +	}
> +}
> +
> +static int mrfld_gpio_probe(struct pci_dev *pdev, const struct
> pci_device_id *id)
> +{
> +	const struct mrfld_gpio_pinrange *range;
> +	struct mrfld_gpio *priv;
> +	u32 gpio_base, irq_base;
> +	void __iomem *base;
> +	unsigned int i;
> +	int retval;
> +
> +	retval =3D pcim_enable_device(pdev);
> +	if (retval)
> +		return retval;
> +
> +	retval =3D pcim_iomap_regions(pdev, BIT(1) | BIT(0),
> pci_name(pdev));
> +	if (retval) {
> +		dev_err(&pdev->dev, "I/O memory mapping error\n");
> +		return retval;
> +	}
> +
> +	base =3D pcim_iomap_table(pdev)[1];
> +
> +	irq_base =3D readl(base);
> +	gpio_base =3D readl(sizeof(u32) + base);
> +
> +	/* Release the IO mapping, since we already get the info from
> BAR1 */
> +	pcim_iounmap_regions(pdev, BIT(1));
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		dev_err(&pdev->dev, "can't allocate chip data\n");
> +		return -ENOMEM;
> +	}
> +
> +	priv->dev =3D &pdev->dev;
> +	priv->reg_base =3D pcim_iomap_table(pdev)[0];
> +
> +	priv->chip.label =3D dev_name(&pdev->dev);
> +	priv->chip.parent =3D &pdev->dev;
> +	priv->chip.request =3D gpiochip_generic_request;
> +	priv->chip.free =3D gpiochip_generic_free;
> +	priv->chip.direction_input =3D mrfld_gpio_direction_input;
> +	priv->chip.direction_output =3D mrfld_gpio_direction_output;
> +	priv->chip.get =3D mrfld_gpio_get;
> +	priv->chip.set =3D mrfld_gpio_set;
> +	priv->chip.base =3D gpio_base;
> +	priv->chip.ngpio =3D MRFLD_NGPIO;
> +	priv->chip.can_sleep =3D false;
> +
> +	raw_spin_lock_init(&priv->lock);
> +
> +	pci_set_drvdata(pdev, priv);
> +	retval =3D devm_gpiochip_add_data(&pdev->dev, &priv->chip,
> priv);
> +	if (retval) {
> +		dev_err(&pdev->dev, "gpiochip_add error %d\n",
> retval);
> +		return retval;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
> +		range =3D &mrfld_gpio_ranges[i];
> +		retval =3D gpiochip_add_pin_range(&priv->chip,
> +						"pinctrl-merrifield",
> +						range->gpio_base,
> +						range->pin_base,
> +						range->npins);
> +		if (retval) {
> +			dev_err(&pdev->dev, "failed to add GPIO pin
> range\n");
> +			return retval;
> +		}
> +	}
> +
> +	retval =3D gpiochip_irqchip_add(&priv->chip, &mrfld_irqchip,
> irq_base,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0handle_simple_irq,
> IRQ_TYPE_NONE);
> +	if (retval) {
> +		dev_err(&pdev->dev, "could not connect irqchip to
> gpiochip\n");
> +		return retval;
> +	}
> +
> +	mrfld_irq_init_hw(priv);
> +
> +	gpiochip_set_chained_irqchip(&priv->chip, &mrfld_irqchip,
> pdev->irq,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mrfld_irq_handler);
> +
> +	return 0;
> +}
> +
> +static const struct pci_device_id mrfld_gpio_ids[] =3D {
> +	{ PCI_VDEVICE(INTEL, 0x1199) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(pci, mrfld_gpio_ids);
> +
> +static struct pci_driver mrfld_gpio_driver =3D {
> +	.name		=3D "gpio-merrifield",
> +	.id_table	=3D mrfld_gpio_ids,
> +	.probe		=3D mrfld_gpio_probe,
> +};
> +
> +module_pci_driver(mrfld_gpio_driver);
> +
> +MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>")=
;
> +MODULE_DESCRIPTION("Intel Merrifield SoC GPIO driver");
> +MODULE_LICENSE("GPL v2");

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
