From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH RFT] gpio: lp87565: Set proper output level and direction
 for direction_output
Date: Mon, 3 Jul 2017 11:10:36 +0530
Message-ID: <5380d587-98b1-8358-c3d4-3111c70ba4ca@ti.com>
References: <20170622092821.5508-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:62974 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750777AbdGCFkm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 01:40:42 -0400
In-Reply-To: <20170622092821.5508-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org



On Thursday 22 June 2017 02:58 PM, Axel Lin wrote:
> The value argument of lp87565_gpio_direction_output() means output level
> rather than gpio direction.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi Keerthy,
> I don't have this h/w, so please help to review and test it.

Axel,

Apologies for replying a bit late.


> Thanks,
> Axel
>  drivers/gpio/gpio-lp87565.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
> index 6313c50..69b69d4 100644
> --- a/drivers/gpio/gpio-lp87565.c
> +++ b/drivers/gpio/gpio-lp87565.c
> @@ -54,9 +54,12 @@ static int lp87565_gpio_direction_output(struct gpio_chip *chip,
>  {
>  	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
>  
> +	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
> +			   BIT(offset), value ? BIT(offset) : 0);
> +

Or just call:

lp87565_gpio_set(chip, offset, value);

Apart from the above comment.

Reviewed-by: Keerthy <j-keerthy@ti.com>
Tested-by: Keerthy <j-keerthy@ti.com>

Thanks,
Keerthy

>  	return regmap_update_bits(gpio->map,
>  				  LP87565_REG_GPIO_CONFIG,
> -				  BIT(offset), !value ? BIT(offset) : 0);
> +				  BIT(offset), BIT(offset));
>  }
>  
>  static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
> 
