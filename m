From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] gpio: convince line to become input in irq helper
Date: Wed, 22 Jun 2016 10:12:27 -0700
Message-ID: <20160622171227.GQ1256@tuxbot>
References: <1466606015-16326-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:33381 "EHLO
	mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751927AbcFVRMb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2016 13:12:31 -0400
Received: by mail-pf0-f182.google.com with SMTP id i123so19511148pfg.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2016 10:12:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1466606015-16326-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Wed 22 Jun 07:33 PDT 2016, Linus Walleij wrote:

> The generic IRQ helper library just checks if the IRQ line is
> set as input before activating it for interrupts. As we
> recently started to check things better with .get_dir() it
> turns out that it's good to try to convince the line to become
> an input before attempting to lock it as IRQ.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I really like this.

> ---
>  drivers/gpio/gpiolib.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 58d822d7e8da..b9a6a5c69fbb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1010,6 +1010,23 @@ static int gpiochip_irq_reqres(struct irq_data *d)
>  	if (!try_module_get(chip->gpiodev->owner))
>  		return -ENODEV;
>  
> +	/*
> +	 * If it is possible to switch this GPIO to an input
> +	 * this is a good time to do it.
> +	 */
> +	if (chip->direction_input) {
> +		struct gpio_desc *desc;
> +		int ret;
> +
> +		desc = gpiochip_get_desc(chip, d->hwirq);
> +		if (IS_ERR(desc))
> +			return PTR_ERR(desc);
> +
> +	        ret = chip->direction_input(chip, d->hwirq);
> +		if (!ret)
> +			clear_bit(FLAG_IS_OUT, &desc->flags);

With this updated semantics I think it's a mistake to not propagate this
error. Clients will not be able to rely on it and have to continue
configuring their pins as input just to be sure.

> +	}
> +
>  	if (gpiochip_lock_as_irq(chip, d->hwirq)) {
>  		chip_err(chip,
>  			"unable to lock HW IRQ %lu for IRQ\n",

Regards,
Bjorn
