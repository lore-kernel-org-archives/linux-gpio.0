From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] gpio: zynq: Wakeup gpio controller when it is used as
 IRQ controller
Date: Tue, 22 Aug 2017 14:57:44 +0200
Message-ID: <CACRpkdY1rw92wLA+g4f=LqRr-pRsm0yRW972S6STq3kn7axgWw@mail.gmail.com>
References: <cover.1502103715.git.michal.simek@xilinx.com> <72d3cd83bed792a23ab60cf9b6d51b618f5aa084.1502103715.git.michal.simek@xilinx.com>
 <CACRpkdZE-Edr7fWZY5VQM1_65iw7MYGP-iDa2ExZsPxpM0rurQ@mail.gmail.com> <6da5fd79-fbc8-b613-954f-dcbe2ef8d6c5@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34779 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932801AbdHVM5p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2017 08:57:45 -0400
Received: by mail-oi0-f47.google.com with SMTP id j144so56645968oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2017 05:57:45 -0700 (PDT)
In-Reply-To: <6da5fd79-fbc8-b613-954f-dcbe2ef8d6c5@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Nava kishore Manne <navam@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Borsodi Petr <Petr.Borsodi@i.cz>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Aug 14, 2017 at 4:33 PM, Michal Simek <michal.simek@xilinx.com> wrote:

> I have checked 4.13-rc1 and none is doing anything with clock in these
> irq routines.
> It means it is a question if they have the same issue when device is
> sleeping or we do something wrong.

No but they may get in the future and new drivers may have
the issue.

> It is not a problem to move these calls to core (patch is quite simple)
> but validate that if this is correct on others SoC.
> Do you know if we can validate this on different SoC?

pm_runtime_get() etc are only utilized if the driver
explicitly enable runtime PM, and if they do, they should
have their semantics right for this or their code would be
broken severely.


> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9568708a550b..a08a044fa4aa 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1647,14 +1647,22 @@ static void gpiochip_irq_unmap(struct irq_domain
> *d, unsigned int irq)
>  static int gpiochip_irq_reqres(struct irq_data *d)
>  {
>         struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +       int ret;
>
>         if (!try_module_get(chip->gpiodev->owner))
>                 return -ENODEV;
>
> +       ret = pm_runtime_get_sync(chip->parent);
> +       if (ret < 0) {
> +               module_put(chip->gpiodev->owner);
> +               return ret;
> +       }
> +
>         if (gpiochip_lock_as_irq(chip, d->hwirq)) {
>                 chip_err(chip,
>                         "unable to lock HW IRQ %lu for IRQ\n",
>                         d->hwirq);
> +               pm_runtime_put(chip->parent);
>                 module_put(chip->gpiodev->owner);
>                 return -EINVAL;
>         }
> @@ -1666,6 +1674,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
>         struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>
>         gpiochip_unlock_as_irq(chip, d->hwirq);
> +       pm_runtime_put(chip->parent);
>         module_put(chip->gpiodev->owner);

This looks fine, I'm happy to apply that early for v4.15 after the merge
window (now it is a bit late for radical changes).

Yours,
Linus Walleij
