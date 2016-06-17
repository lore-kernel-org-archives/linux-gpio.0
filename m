From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio: add Intel WhiskeyCove GPIO driver
Date: Fri, 17 Jun 2016 12:03:42 +0300
Message-ID: <20160617090342.GH1739@lahna.fi.intel.com>
References: <20160616212208.GA60092@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160616212208.GA60092@worksta>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 16, 2016 at 02:22:08PM -0700, Bin Gao wrote:
> This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> This driver is based on gpio-crystalcove.c.

Looks good. I have couple of minor comments, see below.

> Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> Signed-off-by: Bin Gao <bin.gao@intel.com>
> ---
> Changes in v2:
>  - Typo fix (Whsikey --> Whiskey).
>  - Included linux/gpio/driver.h instead of linux/gpio.h
>  - Implemented .set_single_ended().
>  - Added GPIO register description.
>  - Replaced container_of() with gpiochip_get_data().
>  - Removed unnecessary "if (gpio > WCOVE_VGPIO_NUM" check.
>  - Removed the device id table and added MODULE_ALIAS().
>  drivers/gpio/Kconfig      |  13 ++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-wcove.c | 426 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 drivers/gpio/gpio-wcove.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a116609..891c1b8 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -806,6 +806,19 @@ config GPIO_CRYSTAL_COVE
>  	  This driver can also be built as a module. If so, the module will be
>  	  called gpio-crystalcove.
>  
> +config GPIO_WHISKEY_COVE
> +	tristate "GPIO support for Whiskey Cove PMIC"
> +	depends on INTEL_SOC_PMIC
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Support for GPIO pins on Whiskey Cove PMIC.
> +
> +	  Say Yes if you have a Intel SoC based tablet with Whiskey Cove PMIC
> +	  inside.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called gpio-wcove.
> +
>  config GPIO_CS5535
>  	tristate "AMD CS5535/CS5536 GPIO support"
>  	depends on MFD_CS5535
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 991598e..fff6914 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
>  obj-$(CONFIG_GPIO_CLPS711X)	+= gpio-clps711x.o
>  obj-$(CONFIG_GPIO_CS5535)	+= gpio-cs5535.o
>  obj-$(CONFIG_GPIO_CRYSTAL_COVE)	+= gpio-crystalcove.o
> +obj-$(CONFIG_GPIO_WHISKEY_COVE)	+= gpio-wcove.o
>  obj-$(CONFIG_GPIO_DA9052)	+= gpio-da9052.o
>  obj-$(CONFIG_GPIO_DA9055)	+= gpio-da9055.o
>  obj-$(CONFIG_GPIO_DAVINCI)	+= gpio-davinci.o
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> new file mode 100644
> index 0000000..d2e5b44
> --- /dev/null
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -0,0 +1,426 @@
> +/*
> + * gpio-wcove.c - Intel Whiskey Cove GPIO Driver
> + *
> + * This driver is written based on gpio-crystalcove.c
> + *
> + * Copyright (C) 2015 Intel Corporation. All rights reserved.

It is 2016 now isn't it? :-)

> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version
> + * 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/seq_file.h>
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/intel_soc_pmic.h>
> +
> +#define DRV_NAME "bxt_wcove_gpio"

Drop this.

> +
> +/*
> + * Whiskey Cove PMIC has 13 physical GPIO pins divided into 3 banks:
> + * Bank 0: Pin 0 - 6
> + * Bank 1: Pin 7 - 10
> + * Bank 2: Pin 11 -12
> + * Each pin has one output control register and one input control register.
> + */
> +#define BANK0_NR_PINS		7
> +#define BANK1_NR_PINS		4
> +#define BANK2_NR_PINS		2
> +#define WCOVE_GPIO_NUM		(BANK0_NR_PINS + BANK1_NR_PINS + BANK2_NR_PINS)
> +#define WCOVE_VGPIO_NUM		94
> +/* GPIO output control registers(one per pin): 0x4e44 - 0x4e50 */
> +#define GPIO_OUT_CTRL_BASE	0x4e44
> +/* GPIO input control registers(one per pin): 0x4e51 - 0x4e5d */
> +#define GPIO_IN_CTRL_BASE	0x4e51
> +
> +/*
> + * GPIO interrupts are organized in two groups:
> + * Group 0: Bank 0 pins (Pin 0 - 6)
> + * Group 1: Bank 1 and Bank 2 pins (Pin 7 - 12)
> + * Each group has two registers(one bit per pin): status and mask.
> + */
> +#define GROUP0_NR_IRQS		7
> +#define GROUP1_NR_IRQS		6
> +#define IRQ_MASK_BASE		0x4e19
> +#define IRQ_STATUS_BASE		0x4e0b
> +#define UPDATE_IRQ_TYPE		BIT(0)
> +#define UPDATE_IRQ_MASK		BIT(1)
> +
> +#define CTLI_INTCNT_DIS		(0)
> +#define CTLI_INTCNT_NE		(1 << 1)
> +#define CTLI_INTCNT_PE		(2 << 1)
> +#define CTLI_INTCNT_BE		(3 << 1)
> +
> +#define CTLO_DIR_IN		(0)
> +#define CTLO_DIR_OUT		(1 << 5)
> +
> +#define CTLO_DRV_MASK		(1 << 4)
> +#define CTLO_DRV_OD		(0)
> +#define CTLO_DRV_CMOS		CTLO_DRV_MASK
> +
> +#define CTLO_DRV_REN		(1 << 3)
> +
> +#define CTLO_RVAL_2KDW		(0)
> +#define CTLO_RVAL_2KUP		(1 << 1)
> +#define CTLO_RVAL_50KDW		(2 << 1)
> +#define CTLO_RVAL_50KUP		(3 << 1)
> +
> +#define CTLO_INPUT_SET	(CTLO_DRV_CMOS | CTLO_DRV_REN | CTLO_RVAL_2KUP)
> +#define CTLO_OUTPUT_SET	(CTLO_DIR_OUT | CTLO_INPUT_SET)
> +
> +enum ctrl_register {
> +	CTRL_IN,
> +	CTRL_OUT,
> +};
> +
> +/*
> + * struct wcove_gpio - Whiskey Cove GPIO controller
> + * @buslock: for bus lock/sync and unlock.
> + * @chip: the abstract gpio_chip structure.
> + * @regmap: the regmap from the parent device.

Missing kernel-doc for regmap_irq_chip.

> + * @update: pending IRQ setting update, to be written to the chip upon unlock.
> + * @intcnt_value: the Interrupt Detect value to be written.
> + * @set_irq_mask: true if the IRQ mask needs to be set, false to clear.
> + */
> +struct wcove_gpio {
> +	struct mutex buslock; /* irq_bus_lock */
> +	struct gpio_chip chip;
> +	struct regmap *regmap;
> +	struct regmap_irq_chip_data *regmap_irq_chip;
> +	int update;
> +	int intcnt_value;
> +	bool set_irq_mask;
> +};
> +
> +static inline unsigned int to_reg(int gpio, enum ctrl_register reg_type)
> +{
> +	unsigned int reg;
> +	int bank;
> +
> +	if (gpio < BANK0_NR_PINS)
> +		bank = 0;
> +	else if (gpio < (BANK0_NR_PINS + BANK1_NR_PINS))
> +		bank = 1;
> +	else
> +		bank = 2;
> +
> +	if (reg_type == CTRL_IN)
> +		reg = GPIO_IN_CTRL_BASE + bank;
> +	else
> +		reg = GPIO_OUT_CTRL_BASE + bank;
> +
> +	return reg;
> +}
> +
> +static void wcove_update_irq_mask(struct wcove_gpio *wg,
> +					int gpio)

Does this with into 80 chars?

> +{
> +	int group;
> +	unsigned int reg, bit;
> +
> +	group = gpio < GROUP0_NR_IRQS ? 0 : 1;
> +	reg = IRQ_MASK_BASE + group;
> +	bit = (group == 0) ? BIT(gpio % GROUP0_NR_IRQS) :
> +		BIT((gpio - GROUP0_NR_IRQS) % GROUP1_NR_IRQS);
> +
> +	if (wg->set_irq_mask)
> +		regmap_update_bits(wg->regmap, reg, bit, 1);
> +	else
> +		regmap_update_bits(wg->regmap, reg, bit, 0);
> +}
