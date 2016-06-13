From: Bin Gao <bin.gao@linux.intel.com>
Subject: Re: [PATCH] gpio: add Intel WhiskeyCove GPIO driver
Date: Mon, 13 Jun 2016 15:40:50 -0700
Message-ID: <20160613224050.GA213010@worksta>
References: <20160611060150.GA88066@worksta>
 <CACRpkdY632ooGJWVBVAUXdTvFNkFnnadey4LUGh9u+GvMrt=jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY632ooGJWVBVAUXdTvFNkFnnadey4LUGh9u+GvMrt=jA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 13, 2016 at 02:43:16PM +0200, Linus Walleij wrote:
> On Sat, Jun 11, 2016 at 8:01 AM, Bin Gao <bin.gao@linux.intel.com> wrote:
> 
> > This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> > This driver is based on gpio-crystalcove.c.
> >
> > Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> > Signed-off-by: Bin Gao <bin.gao@intel.com>
> 
> It is always good to let Mika and Mathias look at new Intel GPIO
> drivers, so added them to the To: line.
> 
> > +config GPIO_WHISKEY_COVE
> > +       tristate "GPIO support for Whiskey Cove PMIC"
> > +       depends on INTEL_SOC_PMIC
> > +       select GPIOLIB_IRQCHIP
> > +       help
> > +         Support for GPIO pins on Whiskey Cove PMIC.
> > +
> > +         Say Yes if you have a Intel SoC based tablet with Whsikey Cove PMIC
> 
> Speling
> 
> > +#include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/gpio.h>
> 
> No use just #include <linux/gpio/driver.h>
> 
> > +#include <linux/seq_file.h>
> > +#include <linux/bitops.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/intel_soc_pmic.h>
> > +
> > +#define WCOVE_GPIO_NUM 13
> > +#define WCOVE_VGPIO_NUM        94
> > +
> > +#define UPDATE_IRQ_TYPE                BIT(0)
> > +#define UPDATE_IRQ_MASK                BIT(1)
> > +
> > +#define GPIOIRQ0               0x4e0b
> > +#define GPIOIRQ1               0x4e0c
> > +#define MGPIOIRQ0              0x4e19
> > +#define MGPIOIRQ1              0x4e1a
> > +#define GPIO0P0CTLO            0x4e44
> > +#define GPIO0P0CTLI            0x4e51
> > +#define GPIO1P0CTLO            0x4e4b
> > +#define GPIO1P0CTLI            0x4e58
> > +#define GPIO2P0CTLO            0x4e4f
> > +#define GPIO2P0CTLI            0x4e5c
> > +
> > +#define CTLI_INTCNT_DIS                (0)
> > +#define CTLI_INTCNT_NE         (1 << 1)
> > +#define CTLI_INTCNT_PE         (2 << 1)
> > +#define CTLI_INTCNT_BE         (3 << 1)
> > +
> > +#define CTLO_DIR_IN            (0)
> > +#define CTLO_DIR_OUT           (1 << 5)
> > +
> > +#define CTLO_DRV_CMOS          (0)
> > +#define CTLO_DRV_OD            (1 << 4)
> 
> That is likely what we call push-pull and open drain driving.
> Implement .set_single_ended() for this driver so you can handle
> that properly in the driver.
> 
> > +#define CTLO_DRV_REN           (1 << 3)
> > +
> > +#define CTLO_RVAL_2KDW         (0)
> > +#define CTLO_RVAL_2KUP         (1 << 1)
> > +#define CTLO_RVAL_50KDW                (2 << 1)
> > +#define CTLO_RVAL_50KUP                (3 << 1)
> 
> Looks like pull-up settings. That is strictly speaking pin control.
> 
> But OK I am trying to find the right way to abstract this without
> making GPIO too heavyweight.
> 
> > +static inline struct wcove_gpio *to_wg(struct gpio_chip *gc)
> > +{
> > +       return container_of(gc, struct wcove_gpio, chip);
> > +}
> 
> No don't do that. Use devm_gpiochip_add_data() and just
> use gpiochip_get_data() to get the pointer out. Look at any
> other driver in the upstream kernel, I think I converted them all.
> 
> > +static inline int to_reg(int gpio, enum ctrl_register reg_type)
> > +{
> > +       int reg;
> > +
> > +       if (reg_type == CTRL_IN) {
> > +               if (gpio < 7)
> > +                       reg = GPIO0P0CTLI + gpio;
> > +               else if (gpio < 11)
> > +                       reg = GPIO1P0CTLI + (gpio % 7);
> > +               else
> > +                       reg = GPIO2P0CTLI + (gpio % 11);
> > +       } else {
> > +               if (gpio < 7)
> > +                       reg = GPIO0P0CTLO + gpio;
> > +               else if (gpio < 11)
> > +                       reg = GPIO1P0CTLO + (gpio % 7);
> > +               else
> > +                       reg = GPIO2P0CTLO + (gpio % 11);
> > +       }
> > +
> > +       return reg;
> > +}
> 
> You could add a kerneldoc to this function explaining how these
> GPIO registers are laid out.
> 
> > +static void wcove_gpio_set(struct gpio_chip *chip,
> > +                                unsigned int gpio, int value)
> > +{
> > +       struct wcove_gpio *wg = to_wg(chip);
> > +
> > +       if (gpio > WCOVE_VGPIO_NUM)
> > +               return;
> 
> gpiolib already protects against this, you can drop it everywhere.
> 
> > +static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
> > +{
> > +       struct wcove_gpio *wg = data;
> > +       unsigned int p0, p1, virq;
> > +       int pending, gpio;
> > +
> > +       if (regmap_read(wg->regmap, GPIOIRQ0, &p0) ||
> > +           regmap_read(wg->regmap, GPIOIRQ1, &p1))
> > +               return IRQ_NONE;
> 
> What does this mean? If we fail to read regmaps then
> it was not our IRQ?
> 
> Should be an error message or something at least I think?
> 
> Apart from that it looks all right.
> 
> Yours,
> Linus Walleij

Linus,

Thank you for your review. We'll come up with a version 2.

-Bin
