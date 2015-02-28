From: Ken Xue <Ken.Xue@amd.com>
Subject: Re: pinctrl: add AMD GPIO driver support.
Date: Sat, 28 Feb 2015 09:41:38 +0800
Message-ID: <1425087698.14876.28.camel@kxue-X58A-UD3R>
References: <1422949788.18208.4.camel@kxue-X58A-UD3R>
	 <CACRpkda2CQf6ucrLUdzbbFHjmRsRscBZspCf3taGD8t7armwQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0119.outbound.protection.outlook.com ([207.46.100.119]:61664
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750875AbbB1CIb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 27 Feb 2015 21:08:31 -0500
In-Reply-To: <CACRpkda2CQf6ucrLUdzbbFHjmRsRscBZspCf3taGD8t7armwQw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, 2015-02-04 at 14:30 +0100, Linus Walleij wrote:
> On Tue, Feb 3, 2015 at 8:49 AM, Ken Xue <Ken.Xue@amd.com> wrote:
> 
> > KERNCZ GPIO is a new IP from AMD. it can be implemented in both x86 and ARM.
> > Current driver patch only support GPIO in x86.
> >
> > Signed-off-by: Ken Xue <Ken.Xue@amd.com>
> 
> OK...
> 
very sorry for the late response, because of wrongly categorize this
email.

> > +config PINCTRL_AMD
> > +        bool "AMD GPIO pin control"
> > +        depends on GPIOLIB
> > +        select IRQ_DOMAIN
> > +        select PINCONF
> > +        select GENERIC_PINCONF
> 
> select GPIOLIB_IRQCHIP
> 
got it. thanks.

> I am working to simplify all GPIO-irqchips by moving the
> irq domain handling (etc) to the gpiolib core.
> 
> > +++ b/drivers/pinctrl/pinctrl-amd.c
> (...)
> > +#include <linux/err.h>
> > +#include <linux/bug.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/compiler.h>
> > +#include <linux/types.h>
> > +#include <linux/errno.h>
> > +#include <linux/log2.h>
> > +#include <linux/io.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> 
> Skip these three includes when using GPIOLIB_IRQCHIP.
> 
> > +#include <linux/gpio.h>
> 
> Should be:
> #include <linux/gpio/driver.h>
> 
got it.thanks.

> > +#include <linux/slab.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mutex.h>
> > +#include <linux/acpi.h>
> > +#include <linux/seq_file.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/pinctrl/pinconf.h>
> > +#include <linux/pinctrl/pinconf-generic.h>
> > +#include <linux/list.h>
> > +#include "pinctrl-utils.h"
> > +#include "pinctrl-amd.h"
> > +
> > +static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       int ret = 0;
> > +       unsigned long flags;
> > +       union gpio_pin_reg pin;
> 
> I don't quite understand this union, but will look at it later on.
> 
I will change this style for all codes.

> > +       struct amd_gpio *gpio_dev = container_of(gc, struct amd_gpio, gc);
> 
> This will be a recurring call. I usually add a static inline function
> like this:
> 
> static inline struct amd_gpio *to_amd_gpio(struct gpio_chip *gc)
> {
>     return container_of(gc, struct amd_gpio, gc);
> }
> But you can choose. In this case the oneline is quite neat.
> 
I will apply this suggestion.

> > +       if (offset >= gpio_dev->gc.ngpio) {
> > +               dev_err(&gpio_dev->pdev->dev, "offset(%d) > ngpio\n", offset);
> > +               ret = -EINVAL;
> > +               goto exit;
> > +       }
> 
> I think it's overzealous to handle this in the driver. If it should
> be handled, we should patch the gpiolib core to check this.
> 
got it.

> > +       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +       pin.reg_u32 = readl(gpio_dev->base + offset * 4);
> > +       /*
> > +               Suppose BIOS or Bootloader sets specific debounce for the
> > +               GPIO. if not, set debounce to be  2.75ms and remove glitch.
> > +       */
> > +       if (pin.debounce_tmr_out == 0) {
> > +               pin.debounce_tmr_out = 0xf;
> > +               pin.debounce_tmr_out_unit = 1;
> > +               pin.debounce_tmr_large = 0;
> > +               pin.debounce_cntrl = DEBOUNCE_TYPE_REMOVE_GLITCH;
> > +       }
> > +
> > +       pin.output_enable = 0;
> > +       writel(pin.reg_u32, gpio_dev->base + offset * 4);
> 
> This pin.reg_32 seems a bit like it's reimplementing mmio-regmap.
> 
> > +static int amd_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
> > +               int value)
> > +{
> > +       int ret = 0;
> > +       unsigned long flags;
> > +       union gpio_pin_reg pin;
> > +       struct amd_gpio *gpio_dev = container_of(gc, struct amd_gpio, gc);
> > +
> > +       if (offset >= gpio_dev->gc.ngpio) {
> > +               dev_err(&gpio_dev->pdev->dev, "offset(%d) > ngpio\n", offset);
> > +               ret = -EINVAL;
> > +               goto exit;
> > +       }
> 
> Again skip this check.
> 
> > +       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +
> > +       pin.reg_u32 = readl(gpio_dev->base + offset * 4);
> > +       pin.output_enable = 1;
> > +       pin.output_value = !!value;
> 
> That's clever. Inverting logic?
> 
> > +static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       unsigned long flags;
> > +       union gpio_pin_reg pin;
> > +       struct amd_gpio *gpio_dev = container_of(gc, struct amd_gpio, gc);
> > +
> > +       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +       pin.reg_u32 = readl(gpio_dev->base + offset * 4);
> > +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> > +
> > +       return pin.pin_sts;
> > +}
> 
> And here you avoid checking the offset boundary so keep the
> functions in this style.
> 
yes.

