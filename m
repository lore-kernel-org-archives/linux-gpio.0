From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/4] gpio: davinci: Handle the return value of
 davinci_gpio_irq_setup function
Date: Wed, 19 Jul 2017 13:10:00 +0200
Message-ID: <20170719111000.GX29638@localhost>
References: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
 <1500375436-9435-3-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33840 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752500AbdGSLJx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2017 07:09:53 -0400
Content-Disposition: inline
In-Reply-To: <1500375436-9435-3-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: linus.walleij@linaro.org, ssantosh@kernel.org, devicetree@vger.kernel.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, fcooper@ti.com

On Tue, Jul 18, 2017 at 04:27:14PM +0530, Keerthy wrote:
> Currently davinci_gpio_irq_setup return value is ignored. Handle the
> return value appropriately.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  drivers/gpio/gpio-davinci.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 2c88054..932f270 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -233,15 +233,23 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  		chips->regs[bank] = gpio_base + offset_array[bank];
>  
>  	ret = devm_gpiochip_add_data(dev, &chips->chip, chips);
> +	if (ret)
> +		goto err;
> +
> +	platform_set_drvdata(pdev, chips);
> +	ret = davinci_gpio_irq_setup(pdev);
>  	if (ret) {
> -		ctrl_num = 0;
> -		bank_base = 0;
> -		return ret;
> +		platform_set_drvdata(pdev, NULL);
> +		goto err;
>  	}
>  
> -	platform_set_drvdata(pdev, chips);
> -	davinci_gpio_irq_setup(pdev);
>  	return 0;

There's a separate but related bug here too as the clk_prepare_enable()
in davinci_gpio_irq_setup() is never balanced on driver unbind.

Johan
