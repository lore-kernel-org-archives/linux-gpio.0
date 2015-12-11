From: Sonic Zhang <sonic.adi@gmail.com>
Subject: Re: [PATCH 133/182] blackfin: extgpio: switch to gpiochip_add_data()
Date: Fri, 11 Dec 2015 14:25:33 +0800
Message-ID: <CAJxxZ0MO+BGc1rzmmWOzSjoC7GVjUMwGTxPmDn6cUDdJU+yvRA@mail.gmail.com>
References: <1449668270-4255-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:35565 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751637AbbLKGZe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 01:25:34 -0500
Received: by qgec40 with SMTP id c40so185445628qge.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 22:25:33 -0800 (PST)
In-Reply-To: <1449668270-4255-1-git-send-email-linus.walleij@linaro.org>
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
> BTW: consider cleaning this up and moving it to drivers/gpio
> at some point. Also GPIO drivers should be including
> to not knowing how <asm/gpio.h> is thought out. But please abstract
> it out if you find the time.
> ---
>  arch/blackfin/mach-bf538/ext-gpio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/blackfin/mach-bf538/ext-gpio.c b/arch/blackfin/mach-bf538/ext-gpio.c
> index 471a9b184d5b..c878b57d29aa 100644
> --- a/arch/blackfin/mach-bf538/ext-gpio.c
> +++ b/arch/blackfin/mach-bf538/ext-gpio.c
> @@ -116,9 +116,9 @@ static struct gpio_chip bf538_porte_chip = {
>
>  static int __init bf538_extgpio_setup(void)
>  {
> -       return gpiochip_add(&bf538_portc_chip) |
> -               gpiochip_add(&bf538_portd_chip) |
> -               gpiochip_add(&bf538_porte_chip);
> +       return gpiochip_add_data(&bf538_portc_chip, NULL) |
> +               gpiochip_add_data(&bf538_portd_chip, NULL) |
> +               gpiochip_add_data(&bf538_porte_chip, NULL);
>  }
>  arch_initcall(bf538_extgpio_setup);
>
> --
> 2.4.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
