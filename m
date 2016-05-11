From: Andreas Werner <andy@wernerandy.de>
Subject: Re: [PATCH] gpio: menz127: use the new open drain callback
Date: Wed, 11 May 2016 19:39:55 +0200
Message-ID: <20160511173955.GA3574@linux-ah44>
References: <1460231815-8635-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:42437 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752008AbcEKRkK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 13:40:10 -0400
Content-Disposition: inline
In-Reply-To: <1460231815-8635-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Sat, Apr 09, 2016 at 09:56:55PM +0200, Linus Walleij wrote:
> The menz127 driver tries to support open drain by detecting it
> at request time. However: without the new callbacks from the
> gpiolib it is not really working: the core will still just emulate
> the open drain mode by switching the line to an input.
> 
> By adding a hook into the new .set_single_ended() call rather than
> trying to autodetect at request() time, proper open drain can be
> supported.
> 
> Cc: Andreas Werner <andy@wernerandy.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-menz127.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
> index 8c1ab8e1974f..334fe270dcf1 100644
> --- a/drivers/gpio/gpio-menz127.c
> +++ b/drivers/gpio/gpio-menz127.c
> @@ -88,21 +88,25 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
>  	return 0;
>  }
>  
> -static int men_z127_request(struct gpio_chip *gc, unsigned gpio_pin)
> +static int men_z127_set_single_ended(struct gpio_chip *gc,
> +				     unsigned offset,
> +				     enum single_ended_mode mode)
>  {
>  	struct men_z127_gpio *priv = gpiochip_get_data(gc);
>  	u32 od_en;
>  
> -	if (gpio_pin >= gc->ngpio)
> -		return -EINVAL;
> +	if (mode != LINE_MODE_OPEN_DRAIN &&
> +	    mode != LINE_MODE_PUSH_PULL)
> +		return -ENOTSUPP;
>  
>  	spin_lock(&priv->lock);
>  	od_en = readl(priv->reg_base + MEN_Z127_ODER);
>  
> -	if (gpiochip_line_is_open_drain(gc, gpio_pin))
> -		od_en |= BIT(gpio_pin);
> +	if (mode == LINE_MODE_OPEN_DRAIN)
> +		od_en |= BIT(offset);
>  	else
> -		od_en &= ~BIT(gpio_pin);
> +		/* Implicitly LINE_MODE_PUSH_PULL */
> +		od_en &= ~BIT(offset);
>  
>  	writel(od_en, priv->reg_base + MEN_Z127_ODER);
>  	spin_unlock(&priv->lock);
> @@ -147,7 +151,7 @@ static int men_z127_probe(struct mcb_device *mdev,
>  		goto err_unmap;
>  
>  	men_z127_gpio->gc.set_debounce = men_z127_debounce;
> -	men_z127_gpio->gc.request = men_z127_request;
> +	men_z127_gpio->gc.set_single_ended = men_z127_set_single_ended;
>  
>  	ret = gpiochip_add_data(&men_z127_gpio->gc, men_z127_gpio);
>  	if (ret) {
> -- 
> 2.4.3
> 

Hi Linus,
sorry for the late answer.

I will try to get the hardware and will test the patch.

I think this is exactly what I need to support the "real" open drain
mode.

Regards
Andy

