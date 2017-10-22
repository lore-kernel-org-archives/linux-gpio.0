From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: Do not use gc->pin2mask()
Date: Sun, 22 Oct 2017 11:26:08 -0700
Message-ID: <40157fee-d31b-3b3a-3152-198a0f6b7469@gmail.com>
References: <20171020134817.28040-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:55434 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932075AbdJVS0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Oct 2017 14:26:12 -0400
Received: by mail-oi0-f68.google.com with SMTP id g125so27220327oib.12
        for <linux-gpio@vger.kernel.org>; Sun, 22 Oct 2017 11:26:12 -0700 (PDT)
In-Reply-To: <20171020134817.28040-1-linus.walleij@linaro.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Gregory Fong <gregory.0xf0@gmail.com>, opendmb@gmail.com



On 10/20/2017 06:48 AM, Linus Walleij wrote:
> The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
> i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
> bit 15 or bit 31 or so.
> 
> The brcmstb only uses big endian BYTE ORDER which will be taken car of
> by the ->write_reg() callback.
> 
> Just use BIT(offset) to assign the bit.
> 
> Cc: Gregory Fong <gregory.0xf0@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> ---
>  drivers/gpio/gpio-brcmstb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 27e92e57adae..9b8fcca7ad17 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -20,6 +20,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/interrupt.h>
>  #include <linux/reboot.h>
> +#include <linux/bitops.h>
>  
>  #define GIO_BANK_SIZE           0x20
>  #define GIO_ODEN(bank)          (((bank) * GIO_BANK_SIZE) + 0x00)
> @@ -68,16 +69,15 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>  {
>  	struct gpio_chip *gc = &bank->gc;
>  	struct brcmstb_gpio_priv *priv = bank->parent_priv;
> -	u32 mask = gc->pin2mask(gc, offset);
>  	u32 imask;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&gc->bgpio_lock, flags);
>  	imask = gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
>  	if (enable)
> -		imask |= mask;
> +		imask |= BIT(offset);
>  	else
> -		imask &= ~mask;
> +		imask &= ~BIT(offset);
>  	gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
> 

-- 
Florian
