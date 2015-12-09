From: Alban <albeu@free.fr>
Subject: Re: [PATCH RFT] gpio: ath79: Fix the logic to clear offset bit of
 AR71XX_GPIO_REG_OE register
Date: Wed, 9 Dec 2015 11:19:15 +0100
Message-ID: <20151209111915.786d9dcf@avionic-0020>
References: <1449586867.5555.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:4708 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754358AbbLIKTY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 05:19:24 -0500
In-Reply-To: <1449586867.5555.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alban <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Tue, 08 Dec 2015 23:01:07 +0800
Axel Lin <axel.lin@ingics.com> wrote:

> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Alban Bedel <albeu@free.fr>

> ---
>  drivers/gpio/gpio-ath79.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
> index e5827a5..5eaea8b 100644
> --- a/drivers/gpio/gpio-ath79.c
> +++ b/drivers/gpio/gpio-ath79.c
> @@ -113,7 +113,7 @@ static int ar934x_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  		__raw_writel(BIT(offset), ctrl->base + AR71XX_GPIO_REG_CLEAR);
>  
>  	__raw_writel(
> -		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) & BIT(offset),
> +		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) & ~BIT(offset),
>  		ctrl->base + AR71XX_GPIO_REG_OE);
>  
>  	spin_unlock_irqrestore(&ctrl->lock, flags);
