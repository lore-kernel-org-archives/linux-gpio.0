From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 14/54] gpio: pch: Be sure to clamp return value
Date: Mon, 4 Jan 2016 10:41:41 +0100
Message-ID: <20160104104141.14cf44d9@endymion.delvare>
References: <1450794054-22948-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46881 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751521AbcADJlo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 4 Jan 2016 04:41:44 -0500
In-Reply-To: <1450794054-22948-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>

Hi Linus,

On Tue, 22 Dec 2015 15:20:54 +0100, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-pch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
> index af0715f8524b..8c45b74dcf21 100644
> --- a/drivers/gpio/gpio-pch.c
> +++ b/drivers/gpio/gpio-pch.c
> @@ -127,7 +127,7 @@ static int pch_gpio_get(struct gpio_chip *gpio, unsigned nr)
>  {
>  	struct pch_gpio *chip =	container_of(gpio, struct pch_gpio, gpio);
>  
> -	return ioread32(&chip->reg->pi) & (1 << nr);
> +	return !!(ioread32(&chip->reg->pi) & (1 << nr));
>  }
>  
>  static int pch_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,

I would prefer:

	return (ioread32(&chip->reg->pi) >> nr) & 1;

which is faster for the same result.

At x86 assembly level, your approach requires 5 CPU instructions (mov,
shl, test, setne and movzbl), mine only 2 CPU instructions (shr and
and.)

-- 
Jean Delvare
SUSE L3 Support
