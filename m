From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] gpio: pca953x: fix gpio input on gpio offsets >= 8
Date: Mon, 12 Aug 2013 12:27:49 +0200
Message-ID: <5208B8A5.3030702@free-electrons.com>
References: <20130807215240.GA31924@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:53311 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753030Ab3HLK14 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2013 06:27:56 -0400
In-Reply-To: <20130807215240.GA31924@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Ruder <andy@aeruder.net>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

On 07/08/2013 23:52, Andrew Ruder wrote:
> This change fixes a regression introduced by commit
> f5f0b7aa8 (gpio: pca953x: make the register access by GPIO bank)
> 
> When the pca953x driver was converted to using 8-bit reads/writes
> the bitmask in pca953x_gpio_get_value wasn't adjusted with a
> modulus BANK_SZ and consequently looks at the wrong bits in the
> input register.

Good catch. I forgot this one and as on my board I wasn't able to
test the input I didn't noticed it.
Thanks

Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>


> 
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
> ---
> 
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 426c51d..1a7ab13 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -308,7 +308,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
>  		return 0;
>  	}
>  
> -	return (reg_val & (1u << off)) ? 1 : 0;
> +	return (reg_val & (1u << (off % BANK_SZ))) ? 1 : 0;
>  }
>  
>  static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
