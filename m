From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio: generic: add request function pointer
Date: Tue, 20 May 2014 15:49:24 +0900
Message-ID: <CAAVeFu+rVyV=_iPsGLxxUnvEMGR0_emmwZwj0VdPFzJi7bRBaw@mail.gmail.com>
References: <1400521754-4480-1-git-send-email-anthony.fee@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:38084 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699AbaETGto (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 May 2014 02:49:44 -0400
Received: by mail-ve0-f182.google.com with SMTP id sa20so45329veb.13
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2014 23:49:44 -0700 (PDT)
In-Reply-To: <1400521754-4480-1-git-send-email-anthony.fee@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anthony Fee <anthony.fee@emutex.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 20, 2014 at 2:49 AM, Anthony Fee <anthony.fee@emutex.com> wrote:
> gpiolib will require all gpio drivers to expicitly set the request function pointer
> in future. To encourage gpio driver developers to adhere to this standard
> gpio-generic.c now sets this function pointer.

This one applies. ;)

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

(btw, please carry the acks you received to the next revisions of your
patches, that will be that much that the maintainer does not need to
do).

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
> @@ -388,6 +388,14 @@ static int bgpio_setup_direction(struct bgpio_chip *bgc,
>         return 0;
>  }
>
> +static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
> +{
> +       if (gpio_pin < chip->ngpio)
> +               return 0;
> +
> +       return -EINVAL;

Nit: I might have preferred it turned that way:

    if (gpio_pin >= chip->ngpio)
            return -EINVAL;

    return 0;

That makes the error case the exception and the success case the
default, which looks more natural to me. But the statement is simple
enough to be easily understood anyway.

> +}
> +
>  int bgpio_remove(struct bgpio_chip *bgc)
>  {
>         return gpiochip_remove(&bgc->gc);
> @@ -413,6 +421,7 @@ int bgpio_init(struct bgpio_chip *bgc, struct device *dev,
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
