From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPIOD: fix gpiod_direction_output initial value
Date: Thu, 1 May 2014 15:28:20 +0900
Message-ID: <CAAVeFu+vLibyz8nkfPRzbi6wMN058say-jVGH9zRFf+Gm1M3sw@mail.gmail.com>
References: <1398774442-2407-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:36538 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753701AbaEAG2l (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 1 May 2014 02:28:41 -0400
Received: by mail-vc0-f182.google.com with SMTP id lf12so3479779vcb.41
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2014 23:28:40 -0700 (PDT)
In-Reply-To: <1398774442-2407-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Apr 29, 2014 at 9:27 PM, Robert ABEL
<rabel@cit-ec.uni-bielefeld.de> wrote:
> gpiod_direction_output initial value was used as raw value instead of
> logical value. Convert value from logical to raw.

Nope, the very point of gpiod_direction_output_raw() is that we don't
want to alter the signal according to the active_low property. What
your change effectively does is changing gpiod_direction_output_raw()
into gpiod_direction_output() (look at the latter).

>
> Signed-off-by: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
> ---
>  drivers/gpio/gpiolib.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f48817d..2309322 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2032,6 +2032,10 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>                 return -EIO;
>         }
>
> +       /* convert logical value to raw value */
> +       if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
> +               value = !value;
> +
>         /* Open drain pin should not be driven to 1 */
>         if (value && test_bit(FLAG_OPEN_DRAIN,  &desc->flags))
>                 return gpiod_direction_input(desc);
> --
> 1.9.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
