From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: irqchip: prevent driver unloading if gpio is
 used as irq only
Date: Tue, 30 Jun 2015 22:47:51 +0900
Message-ID: <CAAVeFu+t1+Q_2Da1kG-3OHruK9CytgX0zhVJV2FEbqKFCxEgWg@mail.gmail.com>
References: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36614 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753715AbbF3NsL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 09:48:11 -0400
In-Reply-To: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Fri, Jun 26, 2015 at 2:30 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> Now nothing prevents GPIO driver from being unloaded if its gpios
> were requested as GPIO IRQs only (without calling gpio_request()).
>
> Hence, add calls of try_module_get()/module_put() into
> gpiochip_irq_reqres/relres() to track such scenario properly.

Bad things could happen indeed.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  drivers/gpio/gpiolib.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index be42ab3..9b1d247 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -522,10 +522,14 @@ static int gpiochip_irq_reqres(struct irq_data *d)
>  {
>         struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>
> +       if (!try_module_get(chip->owner))
> +               return -ENODEV;
> +
>         if (gpiochip_lock_as_irq(chip, d->hwirq)) {
>                 chip_err(chip,
>                         "unable to lock HW IRQ %lu for IRQ\n",
>                         d->hwirq);
> +               module_put(chip->owner);
>                 return -EINVAL;
>         }
>         return 0;
> @@ -536,6 +540,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
>         struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>
>         gpiochip_unlock_as_irq(chip, d->hwirq);
> +       module_put(chip->owner);
>  }
>
>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
> --
> 2.4.4
>
