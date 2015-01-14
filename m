From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: of: Correct error handling in of_get_named_gpiod_flags
Date: Wed, 14 Jan 2015 14:39:31 +0900
Message-ID: <CAAVeFu+R7pMiAKg08c4pCWQ+BGtzuGeuS+D6mmUd5RxryHxVpA@mail.gmail.com>
References: <1420792844-27781-1-git-send-email-hans.holmberg@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:53394 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715AbbANFjw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 00:39:52 -0500
Received: by mail-ig0-f171.google.com with SMTP id z20so20861792igj.4
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 21:39:51 -0800 (PST)
In-Reply-To: <1420792844-27781-1-git-send-email-hans.holmberg@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans Holmberg <hans.holmberg@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 9, 2015 at 5:40 PM, Hans Holmberg <hans.holmberg@intel.com> wrote:
> of_get_named_gpiod_flags fails with -EPROBE_DEFER in cases
> where the gpio chip is available and the GPIO translation fails.
>
> This causes drivers to be re-probed erroneusly, and hides the
> real problem(i.e. the GPIO number being out of range).
>
> Signed-off-by: Hans Holmberg <hans.holmberg@intel.com>
> ---
>  drivers/gpio/gpiolib-of.c |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 604dbe6..08261f2 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -45,8 +45,14 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
>                 return false;
>
>         ret = gc->of_xlate(gc, &gg_data->gpiospec, gg_data->flags);
> -       if (ret < 0)
> -               return false;
> +       if (ret < 0) {
> +               /* We've found the gpio chip, but the translation failed.
> +                * Return true to stop looking and return the translation
> +                * error via out_gpio
> +                */
> +               gg_data->out_gpio = ERR_PTR(ret);
> +               return true;
> +        }

Nice catch.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
