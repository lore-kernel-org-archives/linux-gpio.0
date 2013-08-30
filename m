From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] gpio: improve error path in gpiolib
Date: Fri, 30 Aug 2013 13:28:44 -0700
Message-ID: <5221007C.8090605@gmail.com>
References: <1377848795-28070-1-git-send-email-linus.walleij@linaro.org> <5220E6F6.5080006@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:35347 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754280Ab3H3U2s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2013 16:28:48 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz10so2771097pad.16
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2013 13:28:48 -0700 (PDT)
In-Reply-To: <5220E6F6.5080006@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Tim Bird <tbird20d@gmail.com>, linux-gpio@vger.kernel.org, acourbot@nvidia.com

Linus,

The patch looks good, except for one issue (noted inline).

Reviewed-by: Frank Rowand <frank.rowand@sonymobile.com>

-Frank


> -------- Original Message --------
> Subject: [PATCH] gpio: improve error path in gpiolib
> Date: Fri, 30 Aug 2013 09:46:35 +0200
> From: Linus Walleij <linus.walleij@linaro.org>
> To: linux-gpio@vger.kernel.org
> CC: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij
> <linus.walleij@linaro.org>, Frank Rowand <frank.rowand@sonymobile.com>,
> Tim Bird <tim.bird@sonymobile.com>
> 
> At several places the gpiolib will proceed to handle a GPIO
> descriptor even if it's ->chip member is NULL and no gpiochip
> is associated.
> 
> Fix this by checking that both the descriptor cookie *and*
> the chip pointer are valid.
> 
> Also bail out earlier with more specific diagnostic messages
> on missing operations for setting as input/output or debounce.
> 
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Frank Rowand <frank.rowand@sonymobile.com>
> Cc: Tim Bird <tim.bird@sonymobile.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d6413b2..f041f9e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1398,7 +1398,7 @@ static int gpiod_request(struct gpio_desc *desc,
> const char *label)
>  	int			status = -EPROBE_DEFER;
>  	unsigned long		flags;
> 
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>  		pr_warn("%s: invalid GPIO\n", __func__);
>  		return -EINVAL;
>  	}
> @@ -1406,8 +1406,6 @@ static int gpiod_request(struct gpio_desc *desc,
> const char *label)
>  	spin_lock_irqsave(&gpio_lock, flags);
> 
>  	chip = desc->chip;
> -	if (chip == NULL)
> -		goto done;
> 
>  	if (!try_module_get(chip->owner))
>  		goto done;
> @@ -1630,16 +1628,20 @@ static int gpiod_direction_input(struct
> gpio_desc *desc)
>  	int			status = -EINVAL;
>  	int			offset;
> 
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>  		pr_warn("%s: invalid GPIO\n", __func__);
>  		return -EINVAL;
>  	}
> 
> +	chip = desc->chip;
> +	if (!chip->get || !chip->direction_input) {
> +	  pr_warn("%s: missing get() or direction_input() operations\n",
> +		  __func__);
> +		return -EIO;
> +	}
> +
>  	spin_lock_irqsave(&gpio_lock, flags);
> 
> -	chip = desc->chip;
> -	if (!chip || !chip->get || !chip->direction_input)
> -		goto fail;
>  	status = gpio_ensure_requested(desc);
>  	if (status < 0)
>  		goto fail;
> @@ -1691,7 +1693,7 @@ static int gpiod_direction_output(struct gpio_desc
> *desc, int value)
>  	int			status = -EINVAL;
>  	int offset;
> 
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>  		pr_warn("%s: invalid GPIO\n", __func__);
>  		return -EINVAL;
>  	}
> @@ -1704,11 +1706,15 @@ static int gpiod_direction_output(struct
> gpio_desc *desc, int value)
>  	if (!value && test_bit(FLAG_OPEN_SOURCE,  &desc->flags))
>  		return gpiod_direction_input(desc);
> 
> +	chip = desc->chip;
> +	if (!chip->set || !chip->direction_output) {
> +	  pr_warn("%s: missing set() or direction_output() operations\n",
> +		  __func__);
> +		return -EIO;
> +	}
> +
>  	spin_lock_irqsave(&gpio_lock, flags);
> 
> -	chip = desc->chip;
> -	if (!chip || !chip->set || !chip->direction_output)
> -		goto fail;
>  	status = gpio_ensure_requested(desc);
>  	if (status < 0)
>  		goto fail;
> @@ -1765,7 +1771,7 @@ static int gpiod_set_debounce(struct gpio_desc
> *desc, unsigned debounce)
>  	int			status = -EINVAL;
>  	int			offset;
> 
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>  		pr_warn("%s: invalid GPIO\n", __func__);
>  		return -EINVAL;
>  	}
> @@ -1773,8 +1779,10 @@ static int gpiod_set_debounce(struct gpio_desc
> *desc, unsigned debounce)
>  	spin_lock_irqsave(&gpio_lock, flags);
> 
>  	chip = desc->chip;
> -	if (!chip || !chip->set || !chip->set_debounce)
> -		goto fail;
> +	if (!chip->set || !chip->set_debounce) {
> +	  pr_warn("%s: missing set() or set_debounce() operations\n",
> +		  __func__);

There should be a "return -EIO" here also.  Otherwise the
NULL chip->set_debounce() gets called a few lines below.

> +	}
> 
>  	status = gpio_ensure_requested(desc);
>  	if (status < 0)
> 

