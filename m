From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 156/182] input: adp5589-keys: use gpiochip data pointer
Date: Wed, 16 Dec 2015 14:07:59 -0800
Message-ID: <20151216220759.GC10962@dtor-ws>
References: <1449668710-5785-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:33929 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754929AbbLPWIC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 17:08:02 -0500
Received: by mail-pa0-f52.google.com with SMTP id wq6so30331915pac.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2015 14:08:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668710-5785-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Michael Hennerich <michael.hennerich@analog.com>

On Wed, Dec 09, 2015 at 02:45:10PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Dmitry: please ACK this so I can take it through the GPIO tree.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/keyboard/adp5589-keys.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> index 4d446d5085aa..0b72345cf7b6 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -387,7 +387,7 @@ static int adp5589_write(struct i2c_client *client, u8 reg, u8 val)
>  #ifdef CONFIG_GPIOLIB
>  static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
>  {
> -	struct adp5589_kpad *kpad = container_of(chip, struct adp5589_kpad, gc);
> +	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
>  	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
>  	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
>  
> @@ -399,7 +399,7 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
>  static void adp5589_gpio_set_value(struct gpio_chip *chip,
>  				   unsigned off, int val)
>  {
> -	struct adp5589_kpad *kpad = container_of(chip, struct adp5589_kpad, gc);
> +	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
>  	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
>  	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
>  
> @@ -418,7 +418,7 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
>  
>  static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
>  {
> -	struct adp5589_kpad *kpad = container_of(chip, struct adp5589_kpad, gc);
> +	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
>  	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
>  	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
>  	int ret;
> @@ -438,7 +438,7 @@ static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
>  static int adp5589_gpio_direction_output(struct gpio_chip *chip,
>  					 unsigned off, int val)
>  {
> -	struct adp5589_kpad *kpad = container_of(chip, struct adp5589_kpad, gc);
> +	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
>  	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
>  	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
>  	int ret;
> @@ -525,7 +525,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
>  
>  	mutex_init(&kpad->gpio_lock);
>  
> -	error = gpiochip_add(&kpad->gc);
> +	error = gpiochip_add_data(&kpad->gc, kpad);
>  	if (error) {
>  		dev_err(dev, "gpiochip_add failed, err: %d\n", error);
>  		return error;
> -- 
> 2.4.3
> 

-- 
Dmitry
