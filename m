From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH] gpio: tb10x: Set output value before setting direction
 to output
Date: Thu, 31 Oct 2013 13:42:06 +0100
Message-ID: <20131031124206.GC7093@ab42.lan>
References: <1383189826.21285.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.abilis.ch ([195.70.19.74]:16630 "EHLO mail.abilis.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754351Ab3JaNSG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Oct 2013 09:18:06 -0400
Content-Disposition: inline
In-Reply-To: <1383189826.21285.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, linux-gpio@vger.kernel.org

On Thu, Oct 31, 2013 at 11:23:46AM +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Christian Ruppert <christian.ruppert@abilis.com>

> ---
>  drivers/gpio/gpio-tb10x.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index a0391bc..9116cdf 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -132,6 +132,7 @@ static int tb10x_gpio_direction_out(struct gpio_chip *chip,
>  	int mask = BIT(offset);
>  	int val = TB10X_GPIO_DIR_OUT << offset;
>  
> +	tb10x_gpio_set(chip, offset, value);
>  	tb10x_set_bits(tb10x_gpio, OFFSET_TO_REG_DDR, mask, val);
>  
>  	return 0;
> -- 
> 1.8.1.2
> 
> 
> 
