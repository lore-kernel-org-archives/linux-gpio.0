From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/2] gpio: tb10x: Fix checking return value of
 devm_ioremap_resource
Date: Thu, 31 Oct 2013 13:40:39 +0100
Message-ID: <20131031124037.GA7093@ab42.lan>
References: <1383184905.13635.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.abilis.ch ([195.70.19.74]:16630 "EHLO mail.abilis.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754375Ab3JaNSI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Oct 2013 09:18:08 -0400
Content-Disposition: inline
In-Reply-To: <1383184905.13635.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, linux-gpio@vger.kernel.org

On Thu, Oct 31, 2013 at 10:01:45AM +0800, Axel Lin wrote:
> Also move platform_get_resource() call close to devm_ioremap_resource().
> The implementation of devm_ioremap_resource() will also check mem parameter
> and emit proper error.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Christian Ruppert <christian.ruppert@abilis.com>

> ---
>  drivers/gpio/gpio-tb10x.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 833d0f4..45bfed1 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -194,23 +194,16 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
>  	if (of_property_read_u32(dn, "abilis,ngpio", &ngpio))
>  		return -EINVAL;
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!mem) {
> -		dev_err(&pdev->dev, "No memory resource defined.\n");
> -		return -EINVAL;
> -	}
> -
>  	tb10x_gpio = devm_kzalloc(&pdev->dev, sizeof(*tb10x_gpio), GFP_KERNEL);
>  	if (tb10x_gpio == NULL)
>  		return -ENOMEM;
>  
>  	spin_lock_init(&tb10x_gpio->spinlock);
>  
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	tb10x_gpio->base = devm_ioremap_resource(&pdev->dev, mem);
> -	if (!tb10x_gpio->base) {
> -		dev_err(&pdev->dev, "Could not remap reg space.\n");
> -		goto fail_ioremap;
> -	}
> +	if (IS_ERR(tb10x_gpio->base))
> +		return PTR_ERR(tb10x_gpio->base);
>  
>  	tb10x_gpio->gc.label		= of_node_full_name(dn);
>  	tb10x_gpio->gc.dev		= &pdev->dev;
> @@ -285,7 +278,6 @@ fail_request_irq:
>  fail_get_irq:
>  	gpiochip_remove(&tb10x_gpio->gc);
>  fail_gpiochip_registration:
> -fail_ioremap:
>  	return ret;
>  }
>  
> -- 
> 1.8.1.2
> 
> 
> 
