From: Hartley Sweeten <HartleyS@visionengravers.com>
Subject: RE: [PATCH] gpio: ep93xx: get rid of bogus __raw* accessors
Date: Mon, 14 Oct 2013 16:05:12 +0000
Message-ID: <DC148C5AA1CEBA4E87973D432B1C2D8817DAB0F9@P3PWEX4MB008.ex4.secureserver.net>
References: <1381738193-11448-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from p3plex2out02.prod.phx3.secureserver.net ([184.168.131.14]:38695
	"EHLO p3plex2out02.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755583Ab3JNQMf convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Oct 2013 12:12:35 -0400
In-Reply-To: <1381738193-11448-1-git-send-email-linus.walleij@linaro.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Ryan Mallon <rmallon@gmail.com>

On Monday, October 14, 2013 1:10 AM, Linus Walleij wrote:
> I have no idea why this driver is using __raw* accessors for
> reading and writing registers, I suspect it is just force of
> habit or copy/paste. Change all to readb()/writeb() except
> one chain where I used writeb_relaxed() up until the last
> writeb().

The original ep93xx gpio support was in arch/arm/mach-ep93xx before
it was moved to drivers/gpio and converted to use GPIO_GENERIC. The
older driver used __raw* accessors for all the I/O to the statically mapped
addresses.

The ones below were not converted at that time because the interrupt
support code did not have access to the ioremap'd mmio address.

I'd feel better about it if there is a way to pass the ioremap'd address
from ep93xx_gpio_probe() to ep93xx_gpio_init_irq() and store that
address for the interrupt functions to use.

But, I believe the static mapping is 1:1 so this should work. I'll try to test it
today and let you know.

Thanks,
Hartley

> Cc: Ryan Mallon <rmallon@gmail.com>
> Cc: H Hartley Sweeten <hartleys@visionengravers.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-ep93xx.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index 56b98ee..80829f3 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -51,15 +51,15 @@ static void ep93xx_gpio_update_int_params(unsigned port)
>  {
>  	BUG_ON(port > 2);
>  
> -	__raw_writeb(0, EP93XX_GPIO_REG(int_en_register_offset[port]));
> +	writeb_relaxed(0, EP93XX_GPIO_REG(int_en_register_offset[port]));
>  
> -	__raw_writeb(gpio_int_type2[port],
> +	writeb_relaxed(gpio_int_type2[port],
>  		EP93XX_GPIO_REG(int_type2_register_offset[port]));
>  
> -	__raw_writeb(gpio_int_type1[port],
> +	writeb_relaxed(gpio_int_type1[port],
>  		EP93XX_GPIO_REG(int_type1_register_offset[port]));
>  
> -	__raw_writeb(gpio_int_unmasked[port] & gpio_int_enabled[port],
> +	writeb(gpio_int_unmasked[port] & gpio_int_enabled[port],
>  		EP93XX_GPIO_REG(int_en_register_offset[port]));
>  }
>  
> @@ -74,7 +74,7 @@ static void ep93xx_gpio_int_debounce(unsigned int irq, bool enable)
>  	else
>  		gpio_int_debounce[port] &= ~port_mask;
>  
> -	__raw_writeb(gpio_int_debounce[port],
> +	writeb(gpio_int_debounce[port],
>  		EP93XX_GPIO_REG(int_debounce_register_offset[port]));
>  }
>  
> @@ -83,7 +83,7 @@ static void ep93xx_gpio_ab_irq_handler(unsigned int irq, struct irq_desc *desc)
>  	unsigned char status;
>  	int i;
>  
> -	status = __raw_readb(EP93XX_GPIO_A_INT_STATUS);
> +	status = readb(EP93XX_GPIO_A_INT_STATUS);
>  	for (i = 0; i < 8; i++) {
>  		if (status & (1 << i)) {
>  			int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_A(0)) + i;
> @@ -91,7 +91,7 @@ static void ep93xx_gpio_ab_irq_handler(unsigned int irq, struct irq_desc *desc)
>  		}
>  	}
>  
> -	status = __raw_readb(EP93XX_GPIO_B_INT_STATUS);
> +	status = readb(EP93XX_GPIO_B_INT_STATUS);
>  	for (i = 0; i < 8; i++) {
>  		if (status & (1 << i)) {
>  			int gpio_irq = gpio_to_irq(EP93XX_GPIO_LINE_B(0)) + i;
> @@ -124,7 +124,7 @@ static void ep93xx_gpio_irq_ack(struct irq_data *d)
>  		ep93xx_gpio_update_int_params(port);
>  	}
>  
> -	__raw_writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
> +	writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
>  }
>  
>  static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
> @@ -139,7 +139,7 @@ static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
 	gpio_int_unmasked[port] &= ~port_mask;
>  	ep93xx_gpio_update_int_params(port);
>  
> -	__raw_writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
> +	writeb(port_mask, EP93XX_GPIO_REG(eoi_register_offset[port]));
>  }
>  
>  static void ep93xx_gpio_irq_mask(struct irq_data *d)

