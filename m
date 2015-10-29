From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add tps65218 gpio driver
Date: Thu, 29 Oct 2015 14:11:48 +0100
Message-ID: <CACRpkdZm-kHoiD9EiNHrmv96wKverd63YE9SAfxiOyjnUNe2Gw@mail.gmail.com>
References: <1445618023-25380-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445618023-25380-1-git-send-email-nicolassaenzj@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2015 at 6:33 PM, Nicolas Saenz Julienne
<nicolassaenzj@gmail.com> wrote:

> Driver for the GPIO block found in ti's tps65218 pmics.
>
> The device has two GPIOs and one GPO pin which can be configured as follows:
> GPIO1:
>         -general-purpose, open-drain output controlled by GPO1 user bit and/or
>          sequencer
>         -DDR3 reset input signal from SOC. Signal is either latched or
>          passed-trough to GPO2 pin. See below for details.
> GPO2:
>         -general-purpose output controlled by GPO2 user bit
>         -DDR3 reset output signal. Signal is controlled by GPIO1 and PGOOD.
>          See below for details.
>         -Output buffer can be configured as open-drain or push-pull.
> GPIO3:
>         -general-purpose, open-drain output controlled by GPO3 user bit and/or
>          sequencer
>         -reset input-signal for DCDC1 and DCDC2.
>
> The input configurations are not meant to be used by the user so the driver
> only offers GPOs.
>
> v2: Added request routine that evaluates the fw config flags and removed module
>     owner
>
> Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>
(...)

(Attend to the mail robot's comments)

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/errno.h>
> +#include <linux/gpio.h>

Should be <linux/gpio/driver.h>

> +#include <linux/platform_device.h>
> +#include <linux/mfd/tps65218.h>
> +#include "gpiolib.h"
> +
> +struct tps65218_gpio {
> +       struct tps65218 *tps65218;
> +       struct gpio_chip gpio_chip;
> +};
> +
> +#define to_tg(gc)      container_of(gc, struct tps65218_gpio, gpio_chip)

Use a static inline function for this instead.

> +static int tps65218_gpio_get(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct tps65218_gpio *tps65218_gpio = to_tg(gc);
> +       struct tps65218 *tps65218 = tps65218_gpio->tps65218;
> +       unsigned int val;
> +       int ret;
> +
> +       ret = tps65218_reg_read(tps65218, TPS65218_REG_ENABLE2, &val);
> +       if (ret)
> +               return ret;
> +
> +       return val & (TPS65218_ENABLE2_GPIO1 << offset);

Clamp to bool:
return !!(val & (TPS65218_ENABLE2_GPIO1 << offset));

> +static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
> +                               int value)
> +{
> +       /* Only drives GPOs */
> +       return 0;
> +}

So shouldn't you implement a .set_direction() callback that will fail if
the user tries to set a line as input?

> +static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct tps65218_gpio *tps65218_gpio = to_tg(gc);
> +       struct tps65218 *tps65218 = tps65218_gpio->tps65218;
> +       unsigned long flags = gc->desc->flags;
> +       int ret;
> +
> +       if (flags & FLAG_OPEN_SOURCE) {
> +               dev_err(gc->dev, "can't work as open source\n");
> +               return -EINVAL;
> +       }

This requires Laurent's recent patches I guess.

> +static struct gpio_chip template_chip = {
> +       .label                  = "gpio-tps65218",
> +       .owner                  = THIS_MODULE,
> +       .request                = tps65218_gpio_request,
> +       .direction_output       = tps65218_gpio_output,
> +       .get                    = tps65218_gpio_get,
> +       .set                    = tps65218_gpio_set,
> +       .can_sleep              = true,
> +       .ngpio                  = 3,
> +       .base                   = -1,
> +};

As mentioned you need to implement .set_direction() and fail
to set any line as input.

Apart from this it looks very nice.

Yours,
Linus Walleij
