From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] MIPS: ath79: Move the GPIO driver to drivers/gpio
Date: Mon, 6 Jul 2015 22:52:20 +0200
Message-ID: <CACRpkdaxxjQa1pCCuUsPFHAs295mtKPLP5Vh+-VaZ=3o6idNMA@mail.gmail.com>
References: <1435914709-15092-1-git-send-email-albeu@free.fr>
	<1435914709-15092-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:33332 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751615AbbGFUwW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 16:52:22 -0400
Received: by laar3 with SMTP id r3so171025923laa.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2015 13:52:21 -0700 (PDT)
In-Reply-To: <1435914709-15092-3-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Fri, Jul 3, 2015 at 11:11 AM, Alban Bedel <albeu@free.fr> wrote:

> +++ b/drivers/gpio/gpio-ath79.c
> @@ -0,0 +1,236 @@
> +/*
> + *  Atheros AR71XX/AR724X/AR913X GPIO API support
> + *
> + *  Copyright (C) 2010-2011 Jaiganesh Narayanan <jnarayanan@atheros.com>
> + *  Copyright (C) 2008-2011 Gabor Juhos <juhosg@openwrt.org>
> + *  Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>
> + *
> + *  Parts of this file are based on Atheros' 2.6.15/2.6.31 BSP
> + *
> + *  This program is free software; you can redistribute it and/or modify it
> + *  under the terms of the GNU General Public License version 2 as published
> + *  by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/spinlock.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/gpio.h>

Nominally only <linux/gpio/driver.h> should be enough for a driver.

> +#include <linux/platform_data/gpio-ath79.h>
> +#include <linux/of_device.h>
> +
> +#include <asm/mach-ath79/ar71xx_regs.h>
> +
> +static void __iomem *ath79_gpio_base;
> +static u32 ath79_gpio_count;
> +static DEFINE_SPINLOCK(ath79_gpio_lock);

Would prefer to use the state container design pattern from
Documentation/driver-model/design-patterns.txt

> +static void __ath79_gpio_set_value(unsigned gpio, int value)
> +{
> +       void __iomem *base = ath79_gpio_base;
> +
> +       if (value)
> +               __raw_writel(1 << gpio, base + AR71XX_GPIO_REG_SET);
> +       else
> +               __raw_writel(1 << gpio, base + AR71XX_GPIO_REG_CLEAR);

I have a vague memory of some semantics being strange in the MIPS
camp, but doesn't writel_relaxed() do what you want? (Benji brought
something related up for discussion on the ksummit list...)

> +static int __ath79_gpio_get_value(unsigned gpio)
> +{
> +       return (__raw_readl(ath79_gpio_base + AR71XX_GPIO_REG_IN) >> gpio) & 1;
> +}
> +
> +static int ath79_gpio_get_value(struct gpio_chip *chip, unsigned offset)
> +{
> +       return __ath79_gpio_get_value(offset);
> +}

Strange double functions that can be refactored out I think.
All internal uses should be able to reference the gpio_chip.

> +static void ath79_gpio_set_value(struct gpio_chip *chip,
> +                                 unsigned offset, int value)
> +{
> +       __ath79_gpio_set_value(offset, value);
> +}

Same.

> +       __raw_writel(__raw_readl(base + AR71XX_GPIO_REG_OE) | (1 << offset),
> +                    base + AR71XX_GPIO_REG_OE);

I tend to #include <linux/bitops.h>

And just | BIT(offset) there in the end.

Some prefer it like this, I just think the explit bitops look neat.

> +int gpio_get_value(unsigned gpio)
> +EXPORT_SYMBOL(gpio_get_value);
> +void gpio_set_value(unsigned gpio, int value)
> +EXPORT_SYMBOL(gpio_set_value);
> +int gpio_to_irq(unsigned gpio)
> +EXPORT_SYMBOL(gpio_to_irq);

These are some quite horrific overrides of the gpiolib functions.
I would like it rooted out and replaced with the gpiolib implementations.
I think we managed to exorcise this "generic GPIO" from ARM but
I'm honestly not certain.

> +int irq_to_gpio(unsigned irq)
> +{
> +       /* FIXME */
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL(irq_to_gpio);

Can't you just delete this? It has been removed from generic GPIO and
gpiolib because of ambiguity.

Yours,
Linus Walleij
