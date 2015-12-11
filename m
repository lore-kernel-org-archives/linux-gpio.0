From: Sonic Zhang <sonic.adi@gmail.com>
Subject: Re: [PATCH 132/182] blackfin: gpio: switch to gpiochip_add_data()
Date: Fri, 11 Dec 2015 14:24:33 +0800
Message-ID: <CAJxxZ0P9TL3reKrbJZKH2UFZnM2zWRDmfJPGP2Tdsn+=akJtqg@mail.gmail.com>
References: <1449668260-4207-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f44.google.com ([209.85.192.44]:35837 "EHLO
	mail-qg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751324AbbLKGuf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 01:50:35 -0500
Received: by qgec40 with SMTP id c40so186322978qge.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 22:50:35 -0800 (PST)
In-Reply-To: <1449668260-4207-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Sonic Zhang <sonic.zhang@analog.com>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net

Acked-by: Sonic Zhang <sonic.zhang@analog.com>


On Wed, Dec 9, 2015 at 9:37 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> We're planning to remove the gpiochip_add() function to swith
> to gpiochip_add_data() with NULL for data argument.
>
> Cc: Sonic Zhang <sonic.zhang@analog.com>
> Cc: Steven Miao <realmz6@gmail.com>
> Cc: adi-buildroot-devel@lists.sourceforge.net
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Blackfin maintainers: please ACK this so I can take it through
> the GPIO tree.
>
> BTW: isn't this going away? I liked Sonic's
> drivers/pinctrl/pinctrl-adi2.c driver, is this adi1? It should be
> modernized and moved to drivers/pinctrl.

This is the legacy driver for Blackfin 5xx serial silicons. The
Blackfin 54x and 6xx silicons use a different pinmux model and are
only supported in driver drivers/pinctrl/pinctrl-adi2.c ,

> ---
>  arch/blackfin/kernel/bfin_gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/blackfin/kernel/bfin_gpio.c b/arch/blackfin/kernel/bfin_gpio.c
> index a017359c1826..7a91cc6ea4b2 100644
> --- a/arch/blackfin/kernel/bfin_gpio.c
> +++ b/arch/blackfin/kernel/bfin_gpio.c
> @@ -11,6 +11,8 @@
>  #include <linux/err.h>
>  #include <linux/proc_fs.h>
>  #include <linux/seq_file.h>
> +#include <linux/gpio/driver.h>
> +/* FIXME: consumer API required for gpio_set_value() etc, get rid of this */
>  #include <linux/gpio.h>
>  #include <linux/irq.h>
>
> @@ -1197,7 +1199,7 @@ static struct gpio_chip bfin_chip = {
>
>  static int __init bfin_gpiolib_setup(void)
>  {
> -       return gpiochip_add(&bfin_chip);
> +       return gpiochip_add_data(&bfin_chip, NULL);
>  }
>  arch_initcall(bfin_gpiolib_setup);
>  #endif
> --
> 2.4.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
