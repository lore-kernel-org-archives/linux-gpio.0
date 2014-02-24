From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: twl4030: Remove redundant assignment
Date: Mon, 24 Feb 2014 15:25:15 +0100
Message-ID: <CACRpkdbfWhWj6CYJB96L3GS7HCuyL9DaBS5Lxgh424SYRHzp7A@mail.gmail.com>
References: <1392471277-16981-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:45842 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbaBXOZS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 09:25:18 -0500
Received: by mail-oa0-f48.google.com with SMTP id g12so481082oah.35
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 06:25:16 -0800 (PST)
In-Reply-To: <1392471277-16981-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Feb 15, 2014 at 2:34 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Variable "status" is never used, so remove it.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/gpio/gpio-twl4030.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
> index 8b88ca2..fa15beb 100644
> --- a/drivers/gpio/gpio-twl4030.c
> +++ b/drivers/gpio/gpio-twl4030.c
> @@ -139,7 +139,6 @@ static u8 cached_leden;
>  static void twl4030_led_set_value(int led, int value)
>  {
>         u8 mask = LEDEN_LEDAON | LEDEN_LEDAPWM;
> -       int status;
>
>         if (led)
>                 mask <<= 1;
> @@ -148,8 +147,9 @@ static void twl4030_led_set_value(int led, int value)
>                 cached_leden &= ~mask;
>         else
>                 cached_leden |= mask;
> -       status = twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
> -                                 TWL4030_LED_LEDEN_REG);
> +
> +       twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
> +                        TWL4030_LED_LEDEN_REG);

Isn't the right fix to actually *check* this status instead?

TI dudes?

Yours,
Linus Walleij
