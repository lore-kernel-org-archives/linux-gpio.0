From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpio: improve error path in gpiolib
Date: Fri, 30 Aug 2013 18:17:16 +0900
Message-ID: <5220631C.8060107@nvidia.com>
References: <1377848795-28070-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3129 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753696Ab3H3JRU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2013 05:17:20 -0400
In-Reply-To: <1377848795-28070-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Frank Rowand <frank.rowand@sonymobile.com>, Tim Bird <tim.bird@sonymobile.com>

On 08/30/2013 04:46 PM, Linus Walleij wrote:
> At several places the gpiolib will proceed to handle a GPIO
> descriptor even if it's ->chip member is NULL and no gpiochip
> is associated.
>
> Fix this by checking that both the descriptor cookie *and*
> the chip pointer are valid.
>
> Also bail out earlier with more specific diagnostic messages
> on missing operations for setting as input/output or debounce.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Frank Rowand <frank.rowand@sonymobile.com>
> Cc: Tim Bird <tim.bird@sonymobile.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpiolib.c | 36 ++++++++++++++++++++++--------------
>   1 file changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d6413b2..f041f9e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1398,7 +1398,7 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
>   	int			status = -EPROBE_DEFER;
>   	unsigned long		flags;
>
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>   		pr_warn("%s: invalid GPIO\n", __func__);
>   		return -EINVAL;
>   	}
> @@ -1406,8 +1406,6 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
>   	spin_lock_irqsave(&gpio_lock, flags);
>
>   	chip = desc->chip;
> -	if (chip == NULL)
> -		goto done;
>
>   	if (!try_module_get(chip->owner))
>   		goto done;
> @@ -1630,16 +1628,20 @@ static int gpiod_direction_input(struct gpio_desc *desc)
>   	int			status = -EINVAL;
>   	int			offset;
>
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>   		pr_warn("%s: invalid GPIO\n", __func__);
>   		return -EINVAL;
>   	}
>
> +	chip = desc->chip;
> +	if (!chip->get || !chip->direction_input) {
> +	  pr_warn("%s: missing get() or direction_input() operations\n",
> +		  __func__);
> +		return -EIO;
> +	}
> +
>   	spin_lock_irqsave(&gpio_lock, flags);
>
> -	chip = desc->chip;
> -	if (!chip || !chip->get || !chip->direction_input)
> -		goto fail;
>   	status = gpio_ensure_requested(desc);
>   	if (status < 0)
>   		goto fail;
> @@ -1691,7 +1693,7 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
>   	int			status = -EINVAL;
>   	int offset;
>
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>   		pr_warn("%s: invalid GPIO\n", __func__);
>   		return -EINVAL;
>   	}
> @@ -1704,11 +1706,15 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
>   	if (!value && test_bit(FLAG_OPEN_SOURCE,  &desc->flags))
>   		return gpiod_direction_input(desc);
>
> +	chip = desc->chip;
> +	if (!chip->set || !chip->direction_output) {
> +	  pr_warn("%s: missing set() or direction_output() operations\n",
> +		  __func__);
> +		return -EIO;
> +	}
> +
>   	spin_lock_irqsave(&gpio_lock, flags);
>
> -	chip = desc->chip;
> -	if (!chip || !chip->set || !chip->direction_output)
> -		goto fail;
>   	status = gpio_ensure_requested(desc);
>   	if (status < 0)
>   		goto fail;
> @@ -1765,7 +1771,7 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>   	int			status = -EINVAL;
>   	int			offset;
>
> -	if (!desc) {
> +	if (!desc || !desc->chip) {
>   		pr_warn("%s: invalid GPIO\n", __func__);
>   		return -EINVAL;
>   	}
> @@ -1773,8 +1779,10 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>   	spin_lock_irqsave(&gpio_lock, flags);
>
>   	chip = desc->chip;
> -	if (!chip || !chip->set || !chip->set_debounce)
> -		goto fail;
> +	if (!chip->set || !chip->set_debounce) {
> +	  pr_warn("%s: missing set() or set_debounce() operations\n",
> +		  __func__);
> +	}
>
>   	status = gpio_ensure_requested(desc);
>   	if (status < 0)
>


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
