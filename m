From: Fabian Vogt <fabian@ritter-vogt.de>
Subject: Re: [PATCH RFT] gpio: zevio: Get correct gpio output value
Date: Mon, 07 Apr 2014 17:17:51 +0200
Message-ID: <1456321.rfNnq0vY8Z@fabians-laptop.fritz.box>
References: <1396852492.26619.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:50840 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752663AbaDGPRz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 11:17:55 -0400
In-Reply-To: <1396852492.26619.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hi,

IIRC I tested that and input and output are independant of each other.
If you set a pin as output and write a 1 into the output register, but you connect the pin to ground physically output is "1" and input "0".
Which behaviour is the correct one for gpio_get?

Bye,
Fabian

Am Montag, 7. April 2014, 14:34:52 schrieb Axel Lin:
> Read gpio output value from ZEVIO_GPIO_OUTPUT.
> The spin_lock is required to ensure the direction is not changed before reading
> input/output value.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi Fabian,
> The document only mentions:
>   +10 (R/W): Direction (set bit to 0 for output, 1 for input)
>   +14 (R/W): GPIO output bit
>   +18 (R): Reads GPIO input bit.
> So I'm not sure if reading ZEVIO_GPIO_INPUT returns correct status when the
> direction is output. So I think this needs test.
> 
> Regards,
> Axel
>  drivers/gpio/gpio-zevio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
> index 9bf5034..29b0150 100644
> --- a/drivers/gpio/gpio-zevio.c
> +++ b/drivers/gpio/gpio-zevio.c
> @@ -81,9 +81,15 @@ static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
>  static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct zevio_gpio *controller = to_zevio_gpio(chip);
> +	u32 val, dir;
>  
> -	/* Only reading allowed, so no spinlock needed */
> -	u32 val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
> +	spin_lock(&controller->lock);
> +	dir = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_DIRECTION);
> +	if (dir | BIT(ZEVIO_GPIO_BIT(pin)))
> +		val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
> +	else
> +		val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_OUTPUT);
> +	spin_unlock(&controller->lock);
>  
>  	return (val >> ZEVIO_GPIO_BIT(pin)) & 0x1;
>  }
> 