> > +static int amd_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> > +{
> > +       unsigned int  ret;
> > +       struct amd_gpio *gpio_dev = container_of(gc, struct amd_gpio, gc);
> > +
> > +       ret = irq_create_mapping(gpio_dev->domain, offset);
> > +
> > +       return ret;
> > +}
> 
> This function away entirely with GPIOLIB_IRQCHIP.
> 
got it.

> > +static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
> > +               unsigned debounce)
> > +{
> > +       unsigned long flags;
> > +       union gpio_pin_reg pin;
> > +       struct amd_gpio *gpio_dev = container_of(gc, struct amd_gpio, gc);
> > +
> > +       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +       pin.reg_u32 = readl(gpio_dev->base + offset * 4);
> > +
> > +       if (debounce) {
> > +               pin.debounce_cntrl = DEBOUNCE_TYPE_REMOVE_GLITCH;
> > +               /*
> > +               Debounce        Debounce        Timer   Max
> > +               TmrLarge        TmrOutUnit      Unit    Debounce
> > +                                                       Time
> > +               0       0       61 usec (2 RtcClk)      976 usec
> > +               0       1       244 usec (8 RtcClk)     3.9 msec
> > +               1       0       15.6 msec (512 RtcClk)  250 msec
> > +               1       1       62.5 msec (2048 RtcClk) 1 sec
> > +               */
> > +
> > +               if (debounce < 61) {
> > +                       pin.debounce_tmr_out = 1;
> > +                       pin.debounce_tmr_out_unit = 0;
> > +                       pin.debounce_tmr_large = 0;
> > +               } else if (debounce < 976) {
> > +                       pin.debounce_tmr_out = debounce / 61;
> > +                       pin.debounce_tmr_out_unit = 0;
> > +                       pin.debounce_tmr_large = 0;
> > +               } else if (debounce < 3900) {
> > +                       pin.debounce_tmr_out = debounce / 244;
> > +                       pin.debounce_tmr_out_unit = 1;
> > +                       pin.debounce_tmr_large = 0;
> > +               } else if (debounce < 250000) {
> > +                       pin.debounce_tmr_out = debounce / 15600;
> > +                       pin.debounce_tmr_out_unit = 0;
> > +                       pin.debounce_tmr_large = 1;
> > +               } else if (debounce < 1000000) {
> > +                       pin.debounce_tmr_out = debounce / 62500;
> > +                       pin.debounce_tmr_out_unit = 1;
> > +                       pin.debounce_tmr_large = 1;
> > +               } else {
> > +                       pin.debounce_cntrl = DEBOUNCE_TYPE_NO_DEBOUNCE;
> > +                       return -EINVAL;
> > +               }
> > +       } else {
> > +               pin.debounce_tmr_out_unit = 0;
> > +               pin.debounce_tmr_large = 0;
> > +               pin.debounce_tmr_out = 0;
> > +               pin.debounce_cntrl = DEBOUNCE_TYPE_NO_DEBOUNCE;
> > +       }
> > +       writel(pin.reg_u32, gpio_dev->base + offset * 4);
> > +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> > +
> > +       return 0;
> > +}
> 
> So if I read it correctly there is a hardware debounce timer and here
> you're implementing that?
> 
yes.

