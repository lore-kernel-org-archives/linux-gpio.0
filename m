From: christian.ruppert@alitech.com
Subject: Re: [PATCH] gpio: tb10x: Drop unneeded free_irq() call
Date: Thu, 28 May 2015 14:45:52 +0200
Message-ID: <OF9121DD21.2AC94E3D-ONC1257E53.0045F58B-C1257E53.0045F345@alitech.com>
References: <1432805170.22632.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nopam.alitech.com ([202.3.176.31]:19217 "EHLO nopam.alitech.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752213AbbE1NMA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 May 2015 09:12:00 -0400
In-Reply-To: <1432805170.22632.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Axel Lin <axel.lin@ingics.com> wrote on 05/28/2015 11:26:10 AM:
> 
> Current code uses devm_request_irq() in .probe, so drop the unneeded
> free_irq() call in .remove.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Christian Ruppert <christian.ruppert@alitech.com>

> ---
>  drivers/gpio/gpio-tb10x.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 46b8961..12c99d9 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -292,7 +292,6 @@ static int tb10x_gpio_remove(struct platform_device 
*pdev)
>                 BIT(tb10x_gpio->gc.ngpio) - 1, 0, 0);
>        kfree(tb10x_gpio->domain->gc);
>        irq_domain_remove(tb10x_gpio->domain);
> -      free_irq(tb10x_gpio->irq, tb10x_gpio);
>     }
>     gpiochip_remove(&tb10x_gpio->gc);
> 
> -- 
> 2.1.0
> 
> 
> 


