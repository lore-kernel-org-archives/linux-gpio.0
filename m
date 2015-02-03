From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mmp: add GPIO driver for Marvell MMP series
Date: Tue, 3 Feb 2015 14:21:43 +0100
Message-ID: <CACRpkdbUqCQZiSDbiD994ecF4h6xHShE8yfdrE2vNVNW+082zw@mail.gmail.com>
References: <1422412229-23640-1-git-send-email-chao.xie@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422412229-23640-1-git-send-email-chao.xie@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chao Xie <chao.xie@marvell.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, xiechao_mail@163.com, Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 28, 2015 at 3:30 AM, Chao Xie <chao.xie@marvell.com> wrote:

> From: Chao Xie <chao.xie@marvell.com>
>
> For some old PXA series, they used PXA GPIO driver.
> The IP of GPIO changes since PXA988 which is Marvell MMP
> series.
> It will use new way to control the GPIO level, direction
> and edge status.
>
> Signed-off-by: Chao Xie <chao.xie@marvell.com>

(...)

> +config GPIO_MMP
> +       bool "MMP GPIO support"
> +       depends on ARCH_MMP

All new simple drivers with IRQ should

select GPIOLIB_IRQCHIP

Since this looks like a basic MMIO driver I think
you should also use:

select GPIO_GENERIC

And set up simple getter/setter functions with a


> +       help
> +         Say yes here to support the MMP GPIO device at PXA1088/PXA1908/PXA1928.
> +         Comparing with PXA GPIO device, the IP of MMP GPIO changes a lot.
> +

(...)

> +++ b/drivers/gpio/gpio-mmp.c

> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>

You don't need this include with GPIOLIB_IRQCHIP

> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>

#include <linux/gpio/driver.h>

> +#include <linux/clk.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip/chained_irq.h>

get rid of these two includes in favor of using GPIOLIB_IRQCHIP

> +#include <linux/platform_data/gpio-mmp.h>

Add:
#include <linux/basic_mmio_gpio.h>

And implement generic GPIO using bgpio_init()

(...)
> +#define GPLR           0x0
> +#define GPDR           0xc
> +#define GPSR           0x18
> +#define GPCR           0x24
> +#define GRER           0x30
> +#define GFER           0x3c
> +#define GEDR           0x48
> +#define GSDR           0x54
> +#define GCDR           0x60
> +#define GSRER          0x6c
> +#define GCRER          0x78
> +#define GSFER          0x84
> +#define GCFER          0x90
> +#define GAPMASK                0x9c
> +#define GCPMASK                0xa8
> +
> +/* Bank will have 2^n GPIOes, and for mmp-gpio n = 5 */
> +#define BANK_GPIO_ORDER                5
> +#define BANK_GPIO_NUMBER       (1 << BANK_GPIO_ORDER)
> +#define BANK_GPIO_MASK         (BANK_GPIO_NUMBER - 1)
> +
> +#define mmp_gpio_to_bank_idx(gpio)     ((gpio) >> BANK_GPIO_ORDER)
> +#define mmp_gpio_to_bank_offset(gpio)  ((gpio) & BANK_GPIO_MASK)
> +#define mmp_bank_to_gpio(idx, offset)  (((idx) << BANK_GPIO_ORDER)     \
> +                                               | ((offset) & BANK_GPIO_MASK))
> +

This looks convoluted. Why not just register each bank as a separate
device instead of trying to figure out bank index like this?

> +struct mmp_gpio_bank {
> +       void __iomem *reg_bank;
> +       u32 irq_mask;
> +       u32 irq_rising_edge;
> +       u32 irq_falling_edge;
> +};
> +
> +struct mmp_gpio_chip {
> +       struct gpio_chip chip;

That should then be
struct bgpio_chip       bgc;

For generic GPIO.

> +       void __iomem *reg_base;
> +       int irq;
> +       struct irq_domain *domain;

These two will not be necessary to keep around with
GPIOLIB_IRQCHIP

> +       unsigned int ngpio;

This is part of struct gpio_chip so do not duplicate it.

> +       unsigned int nbank;
> +       struct mmp_gpio_bank *banks;

And those two I think you should get rid of by creating one
chip per bank.

> +};

