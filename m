From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] pinctrl: sx150x: various spelling fixes and some
 white-space cleanup
Date: Wed, 23 Nov 2016 10:13:19 +0100
Message-ID: <5b11095c-e7f0-d675-67f3-4453bf16a2bd@baylibre.com>
References: <1479830762-1839-1-git-send-email-peda@axentia.se>
 <1479830762-1839-2-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479830762-1839-2-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 11/22/2016 05:06 PM, Peter Rosin wrote:
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/pinctrl/pinctrl-sx150x.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 63778058eec7..ef4ef88e0ee9 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -384,7 +384,7 @@ static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
>  }
>  
>  static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			       int value)
> +			    int value)
>  {
>  	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>  
> @@ -396,7 +396,7 @@ static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>  }
>  
>  static int sx150x_gpio_direction_input(struct gpio_chip *chip,
> -				      unsigned int offset)
> +				       unsigned int offset)
>  {
>  	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>  
> @@ -409,7 +409,7 @@ static int sx150x_gpio_direction_input(struct gpio_chip *chip,
>  }
>  
>  static int sx150x_gpio_direction_output(struct gpio_chip *chip,
> -				       unsigned int offset, int value)
> +					unsigned int offset, int value)
>  {
>  	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>  	int ret;
> @@ -880,7 +880,7 @@ static unsigned int sx150x_maybe_swizzle(struct sx150x_pinctrl *pctl,
>  	 *	reg + 3 [ 3 3 2 2 1 1 0 0 ]
>  	 *
>  	 * SX1503 and SX1506 deviate from that data layout, instead storing
> -	 * thier contents as follows:
> +	 * their contents as follows:
>  	 *
>  	 *	reg     [ f f e e d d c c ]
>  	 *	reg + 1 [ 7 7 6 6 5 5 4 4 ]
> @@ -915,9 +915,8 @@ static unsigned int sx150x_maybe_swizzle(struct sx150x_pinctrl *pctl,
>   *
>   * This way the rest of the driver code, interfacing with the chip via
>   * regmap API, can work assuming that each GPIO pin is represented by
> - * a group of bits at an offset proportioan to GPIO number within a
> + * a group of bits at an offset proportional to GPIO number within a
>   * given register.
> - *
>   */
>  static int sx150x_regmap_reg_read(void *context, unsigned int reg,
>  				  unsigned int *result)
> @@ -929,7 +928,7 @@ static int sx150x_regmap_reg_read(void *context, unsigned int reg,
>  	unsigned int idx, val;
>  
>  	/*
> -	 * There are four potential cases coverd by this function:
> +	 * There are four potential cases covered by this function:
>  	 *
>  	 * 1) 8-pin chip, single configuration bit register
>  	 *
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
