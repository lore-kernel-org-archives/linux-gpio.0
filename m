From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 09/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Mon, 29 Sep 2014 11:18:04 +0200
Message-ID: <CACRpkda3Cq+d47DMm018nAC7ThcHAOv-tOqEbNsUY1mOSnKyoA@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
	<1410723213-22440-10-git-send-email-ryazanov.s.a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:64539 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbaI2JSF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Sep 2014 05:18:05 -0400
Received: by mail-ig0-f169.google.com with SMTP id uq10so1672600igb.4
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2014 02:18:04 -0700 (PDT)
In-Reply-To: <1410723213-22440-10-git-send-email-ryazanov.s.a@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Sep 14, 2014 at 9:33 PM, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:

> Atheros AR5312 SoC have a builtin GPIO controller, which could be
> accessed via memory mapped registers. This patch adds new driver
> for them.
>
> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
(...)
> -       /* Attempt to jump to the mips reset location - the boot loader
> -        * itself might be able to recover the system */
> +       /* Cold reset does not work on the AR2315/6, use the GPIO reset bits
> +        * a workaround. Give it some time to attempt a gpio based hardware
> +        * reset (atheros reference design workaround) */
> +       gpio_request_one(AR2315_RESET_GPIO, GPIOF_OUT_INIT_LOW, "Reset");
> +       mdelay(100);

Please try to use the new GPIO descriptor API.
See Documentation/gpio/consumer.txt

(...)
> +++ b/drivers/gpio/gpio-ar2315.c

> +static u32 ar2315_gpio_intmask;
> +static u32 ar2315_gpio_intval;
> +static unsigned ar2315_gpio_irq_base;
> +static void __iomem *ar2315_mem;

Get rid of these local variables and put them into an allocated
state container, see
Documentation/driver-model/design-patterns.txt

Get rid of _gpio_irq_base altogether. (See comments below.)

(...)
> +static inline u32 ar2315_gpio_reg_read(unsigned reg)
> +{
> +       return __raw_readl(ar2315_mem + reg);
> +}

Use readl_relaxed()

> +static inline void ar2315_gpio_reg_write(unsigned reg, u32 val)
> +{
> +       __raw_writel(val, ar2315_mem + reg);
> +}

Use writel_relaxed()

> +static void ar2315_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
> +{
> +       u32 pend;
> +       int bit = -1;
> +
> +       /* only do one gpio interrupt at a time */
> +       pend = ar2315_gpio_reg_read(AR2315_GPIO_DI);
> +       pend ^= ar2315_gpio_intval;
> +       pend &= ar2315_gpio_intmask;
> +
> +       if (pend) {
> +               bit = fls(pend) - 1;
> +               pend &= ~(1 << bit);

Do this:

#include <linux/bitops.h>

pend &= ~BIT(bit);

> +       ar2315_gpio_intmask |= (1 << gpio);

|= BIT(gpio);

> +       ar2315_gpio_int_setup(gpio, AR2315_GPIO_INT_TRIG_EDGE);
> +}
> +
> +static void ar2315_gpio_irq_mask(struct irq_data *d)
> +{
> +       unsigned gpio = d->irq - ar2315_gpio_irq_base;

Wait, no. No keeping irq bases around like that please.

unsigned offset = d->hwirq;

And call it offset rather than "gpio" everywhere please, since
it is local to this GPIO controller, not the global GPIO numberspace.

> +       /* Disable interrupt */
> +       ar2315_gpio_intmask &= ~(1 << gpio);

&= ~BIT(gpio);

> +static int ar2315_gpio_get_val(struct gpio_chip *chip, unsigned gpio)
> +{
> +       return (ar2315_gpio_reg_read(AR2315_GPIO_DI) >> gpio) & 1;
> +}

Do this:
return !!(ar2315_gpio_reg_read(AR2315_GPIO_DI) & BIT(gpio));

> +static void ar2315_gpio_set_val(struct gpio_chip *chip, unsigned gpio, int val)
> +{
> +       u32 reg = ar2315_gpio_reg_read(AR2315_GPIO_DO);
> +
> +       reg = val ? reg | (1 << gpio) : reg & ~(1 << gpio);
> +       ar2315_gpio_reg_write(AR2315_GPIO_DO, reg);

Convoluted, I would use an if() else construct rather than the ? operator.

> +static int ar2315_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
> +{
> +       return ar2315_gpio_irq_base + gpio;
> +}

Don't implement this at all. You're using the gpiolib irqchip helpers!
It will just overrun this implementation.

Yours,
Linus Walleij
