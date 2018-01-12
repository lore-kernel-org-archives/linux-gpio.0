From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: omap: Fix error path on chip init
Date: Fri, 12 Jan 2018 15:13:44 -0600
Message-ID: <7804f4c8-c9c3-ccd7-83b3-88b83fa6c518@ti.com>
References: <20180102102314.12906-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:52999 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965050AbeALVNr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jan 2018 16:13:47 -0500
In-Reply-To: <20180102102314.12906-1-linus.walleij@linaro.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Johan Hovold <johan@kernel.org>



On 01/02/2018 04:23 AM, Linus Walleij wrote:
> The error path was leaking a gpio_chip at one point.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


Sry, but this seems not in sync with gpio-next [1]

https://patchwork.kernel.org/patch/10060049/


> ---
>   drivers/gpio/gpio-omap.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index e136d666f1e5..d83e8624964a 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1104,7 +1104,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
>   					-1, 0, bank->width, 0);
>   	if (irq_base < 0) {
>   		dev_err(bank->chip.parent, "Couldn't allocate IRQ numbers\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto err_remove_chip;
>   	}
>   #endif
>   
> @@ -1122,8 +1123,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
>   	if (ret) {
>   		dev_err(bank->chip.parent,
>   			"Couldn't add irqchip to gpiochip %d\n", ret);
> -		gpiochip_remove(&bank->chip);
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto err_remove_chip;
>   	}
>   
>   	gpiochip_set_chained_irqchip(&bank->chip, irqc, bank->irq, NULL);
> @@ -1132,8 +1133,12 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
>   			       omap_gpio_irq_handler,
>   			       0, dev_name(bank->chip.parent), bank);
>   	if (ret)
> -		gpiochip_remove(&bank->chip);
> +		goto err_remove_chip;
>   
> +	return 0;
> +
> +err_remove_chip:
> +	gpiochip_remove(&bank->chip);
>   	return ret;
>   }
>   
> 

-- 
regards,
-grygorii
