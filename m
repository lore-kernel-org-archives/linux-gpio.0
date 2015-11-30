From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2] gpiolib: return 0 or 1 in gpiod_get_value*() functions
Date: Mon, 30 Nov 2015 12:05:49 -0800
Message-ID: <CAJAp7OhsnS_ysO9W4Ordm+UTjvcoyYht1zR9yLqgcdto8C175A@mail.gmail.com>
References: <1448904631-30230-1-git-send-email-Jose.DiazdeGrenudePedro@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34014 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751587AbbK3UFv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 15:05:51 -0500
Received: by lffu14 with SMTP id u14so212769849lff.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 12:05:50 -0800 (PST)
In-Reply-To: <1448904631-30230-1-git-send-email-Jose.DiazdeGrenudePedro@digi.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jose Diaz de Grenu de Pedro <Jose.DiazdeGrenudePedro@digi.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, hector.palacios@digi.com

On Mon, Nov 30, 2015 at 9:30 AM, Jose Diaz de Grenu de Pedro
<Jose.DiazdeGrenudePedro@digi.com> wrote:
> Commit 79a9becda894 moved the awareness of active low state
> into the gpiod_get_value*() functions, but it only inverts the
> GPIO's raw value when it is active low. If the GPIO is active
> high, the gpiod_get_value*() functions return the raw value of
> the register, which can be any positive value.
>
> This patch does a double inversion when the GPIO is active high
> to make sure either 0 or 1 is returned by these functions.
>
> Signed-off-by: Jose Diaz de Grenu de Pedro <Jose.DiazdeGrenudePedro@digi.com>
> Signed-off-by: Hector Palacios <hector.palacios@digi.com>
> ---
> change in v2:
>  - add missing semicolon
> ---
>  drivers/gpio/gpiolib.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 50c4922fe53a..bd96f0457ba8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1981,9 +1981,9 @@ int gpiod_get_value(const struct gpio_desc *desc)
>
>         value = _gpiod_get_raw_value(desc);
>         if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
> -               value = !value;
> -
> -       return value;
> +               return !value;
> +       else
> +               return !!value;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_get_value);

On linux-next (at least) _gpiod_get_raw_value() returns the following value:

value = value < 0 ? value : !!value;

So this should already be negative errno, 0 or 1.

Regards,
Bjorn
