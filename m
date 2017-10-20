From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH] gpio: grgpio: Do not use gc->pin2mask()
Date: Fri, 20 Oct 2017 15:47:00 +0200
Message-ID: <59E9FE54.6090904@gaisler.com>
References: <20171020130347.26722-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.bahnhof.se ([213.80.101.11]:39880 "EHLO mx1.bahnhof.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752022AbdJTOJz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 20 Oct 2017 10:09:55 -0400
In-Reply-To: <20171020130347.26722-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On 2017-10-20 15:03, Linus Walleij wrote:
> The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
> i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
> bit 15 or bit 31 or so.
>
> The grgpio only uses big endian BYTE ORDER which will be taken car of
> by the ->write_reg() callback.
>
> Just use BIT(offset) to assign the bit.

Sure, as bgpio_init is not called with BGPIOF_BIG_ENDIAN in the flags 
argument, the pin2mask call just resulted in a BIT(offset) anyway.

Acked-by: Andreas Larsson <andreas@gaisler.com>


> Cc: Andreas Larsson <andreas@gaisler.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpio-grgpio.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index 6544a16ab02e..e2fc561f4315 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -35,6 +35,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/irq.h>
>   #include <linux/irqdomain.h>
> +#include <linux/bitops.h>
>
>   #define GRGPIO_MAX_NGPIO 32
>
> @@ -96,12 +97,11 @@ static void grgpio_set_imask(struct grgpio_priv *priv, unsigned int offset,
>   			     int val)
>   {
>   	struct gpio_chip *gc = &priv->gc;
> -	unsigned long mask = gc->pin2mask(gc, offset);
>
>   	if (val)
> -		priv->imask |= mask;
> +		priv->imask |= BIT(offset);
>   	else
> -		priv->imask &= ~mask;
> +		priv->imask &= ~BIT(offset);
>   	gc->write_reg(priv->regs + GRGPIO_IMASK, priv->imask);
>   }
>
>

