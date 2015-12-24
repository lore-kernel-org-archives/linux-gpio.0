From: Sonic Zhang <sonic.adi@gmail.com>
Subject: Re: [PATCH 34/54] blackfin: gpio: Be sure to clamp return value
Date: Thu, 24 Dec 2015 17:06:59 +0800
Message-ID: <CAJxxZ0MeHF0wraVj7XRjb85bWawOSULZ356C67W0gnmEWABbag@mail.gmail.com>
References: <1450795086-27238-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:33204 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752944AbbLXJHB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2015 04:07:01 -0500
Received: by mail-qg0-f52.google.com with SMTP id k90so170555318qge.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2015 01:07:00 -0800 (PST)
In-Reply-To: <1450795086-27238-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sonic Zhang <sonic.zhang@analog.com>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net

Acked-by: Sonic Zhang <sonic.zhang@analog.com>

On Tue, Dec 22, 2015 at 10:38 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
>
> Cc: Sonic Zhang <sonic.zhang@analog.com>
> Cc: Steven Miao <realmz6@gmail.com>
> Cc: adi-buildroot-devel@lists.sourceforge.net
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Blackfin folks: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.
> ---
>  arch/blackfin/kernel/bfin_gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/blackfin/kernel/bfin_gpio.c b/arch/blackfin/kernel/bfin_gpio.c
> index a017359c1826..84baa6217c03 100644
> --- a/arch/blackfin/kernel/bfin_gpio.c
> +++ b/arch/blackfin/kernel/bfin_gpio.c
> @@ -1159,7 +1159,7 @@ static int bfin_gpiolib_direction_output(struct gpio_chip *chip, unsigned gpio,
>
>  static int bfin_gpiolib_get_value(struct gpio_chip *chip, unsigned gpio)
>  {
> -       return bfin_gpio_get_value(gpio);
> +       return !!bfin_gpio_get_value(gpio);
>  }
>
>  static void bfin_gpiolib_set_value(struct gpio_chip *chip, unsigned gpio, int value)
> --
> 2.4.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
