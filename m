From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 056/182] gpio: samsung: use gpiochip data pointer
Date: Wed, 9 Dec 2015 16:50:24 -0600
Message-ID: <20151209225024.GA28304@deathstar>
References: <1449667342-32435-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:33582 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751467AbbLIWub (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 17:50:31 -0500
Received: by mail-ig0-f172.google.com with SMTP id mv3so3762858igc.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 14:50:30 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449667342-32435-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Paul Bolle <pebolle@tiscali.nl>, Kukjin Kim <kgene.kim@samsung.com>

On Wed, Dec 09, 2015 at 02:22:22PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Paul Bolle <pebolle@tiscali.nl>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-samsung.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index 7c288ba4dc87..4cb4a314c02b 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -753,7 +753,7 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
>  #endif
>  

gpiochip_add is still mentioned in the comments instead of gpiochip_add_data.
Both here and in the comment block above this function.

>  	/* gpiochip_add() prints own failure message on error. */
> -	ret = gpiochip_add(gc);
> +	ret = gpiochip_add_data(gc, chip);
>  	if (ret >= 0)
>  		s3c_gpiolib_track(chip);
>  }
> @@ -862,7 +862,7 @@ static void __init samsung_gpiolib_add_4bit2_chips(struct samsung_gpio_chip *chi
>  
>  int samsung_gpiolib_to_irq(struct gpio_chip *chip, unsigned int offset)
>  {
> -	struct samsung_gpio_chip *samsung_chip = container_of(chip, struct samsung_gpio_chip, chip);
> +	struct samsung_gpio_chip *samsung_chip = gpiochip_get_data(chip);
>  
>  	return samsung_chip->irq_base + offset;
>  }
> -- 
> 2.4.3
> 
