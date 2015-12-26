From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 13/54] gpio: pcf857x: Be sure to clamp return value
Date: Sun, 27 Dec 2015 00:35:48 +0200
Message-ID: <11897257.suvtS8Wvz6@avalon>
References: <1450794009-22885-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56033 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751502AbbLZWft (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Dec 2015 17:35:49 -0500
In-Reply-To: <1450794009-22885-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, George Cherian <george.cherian@ti.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi Linus,

Thank you for the patch.

On Tuesday 22 December 2015 15:20:09 Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.

The patch itself looks good to me, but wouldn't it be easier to patch the 
caller to clamp positive values to [0,1] and propagate negative values 
untouched ?

> Also start returning the error code if something fails, as the
> end of the series augment the core to support this.
> 
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: George Cherian <george.cherian@ti.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-pcf857x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index bf511c0efa48..f64380a7d004 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -154,7 +154,7 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned
> offset) int		value;
> 
>  	value = gpio->read(gpio->client);
> -	return (value < 0) ? 0 : (value & (1 << offset));
> +	return (value < 0) ? value : !!(value & (1 << offset));
>  }
> 
>  static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int
> value)

-- 
Regards,

Laurent Pinchart

