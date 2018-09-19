From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 3/5] gpio: davinci: Allocate the correct amount of memory
 for controller
Date: Wed, 19 Sep 2018 10:32:16 +0530
Message-ID: <1cc3aa9b-a736-ee14-d414-8a2b1c4ea659@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
 <20180831191326.25106-3-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831191326.25106-3-afd@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



On Saturday 01 September 2018 12:43 AM, Andrew F. Davis wrote:
> Previously we created a controller structure per bank of GPIO pins. This
> has since been changed to one per controller, but the allocation size
> was not changed. Fix this here.
> 
> This also leaves the variable 'nbank' unused, instead of removing it,
> move it down and use it to clean up a loop. For loops with multiple
> initializers and/or iteration expressions, especially ones that don't
> use those loop counters are quite hard to follow, fix this.
> 

Tested for gpio interrupts on k2g and da850-lcdk

Tested-by: Keerthy <j-keerthy@ti.com>
Acked-by: Keerthy <j-keerthy@ti.com>

> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  drivers/gpio/gpio-davinci.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 14d1729927d3..121a7948f785 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -165,7 +165,7 @@ davinci_gpio_get_pdata(struct platform_device *pdev)
>  
>  static int davinci_gpio_probe(struct platform_device *pdev)
>  {
> -	int gpio, bank, i, ret = 0;
> +	int bank, i, ret = 0;
>  	unsigned int ngpio, nbank, nirq;
>  	struct davinci_gpio_controller *chips;
>  	struct davinci_gpio_platform_data *pdata;
> @@ -204,10 +204,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  	else
>  		nirq = DIV_ROUND_UP(ngpio, 16);
>  
> -	nbank = DIV_ROUND_UP(ngpio, 32);
> -	chips = devm_kcalloc(dev,
> -			     nbank, sizeof(struct davinci_gpio_controller),
> -			     GFP_KERNEL);
> +	chips = devm_kzalloc(dev, sizeof(*chips), GFP_KERNEL);
>  	if (!chips)
>  		return -ENOMEM;
>  
> @@ -247,7 +244,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>  #endif
>  	spin_lock_init(&chips->lock);
>  
> -	for (gpio = 0, bank = 0; gpio < ngpio; gpio += 32, bank++)
> +	nbank = DIV_ROUND_UP(ngpio, 32);
> +	for (bank = 0; bank < nbank; bank++)
>  		chips->regs[bank] = gpio_base + offset_array[bank];
>  
>  	ret = devm_gpiochip_add_data(dev, &chips->chip, chips);
> 
