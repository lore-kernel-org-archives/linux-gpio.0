From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Wed, 17 Jun 2015 10:18:12 +0200
Message-ID: <CACRpkdYOOGg88g_FeZ+m4A36oQixwDsANAdofcqi+ZV8kE-U=g@mail.gmail.com>
References: <1434098115-17292-1-git-send-email-jun.nie@linaro.org>
	<1434098115-17292-2-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35555 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752270AbbFQISM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2015 04:18:12 -0400
Received: by obbgp2 with SMTP id gp2so28190685obb.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2015 01:18:12 -0700 (PDT)
In-Reply-To: <1434098115-17292-2-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, wan.zhijun@zte.com.cn, jason.liu@linaro.org

On Fri, Jun 12, 2015 at 10:35 AM, Jun Nie <jun.nie@linaro.org> wrote:

> Add ZTE zx296702 GPIO controller support
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

OK looks like a solid start!

> +config GPIO_ZX296702
> +       bool "ZTE ZX296702 GPIO support"
> +       select IRQ_DOMAIN
> +       select GPIOLIB_IRQCHIP

You do not need to select IRQ_DOMAIN when you select GPIOLIB_IRQCHIP,
which selects that for you.

(...)
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gpio.h>

Please use only:

#include <linux/gpio/driver.h>

> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>

You should not need the three last includes.

> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#define ZX_GPIO_DIR    0x00
> +#define ZX_GPIO_IVE    0x04
> +#define ZX_GPIO_IV     0x08
> +#define ZX_GPIO_IEP    0x0C
> +#define ZX_GPIO_IEN    0x10
> +#define ZX_GPIO_DI     0x14
> +#define ZX_GPIO_DO1    0x18
> +#define ZX_GPIO_DO0    0x1C
> +#define ZX_GPIO_DO     0x20
> +
> +#define ZX_GPIO_IM     0x28
> +#define ZX_GPIO_IE     0x2C
> +
> +#define ZX_GPIO_MIS    0x30
> +#define ZX_GPIO_IC     0x34
> +
> +#define ZX_GPIO_NR     16
> +
> +struct zx_gpio {
> +       spinlock_t              lock;
> +
> +       void __iomem            *base;
> +       struct gpio_chip        gc;
> +       bool                    uses_pinctrl;
> +       int                     irq;

Why do you need to save the irq number?

> +static int zx_gpio_request(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct zx_gpio *chip = container_of(gc, struct zx_gpio, gc);

Please create a static inline to do this cast:

static inline struct zx_gpio *to_zx(struct gpio_chip *gc)
{
    return container_of(gc, struct zx_gpio, gc);
}

Then just everywhere:

struct zx_gpio *zx = to_zx(gc);

> +static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct zx_gpio *chip = container_of(gc, struct zx_gpio, gc);
> +       unsigned long flags;
> +       unsigned char gpiodir;
> +
> +       if (offset >= gc->ngpio)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&chip->lock, flags);
> +       gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
> +       gpiodir &= ~(BIT(offset));

Too much parentheses?

> +static int zx_get_value(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct zx_gpio *chip = container_of(gc, struct zx_gpio, gc);
> +
> +       return !!(BIT(offset) & readw_relaxed(chip->base + ZX_GPIO_DI));

For some reason I always put it in the other order, first the read
then the &mask, but this is of course semantically equivalent.

> +       /*
> +        * irq_chip support
> +        */
> +       writew_relaxed(0xffff, chip->base + ZX_GPIO_IM);
> +       writew_relaxed(0, chip->base + ZX_GPIO_IE);
> +       chip->irq = platform_get_irq(pdev, 0);
> +       if (chip->irq < 0) {
> +               dev_err(dev, "invalid IRQ\n");
> +               return -ENODEV;
> +       }

No point in keeping chip->irq around, make it a local variable.

> +       ret = gpiochip_irqchip_add(&chip->gc, &zx_irqchip,
> +                                  irq_base, handle_simple_irq,
> +                                  IRQ_TYPE_NONE);
> +       if (ret) {
> +               dev_info(dev, "could not add irqchip\n");
> +               return ret;
> +       }

Instead of passing irq_base as 0, just pass a zero here
instead of a variable it is less obscure.

Apart from these small things it looks nice!

Yours,
Linus Walleij
