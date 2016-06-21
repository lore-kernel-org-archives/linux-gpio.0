From: Bin Gao <bin.gao@linux.intel.com>
Subject: Re: [PATCH v3] gpio: add Intel WhiskeyCove GPIO driver
Date: Tue, 21 Jun 2016 11:54:46 -0700
Message-ID: <20160621185446.GA83592@worksta>
References: <20160620180214.GA38668@worksta>
 <CAHp75VfGpfeBXJG_SN_nyu22Ex8WbABve1qZ+b6pOQimz5N2rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfGpfeBXJG_SN_nyu22Ex8WbABve1qZ+b6pOQimz5N2rA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2016 at 02:19:57AM +0300, Andy Shevchenko wrote:
> My comments below.

Thanks for your review.

> > +config GPIO_WHISKEY_COVE
> > +       tristate "GPIO support for Whiskey Cove PMIC"
> > +       depends on INTEL_SOC_PMIC
> > +       select GPIOLIB_IRQCHIP
> > +       help
> > +         Support for GPIO pins on Whiskey Cove PMIC.
> > +
> > +         Say Yes if you have a Intel SoC based tablet with Whiskey Cove PMIC
> 
> What if I have not a tablet with WC PMIC inside?

This driver is for the GPIO controller in the WC PMIC. If there is no WC PMIC,
this driver shouldn't be compiled.
You question is more like:
If a device doesn't exist, what will its driver do?

> > +#include <linux/seq_file.h>
> > +#include <linux/bitops.h>
> > +#include <linux/regmap.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/mfd/intel_soc_pmic.h>
> 
> Alphabetical order?

I checked Documentation/CodingStyle but didn't find any alphabetical order
description. Is this newly enforced?

> > +#define GROUP0_NR_IRQS         7
> > +#define GROUP1_NR_IRQS         6
> > +#define IRQ_MASK_BASE          0x4e19
> > +#define IRQ_STATUS_BASE                0x4e0b
> 
> Can you define all your bases as a) offsets by value, and b) with
> _OFFSET suffix instead of _BASE, though second one is up to you.

Strictly speaking, it's called "offset base". I'm really not sure
it will be more readable to replace BASE with OFFSET here.

> > +#define CTLI_INTCNT_DIS                (0)
> 
> (0 << 1) or...
> 
> > +#define CTLI_INTCNT_NE         (1 << 1)
> > +#define CTLI_INTCNT_PE         (2 << 1)
> > +#define CTLI_INTCNT_BE         (3 << 1)
> 
> ...INTCNT(x)  ((x) << 1)
> ...DIS 0
> ...NE 1
> 
> and so on.
> 
> Same for all similar blocks of constants.

Makes sense.

> 
> > +
> > +#define CTLO_DIR_IN            (0)
> > +#define CTLO_DIR_OUT           (1 << 5)
> > +
> > +#define CTLO_DRV_MASK          (1 << 4)
> > +#define CTLO_DRV_OD            (0)
> > +#define CTLO_DRV_CMOS          CTLO_DRV_MASK
> > +
> > +#define CTLO_DRV_REN           (1 << 3)
> > +
> > +#define CTLO_RVAL_2KDW         (0)
> > +#define CTLO_RVAL_2KUP         (1 << 1)
> > +#define CTLO_RVAL_50KDW                (2 << 1)
> > +#define CTLO_RVAL_50KUP                (3 << 1)
> 
> Wait, are you sure that's is pure gpio and not a full pinctrl (pinconf) + gpio?

No, we don't have pinctrl for this driver. Those bits are just for pure GPIO setting.

> > +static inline unsigned int to_reg(int gpio, enum ctrl_register reg_type)
> > +{
> > +       unsigned int reg;
> > +       int bank;
> > +
> > +       if (gpio < BANK0_NR_PINS)
> > +               bank = 0;
> > +       else if (gpio < (BANK0_NR_PINS + BANK1_NR_PINS))
> > +               bank = 1;
> > +       else
> > +               bank = 2;
> 
> It might be better to use a constant struct to iterate through:
> 
> struct gpio_banks {
>  ... bankno;
>  ... start;
>  ... len;
> };
> 
> Though I have no strong opinion here since it will have only 3 records.

As you said, it's only used once in one function, so not worth to do.

> > +static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> > +{
> > +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> > +       int ret;
> > +       unsigned int val;
> 
> Reverse xmas tree, please.

Will do.

> > +static void wcove_bus_lock(struct irq_data *data)
> > +{
> > +       struct wcove_gpio *wg = gpiochip_get_data(
> > +               irq_data_get_irq_chip_data(data));
> > +
> > +       mutex_lock(&wg->buslock);
> 
> I suppose you have to add a hint to static analyzer here and below.

I didn't quite get it. You meant to add some comments for these 2 functions?

> 
> > +}
> > +
> > +static void wcove_bus_sync_unlock(struct irq_data *data)
> > +{
> > +       struct wcove_gpio *wg = gpiochip_get_data(
> > +               irq_data_get_irq_chip_data(data));
> 
> One line

Will do.

> > +static struct irq_chip wcove_irqchip = {
> > +       .name                   = "Whiskey Cove",
> > +       .irq_mask               = wcove_irq_mask,
> > +       .irq_unmask             = wcove_irq_unmask,
> > +       .irq_set_type           = wcove_irq_type,
> > +       .irq_bus_lock           = wcove_bus_lock,
> > +       .irq_bus_sync_unlock    = wcove_bus_sync_unlock,
> 
> Is it my mail client or they are not aligned?

I checked my Sent box as well as the source file and they are well aligned.

> > +       int pending, gpio;
> 
> unsigned int gpio;

Will do.

> > +       if (regmap_read(wg->regmap, IRQ_STATUS_BASE, &p0) ||
> 
> Better to use + 0 here.

Make sense, will do.

> 
> > +           regmap_read(wg->regmap, IRQ_STATUS_BASE + 1, &p1)) {
> > +               pr_err("%s(): regmap_read() failed.\n", __func__);
> 
> dev_err();

Will do.

> > +       regmap_write(wg->regmap, IRQ_STATUS_BASE, p0);
> 
> Ditto.

Will do.

> > +static int wcove_gpio_probe(struct platform_device *pdev)
> > +{
> > +       int virq, retval, irq = platform_get_irq(pdev, 0);
> > +       struct wcove_gpio *wg;
> > +       struct device *dev = pdev->dev.parent;
> > +       struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
> 
> > +
> 
> Put irq assignment here.

Will do.

> 
> > +       if (irq < 0)
> > +               return irq;
> > +               dev_warn(&pdev->dev, "request irq failed: %d, virq: %d\n",
> > +                                                       retval, virq);
> 
> Non fatal? Needs an explanation in the comment.

Should dev_err(), will fix this.

> > +out_remove_gpio:
> > +       gpiochip_remove(&wg->chip);
> > +       return retval;
> 
> BLUNDER! You are using devm_*() API.

Will fix this.

> > +static int wcove_gpio_remove(struct platform_device *pdev)
> > +{
> > +       struct wcove_gpio *wg = platform_get_drvdata(pdev);
> > +
> > +       gpiochip_remove(&wg->chip);
> 
> Ditto.

Will do.

> 
> > +       return 0;
> > +}
> > +
> > +static struct platform_driver wcove_gpio_driver = {
> > +       .driver = {
> > +               .name = "bxt_wcove_gpio",
> 
> No PM?

Right, no PM for this driver.
