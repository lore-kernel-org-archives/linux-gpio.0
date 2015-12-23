From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 35/54] m68k: coldfire/gpio: Be sure to clamp return value
Date: Wed, 23 Dec 2015 21:51:45 +1000
Message-ID: <567A8AD1.3070705@uclinux.org>
References: <1450795145-27292-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:18514
	"EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752871AbbLWLwH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Dec 2015 06:52:07 -0500
In-Reply-To: <1450795145-27292-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

On 23/12/15 00:39, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Greg Ungerer <gerg@uclinux.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> M68K folks: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.

I will take via the m68knommu git tree.
I am pushing it up to the for-next branch now.

Thanks
Greg



> ---
>   arch/m68k/coldfire/gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
> index e7e428681ec5..37a83e27c7a6 100644
> --- a/arch/m68k/coldfire/gpio.c
> +++ b/arch/m68k/coldfire/gpio.c
> @@ -121,7 +121,7 @@ static int mcfgpio_direction_input(struct gpio_chip *chip, unsigned offset)
>
>   static int mcfgpio_get_value(struct gpio_chip *chip, unsigned offset)
>   {
> -	return __mcfgpio_get_value(offset);
> +	return !!__mcfgpio_get_value(offset);
>   }
>
>   static int mcfgpio_direction_output(struct gpio_chip *chip, unsigned offset,
>
