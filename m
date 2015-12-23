From: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 04/54] gpio: ich: Be sure to clamp return value
Date: Wed, 23 Dec 2015 10:59:44 -0600 (CST)
Message-ID: <158154057.29505.1450889984570.JavaMail.zimbra@xes-inc.com>
References: <1450793493-21995-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:55521 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752237AbbLWRAs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Dec 2015 12:00:48 -0500
In-Reply-To: <1450793493-21995-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

----- Original Message -----
> From: "Linus Walleij" <linus.walleij@linaro.org>
> Sent: Tuesday, December 22, 2015 8:11:33 AM
> 
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: Aaron Sierra <asierra@xes-inc.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-ich.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
> index 8623d12e23c1..68e525a3cea3 100644
> --- a/drivers/gpio/gpio-ich.c
> +++ b/drivers/gpio/gpio-ich.c
> @@ -236,9 +236,9 @@ static int ich6_gpio_get(struct gpio_chip *chip, unsigned
> nr)
>  
>  		spin_unlock_irqrestore(&ichx_priv.lock, flags);
>  
> -		return (data >> 16) & (1 << nr) ? 1 : 0;
> +		return !!((data >> 16) & (1 << nr));

Linus,
Is this particular change done to simplify verification via Coccinelle? Otherwise,
this value is already clamped to 0/1.

>  	} else {
> -		return ichx_gpio_get(chip, nr);
> +		return !!ichx_gpio_get(chip, nr);


The current definition of ichx_gpio_get() is just a wrapper for
ichx_read_bit(), which clamps the return value to 0 and 1.

Suppose there were an opportunity to catch an error with these GPIOs. In that
case, ichx_gpio_get() would be the best candidate to return an error code. I
think this particular change should be dropped.

>  	}
>  }

-Aaron S.
