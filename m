From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 134/182] m68k: gpio: switch to gpiochip_add_data()
Date: Mon, 14 Dec 2015 10:49:50 +1000
Message-ID: <566E122E.8070700@uclinux.org>
References: <1449668315-4352-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:5997
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751342AbbLNA7G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sun, 13 Dec 2015 19:59:06 -0500
In-Reply-To: <1449668315-4352-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

On 09/12/15 23:38, Linus Walleij wrote:
> We're planning to remove the gpiochip_add() function to swith
> to gpiochip_add_data() with NULL for data argument.
> 
> Cc: Greg Ungerer <gerg@uclinux.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Coldfire maintainers: please ACK this so I can take it through
> the GPIO tree.

Acked-by: Greg Ungerer <gerg@uclinux.org>

Thanks
Greg



> Also consider abstracting out GPIO and moving it to drivers/gpio
> at some point. It would involve some work though.
> ---
>  arch/m68k/coldfire/gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
> index e7e428681ec5..19c335d5031d 100644
> --- a/arch/m68k/coldfire/gpio.c
> +++ b/arch/m68k/coldfire/gpio.c
> @@ -178,7 +178,7 @@ static struct gpio_chip mcfgpio_chip = {
>  
>  static int __init mcfgpio_sysinit(void)
>  {
> -	gpiochip_add(&mcfgpio_chip);
> +	gpiochip_add_data(&mcfgpio_chip, NULL);
>  	return subsys_system_register(&mcfgpio_subsys, NULL);
>  }
>  
> 

