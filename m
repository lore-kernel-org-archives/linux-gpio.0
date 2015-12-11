From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 105/182] pinctrl: rockchip: use gpiochip data pointer
Date: Fri, 11 Dec 2015 12:41:35 +0100
Message-ID: <1775358.2vXvi2GDLK@diego>
References: <1449667938-2753-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:47354 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754724AbbLKLlh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Dec 2015 06:41:37 -0500
In-Reply-To: <1449667938-2753-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

Am Mittwoch, 9. Dezember 2015, 14:32:18 schrieb Linus Walleij:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looks nice, thanks for trying to keep gpio drivers clean

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index 2b88a40f61d3..56b8ce2a3df9
> 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -224,11 +224,6 @@ static struct regmap_config rockchip_regmap_config = {
>  	.reg_stride = 4,
>  };
> 
> -static inline struct rockchip_pin_bank *gc_to_pin_bank(struct gpio_chip
> *gc) -{
> -	return container_of(gc, struct rockchip_pin_bank, gpio_chip);
> -}
> -
>  static const inline struct rockchip_pin_group *pinctrl_name_to_group(
>  					const struct rockchip_pinctrl *info,
>  					const char *name)
> @@ -939,7 +934,7 @@ static int _rockchip_pmx_gpio_set_direction(struct
> gpio_chip *chip, unsigned long flags;
>  	u32 data;
> 
> -	bank = gc_to_pin_bank(chip);
> +	bank = gpiochip_get_data(chip);
> 
>  	ret = rockchip_set_mux(bank, pin, RK_FUNC_GPIO);
>  	if (ret < 0)
> @@ -1376,7 +1371,7 @@ static int rockchip_pinctrl_register(struct
> platform_device *pdev,
> 
>  static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int
> value) {
> -	struct rockchip_pin_bank *bank = gc_to_pin_bank(gc);
> +	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
>  	void __iomem *reg = bank->reg_base + GPIO_SWPORT_DR;
>  	unsigned long flags;
>  	u32 data;
> @@ -1400,7 +1395,7 @@ static void rockchip_gpio_set(struct gpio_chip *gc,
> unsigned offset, int value) */
>  static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset)
>  {
> -	struct rockchip_pin_bank *bank = gc_to_pin_bank(gc);
> +	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
>  	u32 data;
> 
>  	clk_enable(bank->clk);
> @@ -1439,7 +1434,7 @@ static int rockchip_gpio_direction_output(struct
> gpio_chip *gc, */
>  static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>  {
> -	struct rockchip_pin_bank *bank = gc_to_pin_bank(gc);
> +	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
>  	unsigned int virq;
> 
>  	if (!bank->domain)
> @@ -1758,7 +1753,7 @@ static int rockchip_gpiolib_register(struct
> platform_device *pdev, gc->of_node = bank->of_node;
>  		gc->label = bank->name;
> 
> -		ret = gpiochip_add(gc);
> +		ret = gpiochip_add_data(gc, bank);
>  		if (ret) {
>  			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: 
%d\n",
> gc->label, ret);

