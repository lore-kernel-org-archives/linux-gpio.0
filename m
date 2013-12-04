From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: driver for Xtensa GPIO32
Date: Wed, 4 Dec 2013 14:18:01 +0100
Message-ID: <CACRpkdb7nLg6op+_oi=PB2FnVcErQGDhHk82PHk7Os9rG1XVKg@mail.gmail.com>
References: <9b46369ab60c23a6bd9f1930c4ff6c2fec57e798.1386057874.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:62370 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755605Ab3LDNSC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 08:18:02 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so16698668oag.34
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2013 05:18:01 -0800 (PST)
In-Reply-To: <9b46369ab60c23a6bd9f1930c4ff6c2fec57e798.1386057874.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Tue, Dec 3, 2013 at 9:04 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

This is a pretty terse commit message for an entirely new driver.
For example I have no clue which architecture this is and what
machine/platforms in that arch that may use this, or if it's some
softcore or ... you know, such basic things a simple GPIO maintainer
can't be expected to know.

> +config GPIO_XTENSA
> +       bool "Xtensa GPIO32 support"
> +       depends on XTENSA
> +       help
> +         Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
> +         and EXPSTATE (output) ports

If there is also going to be 16 or 64 bit versions of this thing
you better call the Kconfig symbol GPIO_XTENSA32 or
something.

> +obj-$(CONFIG_GPIO_XTENSA)      += gpio-xtensa.o

And this gpio-xtensa32.o

> +++ b/drivers/gpio/gpio-xtensa.c

> +#include <asm/coprocessor.h>

Hm so it seems we are using some coprocessor instructions
to get at the GPIO, don't be shy, write a few comments on it :-)

> +#define ENABLE_CP()                                    \
> +{                                                      \
> +       unsigned long flags, cpenable;                  \
> +       local_irq_save(flags);                          \
> +       RSR_CPENABLE(cpenable);                         \
> +       WSR_CPENABLE(cpenable | XCHAL_CP_PORT_MASK);
> +
> +#define DISABLE_CP()                                   \
> +       WSR_CPENABLE(cpenable);                         \
> +       local_irq_restore(flags);                       \
> +}

Rewrite these to static inlines.

> +static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
> +{
> +       return 1;
> +}

Ummm.... explain this. Alll lines are always inputs?

> +static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
> +{
> +       u32 impwire;
> +
> +       ENABLE_CP();
> +       __asm__ __volatile__("read_impwire %0" : "=a" (impwire));
> +       DISABLE_CP();
> +
> +       return !!(impwire & (1 << offset));

Use this pattern everywhere you do (1 << offset):

#include <linux/bitops.h>

s/(1 << offset)/BIT(offset)/g

> +static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
> +                                   int value)
> +{
> +}

This is a rather nasty implementation for something that will always
fail. What about putting an dev_err(gc->dev, "..."); in that set_value?

> +static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)

What is an expstate?

> +{
> +       return 0;
> +}

So all lines are always outputs? (Comment in the code thx.)

> +static int __init xtensa_gpio_init(void)
> +{
> +       struct platform_device *pdev;
> +
> +       pdev = platform_device_register_simple("xtensa-gpio", 0, NULL, 0);
> +       if (IS_ERR(pdev))
> +               return PTR_ERR(pdev);
> +
> +       return platform_driver_register(&xtensa_gpio_driver);
> +}
> +subsys_initcall(xtensa_gpio_init);

Why not device_initcall()? (i.e. same as module_init())
Do you need it very early?

Yours,
Linus Walleij
