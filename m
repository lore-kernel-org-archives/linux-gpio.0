From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] gpio: gpio-dwapb: add optional reset
Date: Thu, 12 Oct 2017 10:18:31 +0200
Message-ID: <1507796311.5084.1.camel@pengutronix.de>
References: <20171011163444.2989-1-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:35013 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752615AbdJLISe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Oct 2017 04:18:34 -0400
In-Reply-To: <20171011163444.2989-1-atull@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2017-10-11 at 11:34 -0500, Alan Tull wrote:
> Some platforms require reset to be released to allow register
> access.
> 
> Signed-off-by: Alan Tull <atull@kernel.org>
> ---
> v2: Request shared controller
>     return all errors from reset controller request
>     drop conditions on asserting/deasserting reset

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Could you also update the device tree binding docs [1] to mention the
optional resets phandle?

[1] Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt

regards
Philipp

> ---
>  drivers/gpio/gpio-dwapb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index f051c45..0df8cdf 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -25,6 +25,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  #include <linux/spinlock.h>
>  #include <linux/platform_data/gpio-dwapb.h>
>  #include <linux/slab.h>
> @@ -97,6 +98,7 @@ struct dwapb_gpio {
>  	unsigned int		nr_ports;
>  	struct irq_domain	*domain;
>  	unsigned int		flags;
> +	struct reset_control	*rst;
>  };
>  
>  static inline u32 gpio_reg_v2_convert(unsigned int offset)
> @@ -608,6 +610,12 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
>  	gpio->dev = &pdev->dev;
>  	gpio->nr_ports = pdata->nports;
>  
> +	gpio->rst = devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(gpio->rst))
> +		return PTR_ERR(gpio->rst);
> +
> +	reset_control_deassert(gpio->rst);
> +
>  	gpio->ports = devm_kcalloc(&pdev->dev, gpio->nr_ports,
>  				   sizeof(*gpio->ports), GFP_KERNEL);
>  	if (!gpio->ports)
> @@ -659,6 +667,7 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
>  
>  	dwapb_gpio_unregister(gpio);
>  	dwapb_irq_teardown(gpio);
> +	reset_control_assert(gpio->rst);
>  
>  	return 0;
>  }
