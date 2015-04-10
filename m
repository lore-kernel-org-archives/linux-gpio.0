From: Ray Jui <rjui@broadcom.com>
Subject: Re: [RFT][PATCH 1/2] gpio: bcm-kona: Return error if requesting an
 already taken gpio
Date: Fri, 10 Apr 2015 09:05:03 -0700
Message-ID: <5527F4AF.20304@broadcom.com>
References: <1428629325.5384.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:62876 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932827AbbDJQFG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Apr 2015 12:05:06 -0400
In-Reply-To: <1428629325.5384.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Axel,

On 4/9/2015 6:28 PM, Axel Lin wrote:
> If a gpio is already taken, .gpio_request should return error.

Isn't the protection logic already there at the higher layer in gpiolib?

Ray

> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-bcm-kona.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index b164ce8..632352d 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -106,7 +106,7 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
>  	spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  }
>  
> -static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
> +static int bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>  					unsigned gpio)
>  {
>  	u32 val;
> @@ -116,10 +116,17 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>  	spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> +	if (!(val & BIT(gpio))) {
> +		spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +		return -EBUSY;
> +	}
> +
>  	val &= ~BIT(gpio);
>  	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
>  
>  	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +
> +	return 0;
>  }
>  
>  static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
> @@ -185,8 +192,7 @@ static int bcm_kona_gpio_request(struct gpio_chip *chip, unsigned gpio)
>  {
>  	struct bcm_kona_gpio *kona_gpio = to_kona_gpio(chip);
>  
> -	bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
> -	return 0;
> +	return bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
>  }
>  
>  static void bcm_kona_gpio_free(struct gpio_chip *chip, unsigned gpio)
> 
