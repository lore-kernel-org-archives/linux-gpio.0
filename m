From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 09/54] gpio: max732x: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:46:26 +0100
Message-ID: <201512221546.26558.marex@denx.de>
References: <1450793650-22300-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:40900 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752270AbbLVO7s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:59:48 -0500
In-Reply-To: <1450793650-22300-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Semen Protsenko <semen.protsenko@globallogic.com>, Nicholas Krause <xerofoify@gmail.com>

On Tuesday, December 22, 2015 at 03:14:10 PM, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Also start to propagate the error code here as the end of the
> series fixes this to work for all drivers.
> 
> Cc: Nicholas Krause <xerofoify@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Semen Protsenko <semen.protsenko@globallogic.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I see nothing obviously wrong with the patch:

Reviewed-by: Marek Vasut <marex@denx.de>

> ---
>  drivers/gpio/gpio-max732x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index a1094984b666..880ce94e6077 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -207,9 +207,9 @@ static int max732x_gpio_get_value(struct gpio_chip *gc,
> unsigned off)
> 
>  	ret = max732x_readb(chip, is_group_a(chip, off), &reg_val);
>  	if (ret < 0)
> -		return 0;
> +		return ret;
> 
> -	return reg_val & (1u << (off & 0x7));
> +	return !!(reg_val & (1u << (off & 0x7)));
>  }
> 
>  static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int
> mask,

Best regards,
Marek Vasut
