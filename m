From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: trim userspace representation of "value" to 0/1
Date: Thu, 27 Mar 2014 12:52:29 +0900
Message-ID: <CAAVeFu+g-m8HFxEdXddRDu8uZAHAu=Ega4vCEcO=JLCrQuCuxw@mail.gmail.com>
References: <1395875378-28592-1-git-send-email-mhei@heimpold.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:49789 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751658AbaC0Dwu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Mar 2014 23:52:50 -0400
Received: by mail-ve0-f172.google.com with SMTP id jx11so3446748veb.31
        for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2014 20:52:49 -0700 (PDT)
In-Reply-To: <1395875378-28592-1-git-send-email-mhei@heimpold.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Heimpold <mhei@heimpold.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 27, 2014 at 8:09 AM, Michael Heimpold <mhei@heimpold.de> wrote:
> According to Documentation/gpio/sysfs.txt:
>   ...
>   "value" ... reads as either 0 (low) or 1 (high).
>
> Since some gpio implementations return non-zero if GPIO is set
> but not 1, filter the return value to fit the documentation.
>
> Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> ---
>  drivers/gpio/gpiolib.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 50c4922..45aa695 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -376,7 +376,7 @@ static ssize_t gpio_value_show(struct device *dev,
>         if (!test_bit(FLAG_EXPORT, &desc->flags))
>                 status = -EIO;
>         else
> -               status = sprintf(buf, "%d\n", gpiod_get_value_cansleep(desc));
> +               status = sprintf(buf, "%d\n", !!gpiod_get_value_cansleep(desc));

Patch 23600969ff137cf4c3bc9098f77e381de334e3f7 ("gpio: clamp returned
values to the boolean range") in -next already takes care of this at a
lower level, so I don't expect this to be needed?

Cheers,
Alex.
