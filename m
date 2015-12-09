From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 014/182] gpio: arizona: use gpiochip data pointer
Date: Wed, 9 Dec 2015 13:42:39 +0000
Message-ID: <1449668559.17838.1.camel@rf-debian.wolfsonmicro.main>
References: <1449666878-30404-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:54706 "EHLO
	mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754083AbbLINnO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:43:14 -0500
In-Reply-To: <1449666878-30404-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>

On Wed, 2015-12-09 at 14:14 +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-arizona.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
> index 412d131b513d..c729fee1dcdf 100644
> --- a/drivers/gpio/gpio-arizona.c
> +++ b/drivers/gpio/gpio-arizona.c
> @@ -28,14 +28,9 @@ struct arizona_gpio {
>  	struct gpio_chip gpio_chip;
>  };
>  
> -static inline struct arizona_gpio *to_arizona_gpio(struct gpio_chip *chip)
> -{
> -	return container_of(chip, struct arizona_gpio, gpio_chip);
> -}
> -
>  static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
>  {
> -	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
> +	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
>  	struct arizona *arizona = arizona_gpio->arizona;
>  
>  	return regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
> @@ -44,7 +39,7 @@ static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
>  
>  static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
> -	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
> +	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
>  	struct arizona *arizona = arizona_gpio->arizona;
>  	unsigned int val;
>  	int ret;
> @@ -62,7 +57,7 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
>  static int arizona_gpio_direction_out(struct gpio_chip *chip,
>  				     unsigned offset, int value)
>  {
> -	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
> +	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
>  	struct arizona *arizona = arizona_gpio->arizona;
>  
>  	if (value)
> @@ -74,7 +69,7 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
>  
>  static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>  {
> -	struct arizona_gpio *arizona_gpio = to_arizona_gpio(chip);
> +	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
>  	struct arizona *arizona = arizona_gpio->arizona;
>  
>  	if (value)
> @@ -133,7 +128,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
>  	else
>  		arizona_gpio->gpio_chip.base = -1;
>  
> -	ret = gpiochip_add(&arizona_gpio->gpio_chip);
> +	ret = gpiochip_add_data(&arizona_gpio->gpio_chip, arizona_gpio);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
>  			ret);

Looks ok.

Reviewed-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

