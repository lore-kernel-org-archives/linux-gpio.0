From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] pinctrl: add AMD GPIO driver support.
Date: Mon, 9 Mar 2015 16:02:08 +0100
Message-ID: <CACRpkdZiSaMUQxU5HHuMn0kZhdXqAX6OYVQGmoNriP0jamuHPA@mail.gmail.com>
References: <1422949788.18208.4.camel@kxue-X58A-UD3R>
	<1423111885.18208.41.camel@kxue-X58A-UD3R>
	<1425452005.24903.4.camel@kxue-X58A-UD3R>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34608 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbbCIPCJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 11:02:09 -0400
Received: by obcwp18 with SMTP id wp18so22746448obc.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 08:02:09 -0700 (PDT)
In-Reply-To: <1425452005.24903.4.camel@kxue-X58A-UD3R>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ken Xue <Ken.Xue@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 4, 2015 at 7:53 AM, Ken Xue <Ken.Xue@amd.com> wrote:

> From c2258b4b550d8f61a5eb64fee25d4c0fdd3a1e91 Mon Sep 17 00:00:00 2001
> From: Ken Xue <Ken.Xue@amd.com>
> Date: Wed, 4 Mar 2015 14:48:36 +0800
> Subject: [PATCH] pinctrl: add AMD GPIO driver support.
>
> KERNCZ GPIO is a new IP from AMD. it can be implemented in both x86 and ARM.
> Current driver patch only support GPIO in x86.
>
> Signed-off-by: Ken Xue <Ken.Xue@amd.com>

Large improvement!

> +config PINCTRL_AMD
> +       bool "AMD GPIO pin control"
> +       depends on GPIOLIB
> +       select GPIOLIB_IRQCHIP
> +       select PINCONF
> +       select GENERIC_PINCONF

Looking good.

> +++ b/drivers/pinctrl/pinctrl-amd.c
> +
> +#include <linux/err.h>
> +#include <linux/bug.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/log2.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>

Should still be #include <linux/gpio/driver.h>
isn't it compiling like so?

Add:
#include <linux/bitops.h>

This gives you the BIT() macro, see below.

(...)
> +static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
> +{
> +       unsigned long flags;
> +       u32 pin_reg;
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + offset * 4);
> +       /*
> +        * Suppose BIOS or Bootloader sets specific debounce for the
> +        * GPIO. if not, set debounce to be  2.75ms and remove glitch.
> +       */
> +       if ((pin_reg & DB_TMR_OUT_MASK) == 0) {
> +               pin_reg |= 0xf;
> +               pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;

Do like so:
pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);

> +               pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
> +               pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);

pin_reg &= ~BIT(DB_TMR_LARGE_OFF);

> +       }
> +
> +       pin_reg &= ~(1UL << OUTPUT_ENABLE_OFF);

pin_reg &= ~BIT(OUTPUT_ENABLE_OFF);

(...)
> +static int amd_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
> +               int value)
> +{
> +       u32 pin_reg;
> +       unsigned long flags;
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + offset * 4);
> +       pin_reg |= 1UL << OUTPUT_ENABLE_OFF;

pin_reg |= BIT(OUTPUT_ENABLE_OFF);

> +       pin_reg |= (!!value) << OUTPUT_VALUE_OFF;

This will not zero the bit if the value is zero!

I would write:

if (value)
   pin_reg |= BIT(OUTPUT_VALUE_OFF);
else
   pin_reg &= ~BIT(OUTPUT_VALUE_OFF);

(...)
> +static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
> +{
> +       u32 pin_reg;
> +       unsigned long flags;
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + offset * 4);
> +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> +
> +       return pin_reg & (1UL << PIN_STS_OFF);

Do like this:

return !!(pin_reg & BIT(PIN_STS_OFF));

> +static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
> +{
> +       u32 pin_reg;
> +       unsigned long flags;
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + offset * 4);
> +       pin_reg |= (!!value) << OUTPUT_VALUE_OFF;

Same issue as in the other function. Doesn't drive the
value low!

if (value)
   pin_reg |= BIT(OUTPUT_VALUE_OFF);
