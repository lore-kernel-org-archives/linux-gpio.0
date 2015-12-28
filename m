From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 08/54] gpio: lpc32xx: Be sure to clamp return value
Date: Sun, 27 Dec 2015 20:11:40 -0800
Message-ID: <20151228041140.GG16437@tuxbot>
References: <1450793615-22239-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:35374 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbbL1ELp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 23:11:45 -0500
Received: by mail-pa0-f42.google.com with SMTP id ho8so1221950pac.2
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 20:11:44 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450793615-22239-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vz@mleia.com>

On Tue 22 Dec 06:13 PST 2015, Linus Walleij wrote:

> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: Roland Stigge <stigge@antcom.de>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-lpc32xx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
> index 47e2dde63734..e888b5fcd236 100644
> --- a/drivers/gpio/gpio-lpc32xx.c
> +++ b/drivers/gpio/gpio-lpc32xx.c
> @@ -288,21 +288,21 @@ static int lpc32xx_gpio_get_value_p012(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
>  
> -	return __get_gpio_state_p012(group, pin);
> +	return !!__get_gpio_state_p012(group, pin);
>  }
>  
>  static int lpc32xx_gpio_get_value_p3(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
>  
> -	return __get_gpio_state_p3(group, pin);
> +	return !!__get_gpio_state_p3(group, pin);
>  }
>  
>  static int lpc32xx_gpi_get_value(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
>  
> -	return __get_gpi_state_p3(group, pin);
> +	return !!__get_gpi_state_p3(group, pin);
>  }
>  
>  static int lpc32xx_gpio_dir_output_p012(struct gpio_chip *chip, unsigned pin,
> @@ -364,7 +364,7 @@ static int lpc32xx_gpo_get_value(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
>  
> -	return __get_gpo_state_p3(group, pin);
> +	return !!__get_gpo_state_p3(group, pin);
>  }
>  
>  static int lpc32xx_gpio_request(struct gpio_chip *chip, unsigned pin)

All of these ends with a "& 1"-operation, so this patch is not needed.

Regards,
Bjorn
