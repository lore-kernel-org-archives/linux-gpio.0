From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] gpio: tc3589x: use BIT() macro
Date: Tue, 5 Apr 2016 06:52:33 -0700
Message-ID: <20160405135233.GE391@tuxbot>
References: <1459861855-1975-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:33905 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758601AbcDENwh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 09:52:37 -0400
Received: by mail-pa0-f41.google.com with SMTP id fe3so11191195pab.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 06:52:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1459861855-1975-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Tue 05 Apr 06:10 PDT 2016, Linus Walleij wrote:

> This switch to use BIT(n) instead of (1 << n) which is less
> to the point. Most GPIO drivers do this to avoid mistakes.
> Also switch from using <linux/gpio.h> to the apropriate
> <linux/gpio/driver.h> include.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-tc3589x.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
[..]
> @@ -55,7 +56,7 @@ static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
>  	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
>  	u8 reg = TC3589x_GPIODATA0 + (offset / 8) * 2;
>  	unsigned pos = offset % 8;
> -	u8 data[] = {!!val << pos, 1 << pos};
> +	u8 data[] = {!!val << pos, BIT(pos)};
                        ^
                        |
The first part of this is also a bitmask, so even though this is
slightly messier I think for consistency you should go with:

u8 data[] = {val ? BIT(pos) : 0, BIT(pos)};

>  
>  	tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
>  }

The rest looks good,

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