So merge these two into one struct and instantiate one device for
each bank.

> +static int mmp_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct mmp_gpio_chip *mmp_chip =
> +                       container_of(chip, struct mmp_gpio_chip, chip);
> +
> +       return irq_create_mapping(mmp_chip->domain, offset);
> +}

This function goes away with GPIOLIB_IRQCHIP.
Just leave it unassigned and let the core handle this translation.

> +static int mmp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct mmp_gpio_chip *mmp_chip =
> +                       container_of(chip, struct mmp_gpio_chip, chip);

Create a static inline to cast the gpio_chip to a mmp_chip like
this:

static inline struct mmp_gpio_chip *to_mmp(struct gpio_chip *gc)
{
    return container_of(chip, struct mmp_gpio_chip, chip);
}

Use that everywhere to simplify.

> +       struct mmp_gpio_bank *bank =
> +                       &mmp_chip->banks[mmp_gpio_to_bank_idx(offset)];
> +       u32 bit = (1 << mmp_gpio_to_bank_offset(offset));

And get rid of this by using one device per bank.

> +static int mmp_gpio_direction_output(struct gpio_chip *chip,
> +static int mmp_gpio_get(struct gpio_chip *chip, unsigned offset)
> +static void mmp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)

Looks like generic GPIO will do the job.

> +#ifdef CONFIG_OF_GPIO
> +static int mmp_gpio_of_xlate(struct gpio_chip *chip,
> +                            const struct of_phandle_args *gpiospec,
> +                            u32 *flags)
> +{
> +       struct mmp_gpio_chip *mmp_chip =
> +                       container_of(chip, struct mmp_gpio_chip, chip);
> +
> +       /* GPIO index start from 0. */
> +       if (gpiospec->args[0] >= mmp_chip->ngpio)
> +               return -EINVAL;
> +
> +       if (flags)
> +               *flags = gpiospec->args[1];
> +
> +       return gpiospec->args[0];
> +}
> +#endif

This also goes to the generic xlate with one device per bank.

> +static int mmp_gpio_irq_type(struct irq_data *d, unsigned int type)
> +static void mmp_gpio_demux_handler(unsigned int irq, struct irq_desc *desc)
> +static void mmp_ack_muxed_gpio(struct irq_data *d)
> +static void mmp_mask_muxed_gpio(struct irq_data *d)
> +static void mmp_unmask_muxed_gpio(struct irq_data *d)

Looks OK but make sure to convert to GPIOLIB_IRQCHIP and convert from
struct gpio_chip * passed as irq_data *d to the internal chip type
with the new to_mmp().

(...)

>From here:

> +static int mmp_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +                             irq_hw_number_t hw)
> +{
> +       irq_set_chip_and_handler(irq, &mmp_muxed_gpio_chip,
> +                                handle_edge_irq);
> +       irq_set_chip_data(irq, d->host_data);
> +       set_irq_flags(irq, IRQ_TYPE_NONE);
> +
> +       return 0;
> +}
> +
> +static const struct irq_domain_ops mmp_gpio_irq_domain_ops = {
> +       .map    = mmp_irq_domain_map,
> +       .xlate  = irq_domain_xlate_twocell,
> +};


To here goes away with GPIOLIB_IRQCHIP (moved to core).

> +#ifdef CONFIG_OF_GPIO
> +       mmp_chip->chip.of_node = np;
> +       mmp_chip->chip.of_xlate = mmp_gpio_of_xlate;
> +       mmp_chip->chip.of_gpio_n_cells = 2;
> +#endif

Can't we just select or depend on OF_GPIO for this
driver and get rid of the #fidef:s?

> +static int __init mmp_gpio_init(void)
> +{
> +       return platform_driver_register(&mmp_gpio_driver);
> +}
> +postcore_initcall(mmp_gpio_init);

Why does this nees to be postcore? A normal module
would be nice.

Yours,
Linus Walleij
