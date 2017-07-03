From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v2] gpio: lp87565: Set proper output level and direction
 for direction_output
Date: Mon, 3 Jul 2017 14:02:21 +0530
Message-ID: <71921231-e7b9-bb95-272f-afa0c80867a0@ti.com>
References: <20170703082812.23444-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:54525 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752795AbdGCIdF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 04:33:05 -0400
In-Reply-To: <20170703082812.23444-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org



On Monday 03 July 2017 01:58 PM, Axel Lin wrote:
> The value argument of lp87565_gpio_direction_output() means output level
> rather than gpio direction.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Reviewed-by: Keerthy <j-keerthy@ti.com>
> Tested-by: Keerthy <j-keerthy@ti.com>
> ---
> v2: Call lp87565_gpio_set() instead of open-coded.
> I move lp87565_gpio_get/lp87565_gpio_set functions up to avoid forward
> declaration. It's fine to only move lp87565_gpio_set() but it looks better
> for me to move lp87565_gpio_get/lp87565_gpio_set together.
> Hope this change is fine.

Looks good to me.

> 
>  drivers/gpio/gpio-lp87565.c | 46 +++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
> index 6313c50..a121c8f 100644
> --- a/drivers/gpio/gpio-lp87565.c
> +++ b/drivers/gpio/gpio-lp87565.c
> @@ -26,6 +26,27 @@ struct lp87565_gpio {
>  	struct regmap *map;
>  };
>  
> +static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
> +	int ret, val;
> +
> +	ret = regmap_read(gpio->map, LP87565_REG_GPIO_IN, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val & BIT(offset));
> +}
> +
> +static void lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			     int value)
> +{
> +	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
> +
> +	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
> +			   BIT(offset), value ? BIT(offset) : 0);
> +}
> +
>  static int lp87565_gpio_get_direction(struct gpio_chip *chip,
>  				      unsigned int offset)
>  {
> @@ -54,30 +75,11 @@ static int lp87565_gpio_direction_output(struct gpio_chip *chip,
>  {
>  	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
>  
> +	lp87565_gpio_set(chip, offset, value);
> +
>  	return regmap_update_bits(gpio->map,
>  				  LP87565_REG_GPIO_CONFIG,
> -				  BIT(offset), !value ? BIT(offset) : 0);
> -}
> -
> -static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
> -{
> -	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
> -	int ret, val;
> -
> -	ret = regmap_read(gpio->map, LP87565_REG_GPIO_IN, &val);
> -	if (ret < 0)
> -		return ret;
> -
> -	return !!(val & BIT(offset));
> -}
> -
> -static void lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			     int value)
> -{
> -	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
> -
> -	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
> -			   BIT(offset), value ? BIT(offset) : 0);
> +				  BIT(offset), BIT(offset));
>  }
>  
>  static int lp87565_gpio_request(struct gpio_chip *gc, unsigned int offset)
> 