> > +static void amd_gpio_irq_enable(struct irq_data *d)
> > +{
> > +       unsigned long flags;
> > +       union gpio_pin_reg pin;
> > +       struct amd_gpio *gpio_dev = irq_data_get_irq_chip_data(d);
> 
> With GPIOLIB_IRQCHIP you will get gpio_chip *gc in the
> struct irq_data *d so this has to be like this in all these
> functions:
> struct gpio_chip *gc = = irq_data_get_irq_chip_data(d);
> struct amd_gpio *gpio_dev = container_of(gc...);
> 
got it.

> > +static void amd_irq_ack(struct irq_data *d)
> > +{
> > +       /* based on HW design,there is no need to ack HW
> > +       before handle current irq. But this routine is
> > +       necessary for handle_edge_irq */
> > +}
> 
> OK.
> 
> /*
>  * But use this comment style.
>  * With stars on every line.
>  */
> 
got it.

> > +static void amd_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
> > +{
> > +       u32 reg;
> > +       int handled = 0;
> > +       unsigned long flags;
> > +       union gpio_pin_reg pin;
> > +       struct list_head *pos, *nx;
> > +       struct amd_gpio_irq_pin *irq_pin;
> > +       struct irq_chip *chip = irq_get_chip(irq);
> > +       struct amd_gpio *gpio_dev = irq_desc_get_handler_data(desc);
> 
> Here you will again get struct gpio_chip * as handler data,
> so it needs dereferencing and container_of():ing.
> 
got it.

> > +static int amd_gpio_irq_map(struct irq_domain *d, unsigned int virq,
> > +                           irq_hw_number_t hw)
> > +{
> > +       unsigned long flags;
> > +       struct list_head *pos, *nx;
> > +       struct amd_gpio_irq_pin *irq_pin;
> > +       struct amd_gpio *gpio_dev = d->host_data;
> > +
> > +       list_for_each_safe(pos, nx, &gpio_dev->irq_list) {
> > +               irq_pin = list_entry(pos, struct amd_gpio_irq_pin, list);
> > +               if (irq_pin->pin_num == hw)
> > +                       return 0;
> > +       }
> > +
> > +       irq_pin = devm_kzalloc(&gpio_dev->pdev->dev,
> > +                               sizeof(struct amd_gpio_irq_pin), GFP_KERNEL);
> > +       irq_pin->pin_num = hw;
> > +       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +       list_add_tail(&irq_pin->list, &gpio_dev->irq_list);
> > +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> > +
> > +       irq_set_chip_and_handler_name(virq, &amd_gpio_irqchip,
> > +                                       handle_simple_irq, "amdgpio");
> > +       irq_set_chip_data(virq, gpio_dev);
> > +
> > +       return 0;
> > +}
> > +
> > +static void amd_gpio_irq_unmap(struct irq_domain *d, unsigned int virq)
> > +{
> > +       unsigned long flags;
> > +       struct irq_data *data;
> > +       struct list_head *pos, *nx;
> > +       struct amd_gpio_irq_pin *irq_pin;
> > +       struct amd_gpio *gpio_dev = d->host_data;
> > +
> > +       data = irq_get_irq_data(virq);
> > +
> > +       list_for_each_safe(pos, nx, &gpio_dev->irq_list) {
> > +               irq_pin = list_entry(pos, struct amd_gpio_irq_pin, list);
> > +               if (data->hwirq == irq_pin->pin_num) {
> > +                       spin_lock_irqsave(&gpio_dev->lock, flags);
> > +                       list_del(pos);
> > +                       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> > +                       devm_kfree(&gpio_dev->pdev->dev, irq_pin);
> > +               }
> > +       }
> > +}
> > +
> > +static const struct irq_domain_ops amd_gpio_irq_ops = {
> > +       .map = amd_gpio_irq_map,
> > +       .unmap = amd_gpio_irq_unmap,
> > +       .xlate = irq_domain_xlate_onetwocell,
> > +};
> 
> This just looks very convoluted. Due to the absence of comments
> I cannot figure out why the irqdomain mapping has to have this
> complex code and I suspect the plain simple mapping done
> by the GPIOLIB_IRQCHIP will suffice for this usecase.
> 
> Then all of this code goes away, simply.
> 
ok.

> > +static int amd_gpio_probe(struct platform_device *pdev)
> > +{
> > +       int ret = 0;
> > +       struct resource *res;
> > +       struct amd_gpio *gpio_dev;
> > +
> > +       gpio_dev = devm_kzalloc(&pdev->dev,
> > +                               sizeof(struct amd_gpio), GFP_KERNEL);
> > +       if (!gpio_dev)
> > +               return -ENOMEM;
> > +
> > +       spin_lock_init(&gpio_dev->lock);
> > +       INIT_LIST_HEAD(&gpio_dev->irq_list);
> 
> I don't understand the purpose of this list and suggest you
> get rid of it.
> 
ok.

> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!res) {
> > +               dev_err(&pdev->dev, "Failed to get gpio io resource.\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       gpio_dev->base = devm_ioremap_nocache(&pdev->dev, res->start,
> > +                                               resource_size(res));
> > +       if (IS_ERR(gpio_dev->base))
> > +               return PTR_ERR(gpio_dev->base);
> > +
> > +       gpio_dev->irq = platform_get_irq(pdev, 0);
> > +       if (gpio_dev->irq < 0) {
> > +               dev_err(&pdev->dev, "Failed to get gpio IRQ.\n");
> > +               return -EINVAL;
> > +       }
> 
> Do you really need to keep this irq cached in gpio_dev?
> Or can it just be a local variable in this probe() function?
> 
will use local variable instead of  gpio_dev->irq.

> > +
> > +       gpio_dev->pdev = pdev;
> > +       gpio_dev->gc.direction_input    = amd_gpio_direction_input;
> > +       gpio_dev->gc.direction_output   = amd_gpio_direction_output;
> > +       gpio_dev->gc.get                        = amd_gpio_get_value;
> > +       gpio_dev->gc.set                        = amd_gpio_set_value;
> > +       gpio_dev->gc.set_debounce       = amd_gpio_set_debounce;
> > +       gpio_dev->gc.to_irq                     = amd_gpio_to_irq;
> > +       gpio_dev->gc.dbg_show           = amd_gpio_dbg_show;
> > +
> > +       gpio_dev->gc.base                       = 0;
> > +       gpio_dev->gc.label                      = pdev->name;
> > +       gpio_dev->gc.owner                      = THIS_MODULE;
> > +       gpio_dev->gc.dev                        = &pdev->dev;
> > +       gpio_dev->gc.ngpio                      = TOTAL_NUMBER_OF_PINS;
> > +#if defined(CONFIG_OF_GPIO)
> > +       gpio_dev->gc.of_node                    = pdev->dev.of_node;
> > +#endif
> > +
> > +       gpio_dev->groups = kerncz_groups;
> > +       gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
> > +
> > +       amd_pinctrl_desc.name = dev_name(&pdev->dev);
> > +       gpio_dev->pctrl = pinctrl_register(&amd_pinctrl_desc,
> > +                                       &pdev->dev, gpio_dev);
> > +       if (!gpio_dev->pctrl) {
> > +               dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       gpio_dev->domain = irq_domain_add_linear(pdev->dev.of_node,
> > +                                               TOTAL_NUMBER_OF_PINS,
> > +                                             &amd_gpio_irq_ops, gpio_dev);
> > +       if (!gpio_dev->domain) {
> > +               ret = -ENOSYS;
> > +               dev_err(&pdev->dev, "Failed to register irq domain\n");
> > +               goto out1;
> > +       }
> 
> Get rid of this domain.
> 
got it.

> > +       ret = gpiochip_add(&gpio_dev->gc);
> > +       if (ret)
> > +               goto out2;
> > +
> > +       ret = gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
> > +                               0, 0, TOTAL_NUMBER_OF_PINS);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Failed to add pin range\n");
> > +               goto out3;
> > +       }
> 
> Replace this:
> 
> > +       irq_set_handler_data(gpio_dev->irq, gpio_dev);
> > +       irq_set_chained_handler(gpio_dev->irq, amd_gpio_irq_handler);
> 
> With:
> 
>          ret = gpiochip_irqchip_add(&gpio_dev->gc,
>                                    &amd_gpio_irqchip,
>                                    0,
>                                    handle_simple_irq,
>                                    IRQ_TYPE_NONE);
>         if (ret) {
>                 dev_err(&dev->dev, "could not add irqchip\n");
>                 gpiochip_remove(&nmk_chip->chip);
>                 return -ENODEV;
>         }
>         gpiochip_set_chained_irqchip(&gpio_dev->gc,
>                                      &amd_gpio_irqchip,
>                                      gpio_dev->irq,
>                                      amd_gpio_irq_handler);
> 
> 
got it.

> > diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> (...)
> > +#ifndef _PINCTRL_AMD_H
> > +#define _PINCTRL_AMD_H
> > +
> > +#define TOTAL_NUMBER_OF_PINS   192
> > +#define AMD_GPIO_PINS_PER_BANK  64
> > +#define AMD_GPIO_TOTAL_BANKS    3
> > +
> > +#define AMD_GPIO_PINS_BANK0     63
> > +#define AMD_GPIO_PINS_BANK1     64
> > +#define AMD_GPIO_PINS_BANK2     56
> > +
> > +#define WAKE_INT_MASTER_REG 0xfc
> > +#define EOI_MASK (1 << 29)
> > +
> > +union gpio_pin_reg {
> > +       struct {
> > +       u32 debounce_tmr_out:4;
> > +       u32 debounce_tmr_out_unit:1;
> > +#define DEBOUNCE_TYPE_NO_DEBOUNCE               0x0
> > +#define DEBOUNCE_TYPE_PRESERVE_LOW_GLITCH       0x1
> > +#define DEBOUNCE_TYPE_PRESERVE_HIGH_GLITCH      0x2
> > +#define DEBOUNCE_TYPE_REMOVE_GLITCH             0x3
> > +       u32 debounce_cntrl:2;
> > +       u32 debounce_tmr_large:1;
> > +
> > +#define EDGE_TRAGGER   0x0
> > +#define LEVEL_TRIGGER  0x1
> > +       u32 level_trig:1;
> > +
> > +#define ACTIVE_HIGH    0x0
> > +#define ACTIVE_LOW     0x1
> > +#define BOTH_EADGE     0x1
> > +       u32 active_level:2;
> > +
> > +#define ENABLE_INTERRUPT       0x1
> > +#define DISABLE_INTERRUPT      0x0
> > +       u32 interrupt_enable:1;
> > +#define ENABLE_INTERRUPT_MASK  0x0
> > +#define DISABLE_INTERRUPT_MASK 0x1
> > +       u32 interrupt_mask:1;
> > +
> > +       u32 wake_cntrl:3;
> > +       u32 pin_sts:1;
> > +
> > +       u32 drv_strength_sel:2;
> > +       u32 pull_up_sel:1;
> > +       u32 pull_up_enable:1;
> > +       u32 pull_down_enable:1;
> > +
> > +       u32 output_value:1;
> > +       u32 output_enable:1;
> > +       u32 sw_cntrl_in:1;
> > +       u32 sw_cntrl_en:1;
> > +       u32 reserved0:2;
> > +
> > +#define CLR_INTR_STAT  1
> > +       u32 interrupt_sts:1;
> > +       u32 wake_sts:1;
> > +       u32 reserved1:2;
> > +       };
> > +       u32 reg_u32;
> > +};
> 
> OK are you trying to access the different bits in these registers
> by using this union?
> 
> I think it's very convoluted. In the above you say things like
> u32 foo:2, so you say it's 32 bits but then you only use two of
> them etc. This union also needs to be packed to work as
> intended.
> 
> I recommend that you just use #defines for bits and shifts
> as done in most drivers:
> 
> #define ENABLE_INTERRUPT BIT(14)
> 
> And just use
> foo |= ENABLE_INTERRUPT;
> to set this bit and
> foo &= ~ENABLE_INTERRUPT;
> to clear this bit.
> 
> See almost any other mmio register-based driver in drivers/gpio
> for example on how we usually do this.
> 
I will follow example's style. but, honestly, i think my style can make
codes straightly. 

> > +struct amd_gpio {
> > +       spinlock_t              lock;
> > +       struct list_head        irq_list;/* mapped irq pin list */
> 
> Get rid of this.
> 
got it.

> > +       void __iomem            *base;
> > +       int                     irq;
> 
> Do you need to save this?
> 
remove.

> > +       const struct amd_pingroup *groups;
> > +       u32 ngroups;
> > +       struct pinctrl_dev *pctrl;
> > +       struct irq_domain *domain;
> 
> Goes away with GPIOLIB_IRQCHIP
> 
yes. got it.

> > +       struct gpio_chip        gc;
> > +       struct resource         *res;
> > +       struct platform_device  *pdev;
> > +};
> 
> 
> > +static const struct pinctrl_pin_desc kerncz_pins[] = {
> > +       PINCTRL_PIN(0, "GPIO_0"),
> > +       PINCTRL_PIN(1, "GPIO_1"),
> > +       PINCTRL_PIN(2, "GPIO_2"),
> > +       PINCTRL_PIN(3, "GPIO_3"),
> > +       PINCTRL_PIN(4, "GPIO_4"),
> > +       PINCTRL_PIN(5, "GPIO_5"),
> > +       PINCTRL_PIN(6, "GPIO_6"),
> > +       PINCTRL_PIN(7, "GPIO_7"),
> > +       PINCTRL_PIN(8, "GPIO_8"),
> > +       PINCTRL_PIN(9, "GPIO_9"),
> > +       PINCTRL_PIN(10, "GPIO_10"),
> > +       PINCTRL_PIN(11, "GPIO_11"),
> > +       PINCTRL_PIN(12, "GPIO_12"),
> > +       PINCTRL_PIN(13, "GPIO_13"),
> > +       PINCTRL_PIN(14, "GPIO_14"),
> > +       PINCTRL_PIN(15, "GPIO_15"),
> > +       PINCTRL_PIN(16, "GPIO_16"),
> > +       PINCTRL_PIN(17, "GPIO_17"),
> > +       PINCTRL_PIN(18, "GPIO_18"),
> > +       PINCTRL_PIN(19, "GPIO_19"),
> > +       PINCTRL_PIN(20, "GPIO_20"),
> > +       PINCTRL_PIN(23, "GPIO_23"),
> > +       PINCTRL_PIN(24, "GPIO_24"),
> > +       PINCTRL_PIN(25, "GPIO_25"),
> > +       PINCTRL_PIN(26, "GPIO_26"),
> > +       PINCTRL_PIN(39, "GPIO_39"),
> > +       PINCTRL_PIN(40, "GPIO_40"),
> > +       PINCTRL_PIN(43, "GPIO_42"),
> > +       PINCTRL_PIN(46, "GPIO_46"),
> > +       PINCTRL_PIN(47, "GPIO_47"),
> > +       PINCTRL_PIN(48, "GPIO_48"),
> > +       PINCTRL_PIN(49, "GPIO_49"),
> > +       PINCTRL_PIN(50, "GPIO_50"),
> > +       PINCTRL_PIN(51, "GPIO_51"),
> > +       PINCTRL_PIN(52, "GPIO_52"),
> > +       PINCTRL_PIN(53, "GPIO_53"),
> > +       PINCTRL_PIN(54, "GPIO_54"),
> > +       PINCTRL_PIN(55, "GPIO_55"),
> > +       PINCTRL_PIN(56, "GPIO_56"),
> > +       PINCTRL_PIN(57, "GPIO_57"),
> > +       PINCTRL_PIN(58, "GPIO_58"),
> > +       PINCTRL_PIN(59, "GPIO_59"),
> > +       PINCTRL_PIN(60, "GPIO_60"),
> > +       PINCTRL_PIN(61, "GPIO_61"),
> > +       PINCTRL_PIN(62, "GPIO_62"),
> > +       PINCTRL_PIN(64, "GPIO_64"),
> > +       PINCTRL_PIN(65, "GPIO_65"),
> > +       PINCTRL_PIN(66, "GPIO_66"),
> > +       PINCTRL_PIN(68, "GPIO_68"),
> > +       PINCTRL_PIN(69, "GPIO_69"),
> > +       PINCTRL_PIN(70, "GPIO_70"),
> > +       PINCTRL_PIN(71, "GPIO_71"),
> > +       PINCTRL_PIN(72, "GPIO_72"),
> > +       PINCTRL_PIN(74, "GPIO_74"),
> > +       PINCTRL_PIN(75, "GPIO_75"),
> > +       PINCTRL_PIN(76, "GPIO_76"),
> > +       PINCTRL_PIN(84, "GPIO_84"),
> > +       PINCTRL_PIN(85, "GPIO_85"),
> > +       PINCTRL_PIN(86, "GPIO_86"),
> > +       PINCTRL_PIN(87, "GPIO_87"),
> > +       PINCTRL_PIN(88, "GPIO_88"),
> > +       PINCTRL_PIN(89, "GPIO_89"),
> > +       PINCTRL_PIN(90, "GPIO_90"),
> > +       PINCTRL_PIN(91, "GPIO_91"),
> > +       PINCTRL_PIN(92, "GPIO_92"),
> > +       PINCTRL_PIN(93, "GPIO_93"),
> > +       PINCTRL_PIN(95, "GPIO_95"),
> > +       PINCTRL_PIN(96, "GPIO_96"),
> > +       PINCTRL_PIN(97, "GPIO_97"),
> > +       PINCTRL_PIN(98, "GPIO_98"),
> > +       PINCTRL_PIN(99, "GPIO_99"),
> > +       PINCTRL_PIN(100, "GPIO_100"),
> > +       PINCTRL_PIN(101, "GPIO_101"),
> > +       PINCTRL_PIN(102, "GPIO_102"),
> > +       PINCTRL_PIN(113, "GPIO_113"),
> > +       PINCTRL_PIN(114, "GPIO_114"),
> > +       PINCTRL_PIN(115, "GPIO_115"),
> > +       PINCTRL_PIN(116, "GPIO_116"),
> > +       PINCTRL_PIN(117, "GPIO_117"),
> > +       PINCTRL_PIN(118, "GPIO_118"),
> > +       PINCTRL_PIN(119, "GPIO_119"),
> > +       PINCTRL_PIN(120, "GPIO_120"),
> > +       PINCTRL_PIN(121, "GPIO_121"),
> > +       PINCTRL_PIN(122, "GPIO_122"),
> > +       PINCTRL_PIN(126, "GPIO_126"),
> > +       PINCTRL_PIN(129, "GPIO_129"),
> > +       PINCTRL_PIN(130, "GPIO_130"),
> > +       PINCTRL_PIN(131, "GPIO_131"),
> > +       PINCTRL_PIN(132, "GPIO_132"),
> > +       PINCTRL_PIN(133, "GPIO_133"),
> > +       PINCTRL_PIN(135, "GPIO_135"),
> > +       PINCTRL_PIN(136, "GPIO_136"),
> > +       PINCTRL_PIN(137, "GPIO_137"),
> > +       PINCTRL_PIN(138, "GPIO_138"),
> > +       PINCTRL_PIN(139, "GPIO_139"),
> > +       PINCTRL_PIN(140, "GPIO_140"),
> > +       PINCTRL_PIN(141, "GPIO_141"),
> > +       PINCTRL_PIN(142, "GPIO_142"),
> > +       PINCTRL_PIN(143, "GPIO_143"),
> > +       PINCTRL_PIN(144, "GPIO_144"),
> > +       PINCTRL_PIN(145, "GPIO_145"),
> > +       PINCTRL_PIN(146, "GPIO_146"),
> > +       PINCTRL_PIN(147, "GPIO_147"),
> > +       PINCTRL_PIN(148, "GPIO_148"),
> > +       PINCTRL_PIN(166, "GPIO_166"),
> > +       PINCTRL_PIN(167, "GPIO_167"),
> > +       PINCTRL_PIN(168, "GPIO_168"),
> > +       PINCTRL_PIN(169, "GPIO_169"),
> > +       PINCTRL_PIN(170, "GPIO_170"),
> > +       PINCTRL_PIN(171, "GPIO_171"),
> > +       PINCTRL_PIN(172, "GPIO_172"),
> > +       PINCTRL_PIN(173, "GPIO_173"),
> > +       PINCTRL_PIN(174, "GPIO_174"),
> > +       PINCTRL_PIN(175, "GPIO_175"),
> > +       PINCTRL_PIN(176, "GPIO_176"),
> > +       PINCTRL_PIN(177, "GPIO_177"),
> > +};
> 
> Are these pins really given these names in the datasheet?
> Usually it is a pin name on the package or a name of the
> pad on the silicon.
> 
GPIO pin can be defined to different purpose based on different
board.So, i would like to use these name to avoid pointing out different
meaning in different board.

> The driver is a good start but needs some nice:ing up!
> 
thanks a lot for your help.

> Yours,
> Linus Walleij


