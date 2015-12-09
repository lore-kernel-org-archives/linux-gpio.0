From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: add support for wakeup configuration
Date: Wed, 9 Dec 2015 16:08:20 +0100
Message-ID: <CACRpkdZKKWbWDmRGGfHSuF1R-OLubLkuCPWtYxXVh+iwprL7-Q@mail.gmail.com>
References: <1448644755-29183-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448644755-29183-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Aubrey Li <aubrey.li@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2015 at 6:19 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:

> The PL061 supports interrupts and those can be wakeup interrupts. We
> need to provide support for configuring those interrupts as wakeup
> sources.
>
> This patch adds irq_set_wake callback for PL061 so that GPIO interrupts
> can be configured as wakeup.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/gpio/gpio-pl061.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 4d4b37676702..8b1cbd5767f9 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> +#include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/bitops.h>
> @@ -269,12 +270,20 @@ static void pl061_irq_ack(struct irq_data *d)
>         spin_unlock(&chip->lock);
>  }
>
> +static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +
> +       return irq_set_irq_wake(gc->irq_parent, state);
> +}
> +
>  static struct irq_chip pl061_irqchip = {
>         .name           = "pl061",
>         .irq_ack        = pl061_irq_ack,
>         .irq_mask       = pl061_irq_mask,
>         .irq_unmask     = pl061_irq_unmask,
>         .irq_set_type   = pl061_irq_type,
> +       .irq_set_wake   = pl061_irq_set_wake,
>  };

Is this really all that is needed? Don't you need to call
device_wakeup_enable(&adev->dev, 1); on the amba (primecell)
device providing this GPIO, lest it may be suspended itself
and render this exercise pointless.

And if not, why not?

How are GPIO chips providing IRQs actually going to do this,
provided that they need to be kept awake themselves?

Adding some people to the conversation.

Yours,
Linus Walleij