else
   pin_reg &= ~BIT(OUTPUT_VALUE_OFF);

(...)
> +static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
> +               unsigned debounce)
> +{
> +       u32 pin_reg;
> +       u32 time;
> +       unsigned long flags;
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + offset * 4);
> +
> +       if (debounce) {
> +               pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
> +               pin_reg &= ~DB_TMR_OUT_MASK;
> +               /*
> +               Debounce        Debounce        Timer   Max
> +               TmrLarge        TmrOutUnit      Unit    Debounce
> +                                                       Time
> +               0       0       61 usec (2 RtcClk)      976 usec
> +               0       1       244 usec (8 RtcClk)     3.9 msec
> +               1       0       15.6 msec (512 RtcClk)  250 msec
> +               1       1       62.5 msec (2048 RtcClk) 1 sec
> +               */
> +
> +               if (debounce < 61) {
> +                       pin_reg |= 1;
> +                       pin_reg &= ~(1UL << DB_TMR_OUT_UNIT_OFF);
> +                       pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
> +               } else if (debounce < 976) {
> +                       time = debounce / 61;
> +                       pin_reg |= time & DB_TMR_OUT_MASK;
> +                       pin_reg &= ~(1UL << DB_TMR_OUT_UNIT_OFF);
> +                       pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
> +               } else if (debounce < 3900) {
> +                       time = debounce / 244;
> +                       pin_reg |= time & DB_TMR_OUT_MASK;
> +                       pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;
> +                       pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);
> +               } else if (debounce < 250000) {
> +                       time = debounce / 15600;
> +                       pin_reg |= time & DB_TMR_OUT_MASK;
> +                       pin_reg &= ~(1UL << DB_TMR_OUT_UNIT_OFF);
> +                       pin_reg |= 1UL << DB_TMR_LARGE_OFF;
> +               } else if (debounce < 1000000) {
> +                       time = debounce / 62500;
> +                       pin_reg |= time & DB_TMR_OUT_MASK;
> +                       pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;
> +                       pin_reg |= 1UL << DB_TMR_LARGE_OFF;

Use the BIT() pattern everywhere (you know what to do).

(...)
> +static void amd_gpio_irq_enable(struct irq_data *d)
> +{
> +       u32 pin_reg;
> +       unsigned long flags;
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> +       /*
> +               Suppose BIOS or Bootloader sets specific debounce for the
> +               GPIO. if not, set debounce to be  2.75ms.
> +       */
> +       if ((pin_reg & DB_TMR_OUT_MASK) == 0) {
> +               pin_reg |= 0xf;
> +               pin_reg |= 1UL << DB_TMR_OUT_UNIT_OFF;
> +               pin_reg &= ~(1UL << DB_TMR_LARGE_OFF);

BIT() pattern.

(...)
> +static void amd_gpio_irq_disable(struct irq_data *d)
> +{
> +       u32 pin_reg;
> +       unsigned long flags;
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> +       pin_reg &= ~(1UL << INTERRUPT_ENABLE_OFF);
> +       pin_reg &= ~(1UL << INTERRUPT_MASK_OFF);

BIT() pattern.

(...)
> +static void amd_gpio_irq_mask(struct irq_data *d)
> +{
> +       u32 pin_reg;
> +       unsigned long flags;
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> +       pin_reg &= ~(1UL << INTERRUPT_MASK_OFF);
> +       writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
> +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> +}
> +
> +static void amd_gpio_irq_unmask(struct irq_data *d)
> +{
> +       u32 pin_reg;
> +       unsigned long flags;
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct amd_gpio *gpio_dev = to_amd_gpio(gc);
> +
> +       spin_lock_irqsave(&gpio_dev->lock, flags);
> +       pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> +       pin_reg |= 1UL << INTERRUPT_MASK_OFF;
> +       writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
> +       spin_unlock_irqrestore(&gpio_dev->lock, flags);
> +}

I don't know if it's necessary to implement both enable/disable
and mask/unmask. I guess you should only mask in the
mask() function and only enable in the enable() function then.

Follow through with the BIT() pattern and see how it looks.

I'll look again at this when the above is fixed.

Yours,
Linus Walleij
