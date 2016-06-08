From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH 9/9] pinctrl: at91-pio4: make it explicitly non-modular
Date: Wed, 8 Jun 2016 08:27:24 +0200
Message-ID: <20160608062724.GF373@odux.rfo.atmel.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
 <1465267388-17884-10-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:48800 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932066AbcFHG1Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 02:27:25 -0400
Content-Disposition: inline
In-Reply-To: <1465267388-17884-10-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Mon, Jun 06, 2016 at 10:43:08PM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/pinctrl/Kconfig:config PINCTRL_AT91PIO4
> drivers/pinctrl/Kconfig:        bool "AT91 PIO4 pinctrl driver"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks for cleaning this stuff.
Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index a025b40d246b..4438dca85c1c 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -20,7 +20,7 @@
>  #include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -879,7 +879,6 @@ static const struct of_device_id atmel_pctrl_of_match[] = {
>  		/* sentinel */
>  	}
>  };
> -MODULE_DEVICE_TABLE(of, atmel_pctrl_of_match);
>  
>  static int atmel_pinctrl_probe(struct platform_device *pdev)
>  {
> @@ -1074,28 +1073,13 @@ clk_prepare_enable_error:
>  	return ret;
>  }
>  
> -int atmel_pinctrl_remove(struct platform_device *pdev)
> -{
> -	struct atmel_pioctrl *atmel_pioctrl = platform_get_drvdata(pdev);
> -
> -	irq_domain_remove(atmel_pioctrl->irq_domain);
> -	clk_disable_unprepare(atmel_pioctrl->clk);
> -	gpiochip_remove(atmel_pioctrl->gpio_chip);
> -
> -	return 0;
> -}
> -
>  static struct platform_driver atmel_pinctrl_driver = {
>  	.driver = {
>  		.name = "pinctrl-at91-pio4",
>  		.of_match_table = atmel_pctrl_of_match,
>  		.pm = &atmel_pctrl_pm_ops,
> +		.suppress_bind_attrs = true,
>  	},
>  	.probe = atmel_pinctrl_probe,
> -	.remove = atmel_pinctrl_remove,
>  };
> -module_platform_driver(atmel_pinctrl_driver);
> -
> -MODULE_AUTHOR(Ludovic Desroches <ludovic.desroches@atmel.com>);
> -MODULE_DESCRIPTION("Atmel PIO4 pinctrl driver");
> -MODULE_LICENSE("GPL v2");
> +builtin_platform_driver(atmel_pinctrl_driver);
> -- 
> 2.8.0
> 
