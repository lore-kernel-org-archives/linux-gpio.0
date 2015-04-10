From: Ray Jui <rjui@broadcom.com>
Subject: Re: [RFT][PATCH 2/2] gpio: bcm-kona: Implement get_direction callback
Date: Fri, 10 Apr 2015 09:13:34 -0700
Message-ID: <5527F6AE.9010502@broadcom.com>
References: <1428629325.5384.1.camel@phoenix> <1428629414.5384.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:64909 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754539AbbDJQNs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Apr 2015 12:13:48 -0400
In-Reply-To: <1428629414.5384.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Axel,

On 4/9/2015 6:30 PM, Axel Lin wrote:
> Implement gpio_chip's get_direction() callback, that lets other drivers get
> particular GPIOs direction using gpiod_get_direction().
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-bcm-kona.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 632352d..3649ed5 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -129,6 +129,14 @@ static int bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>  	return 0;
>  }
>  
> +static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
> +{
> +	struct bcm_kona_gpio *kona_gpio = to_kona_gpio(chip);
> +	void __iomem *reg_base = kona_gpio->reg_base;
> +
> +	return readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK;

You are making assumption of actual values of GPIOF_DIR_IN and
GPIOF_DIR_OUT. I think it would be better to return GPIOF_DIR_IN or
GPIOF_DIR_OUT based on the register readling.

In addition, with your change, when bcm_kona_gpio_get_dir is called
within bcm_kona_gpio_set and bcm_kona_gpio_get, it's protected by the
kona_gpio->lock spinlock. But no lock protection while being invoked
through the upper layer get_direction callback.

Thanks,

Ray

> +}
> +
>  static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
>  {
>  	struct bcm_kona_gpio *kona_gpio;
> @@ -142,12 +150,8 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
>  	reg_base = kona_gpio->reg_base;
>  	spin_lock_irqsave(&kona_gpio->lock, flags);
>  
> -	/* determine the GPIO pin direction */
> -	val = readl(reg_base + GPIO_CONTROL(gpio));
> -	val &= GPIO_GPCTR0_IOTR_MASK;
> -
>  	/* this function only applies to output pin */
> -	if (GPIO_GPCTR0_IOTR_CMD_INPUT == val)
> +	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
>  		goto out;
>  
>  	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
> @@ -173,13 +177,12 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
>  	reg_base = kona_gpio->reg_base;
>  	spin_lock_irqsave(&kona_gpio->lock, flags);
>  
> -	/* determine the GPIO pin direction */
> -	val = readl(reg_base + GPIO_CONTROL(gpio));
> -	val &= GPIO_GPCTR0_IOTR_MASK;
> +	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
> +		reg_offset = GPIO_IN_STATUS(bank_id);
> +	else
> +		reg_offset = GPIO_OUT_STATUS(bank_id);
>  
>  	/* read the GPIO bank status */
> -	reg_offset = (GPIO_GPCTR0_IOTR_CMD_INPUT == val) ?
> -	    GPIO_IN_STATUS(bank_id) : GPIO_OUT_STATUS(bank_id);
>  	val = readl(reg_base + reg_offset);
>  
>  	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> @@ -316,6 +319,7 @@ static struct gpio_chip template_chip = {
>  	.owner = THIS_MODULE,
>  	.request = bcm_kona_gpio_request,
>  	.free = bcm_kona_gpio_free,
> +	.get_direction = bcm_kona_gpio_get_dir,
>  	.direction_input = bcm_kona_gpio_direction_input,
>  	.get = bcm_kona_gpio_get,
>  	.direction_output = bcm_kona_gpio_direction_output,
> 
