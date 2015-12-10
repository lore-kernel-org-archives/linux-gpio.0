From: "Xuetao Guan" <gxt@mprc.pku.edu.cn>
Subject: Re: [PATCH 152/182] unicore32: gpio: switch to gpiochip_add_data()
Date: Thu, 10 Dec 2015 08:21:48 +0800 (CST)
Message-ID: <50102.59.108.92.109.1449706908.squirrel@mprc.pku.edu.cn>
References: <1449668587-5452-1-git-send-email-linus.walleij@linaro.org>
Reply-To: gxt@mprc.pku.edu.cn
Mime-Version: 1.0
Content-Type: text/plain;charset=gb2312
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mprc.pku.edu.cn ([162.105.203.9]:41555 "EHLO mprc.pku.edu.cn"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750849AbbLJAfI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Dec 2015 19:35:08 -0500
In-Reply-To: <1449668587-5452-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Linus Walleij <linus.walleij@linaro.org>

> We're planning to remove the gpiochip_add() function to swith
> to gpiochip_add_data() with NULL for data argument.
>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks,
Acked-by: Guan Xuetao <gxt@mprc.pku.edu.cn>

> ---
> Guan please ACK this so I can take it through the GPIO tree.
> BTW this could possibly move to drivers/gpio but I don't have
> the whole picture here. The internal consumers should be
> converted to the GPIO descriptor API.
> ---
>  arch/unicore32/kernel/gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/unicore32/kernel/gpio.c b/arch/unicore32/kernel/gpio.c
> index cb12ec39552c..54a54c335a72 100644
> --- a/arch/unicore32/kernel/gpio.c
> +++ b/arch/unicore32/kernel/gpio.c
> @@ -14,6 +14,8 @@
>
>  #include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +/* FIXME: needed for gpio_set_value() - convert to use descriptors or
> hogs */
>  #include <linux/gpio.h>
>  #include <mach/hardware.h>
>
> @@ -118,5 +120,5 @@ void __init puv3_init_gpio(void)
>   *	gpio_set_value(GPO_SET_V2, 1);
>   */
>  #endif
> -	gpiochip_add(&puv3_gpio_chip);
> +	gpiochip_add_data(&puv3_gpio_chip, NULL);
>  }
> --
> 2.4.3
>

