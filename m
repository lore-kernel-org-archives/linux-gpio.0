From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 02/54] gpio: davinci: Be sure to clamp return value
Date: Tue, 22 Dec 2015 18:07:28 +0200
Message-ID: <56797540.9030203@ti.com>
References: <1450793427-21871-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:38753 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859AbbLVQHd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 11:07:33 -0500
In-Reply-To: <1450793427-21871-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>

On 12/22/2015 04:10 PM, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpio-davinci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 65ebaef935e1..1e3a617e0c10 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -125,7 +125,7 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
>   	struct davinci_gpio_controller *d = chip2controller(chip);
>   	struct davinci_gpio_regs __iomem *g = d->regs;
>
> -	return (1 << offset) & readl_relaxed(&g->in_data);
> +	return !!((1 << offset) & readl_relaxed(&g->in_data));
>   }
>
>   /*
>

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
regards,
-grygorii
