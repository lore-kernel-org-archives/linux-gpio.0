From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 1/2] gpio/omap: Use devm_ioremap_resource()
Date: Fri, 14 Feb 2014 17:55:27 -0500
Message-ID: <52FE9EDF.2030509@ti.com>
References: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:44937 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752954AbaBNWzd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 14 Feb 2014 17:55:33 -0500
In-Reply-To: <000001cf279d$599a8000$0ccf8000$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Kevin Hilman' <khilman@deeprootsystems.com>

On Tuesday 11 February 2014 09:51 PM, Jingoo Han wrote:
> Use devm_ioremap_resource() in order to make the code simpler,
> and remove redundant return value check of platform_get_resource()
> because the value is checked by devm_ioremap_resource().
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>

>  drivers/gpio/gpio-omap.c |   20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 4243190..19b886c 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1214,24 +1214,10 @@ static int omap_gpio_probe(struct platform_device *pdev)
>  
>  	/* Static mapping, never released */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (unlikely(!res)) {
> -		dev_err(dev, "Invalid mem resource\n");
> -		irq_domain_remove(bank->domain);
> -		return -ENODEV;
> -	}
> -
> -	if (!devm_request_mem_region(dev, res->start, resource_size(res),
> -				     pdev->name)) {
> -		dev_err(dev, "Region already claimed\n");
> +	bank->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(bank->base)) {
>  		irq_domain_remove(bank->domain);
> -		return -EBUSY;
> -	}
> -
> -	bank->base = devm_ioremap(dev, res->start, resource_size(res));
> -	if (!bank->base) {
> -		dev_err(dev, "Could not ioremap\n");
> -		irq_domain_remove(bank->domain);
> -		return -ENOMEM;
> +		return PTR_ERR(bank->base);
>  	}
>  
>  	platform_set_drvdata(pdev, bank);
> 

