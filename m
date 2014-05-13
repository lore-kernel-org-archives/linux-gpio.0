From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: generic: add request function pointer
Date: Tue, 13 May 2014 16:59:43 +0900
Message-ID: <CAAVeFuLUkP_4UW3EhStrPJ4caA5DdKqgJ-Do_qxWuzi5qHaotQ@mail.gmail.com>
References: <loom.20140512T195210-63@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:58088 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752099AbaEMIAE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 04:00:04 -0400
Received: by mail-ve0-f182.google.com with SMTP id sa20so10177642veb.41
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2014 01:00:03 -0700 (PDT)
In-Reply-To: <loom.20140512T195210-63@post.gmane.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anthony Fee <anthony.fee@emutex.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 13, 2014 at 2:54 AM, Anthony Fee <anthony.fee@emutex.com> wrote:
> gpiolib will require all gpio drivers to expicitly set the request function
> pointer in future. To encourage gpio driver developers to adhere to this
> standard gpio-generic.c now sets this function pointer.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

for the non-HTML version. :)

On top of being future-proof, having the GPIO range check is also a good thing.

>
> Signed-off-by: Anthony Fee <anthony.fee@emutex.com>
> ---
>  drivers/gpio/gpio-generic.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index b5dff9e..fea8c82 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -388,6 +388,14 @@ static int bgpio_setup_direction(struct bgpio_chip
> *bgc,
>         return 0;
>  }
>
> +static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
> +{
> +       if (gpio_pin < chip->ngpio)
> +               return 0;
> +
> +       return -EINVAL;
> +}
> +
>  int bgpio_remove(struct bgpio_chip *bgc)
>  {
>         return gpiochip_remove(&bgc->gc);
> @@ -413,6 +421,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct device
> *dev,
>         bgc->gc.label = dev_name(dev);
>         bgc->gc.base = -1;
>         bgc->gc.ngpio = bgc->bits;
> +       bgc->gc.request = bgpio_request;
>
>         ret = bgpio_setup_io(bgc, dat, set, clr);
>         if (ret)
> --
> 1.9.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
