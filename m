From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 2/2] gpio: tb10x: Convert to use module_platform_driver
Date: Thu, 31 Oct 2013 13:41:37 +0100
Message-ID: <20131031124136.GB7093@ab42.lan>
References: <1383184905.13635.1.camel@phoenix>
 <1383184982.13635.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.abilis.ch ([195.70.19.74]:16630 "EHLO mail.abilis.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754373Ab3JaNSH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Oct 2013 09:18:07 -0400
Content-Disposition: inline
In-Reply-To: <1383184982.13635.3.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, linux-gpio@vger.kernel.org

On Thu, Oct 31, 2013 at 10:03:02AM +0800, Axel Lin wrote:
> Use module_platform_driver to simplify the code.
> In additional, this is a DT only driver, thus also remove of_match_ptr.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Christian Ruppert <christian.ruppert@abilis.com>

> ---
>  drivers/gpio/gpio-tb10x.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 45bfed1..a0391bc 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -311,23 +311,13 @@ static struct platform_driver tb10x_gpio_driver = {
>  	.remove		= tb10x_gpio_remove,
>  	.driver = {
>  		.name	= "tb10x-gpio",
> -		.of_match_table = of_match_ptr(tb10x_gpio_dt_ids),
> +		.of_match_table = tb10x_gpio_dt_ids,
>  		.owner	= THIS_MODULE,
>  	}
>  };
>  
> -static int __init ab_gpio_init(void)
> -{
> -	return platform_driver_register(&tb10x_gpio_driver);
> -}
> -
> -static void __exit ab_gpio_exit(void)
> -{
> -	platform_driver_unregister(&tb10x_gpio_driver);
> -}
> +module_platform_driver(tb10x_gpio_driver);
>  
> -module_init(ab_gpio_init);
> -module_exit(ab_gpio_exit);
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("tb10x gpio.");
>  MODULE_VERSION("0.0.1");
> -- 
> 1.8.1.2
> 
> 
> 
