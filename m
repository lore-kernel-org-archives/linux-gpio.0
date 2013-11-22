From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2] powerpc/gpio: Fix the wrong GPIO input data on
 MPC8572/MPC8536
Date: Fri, 22 Nov 2013 12:39:08 -0600
Message-ID: <1385145548.1403.524.camel@snotra.buserror.net>
References: <1385107960-373-1-git-send-email-Gang.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]:39956
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755431Ab3KVSjW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 22 Nov 2013 13:39:22 -0500
In-Reply-To: <1385107960-373-1-git-send-email-Gang.Liu@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, agust@denx.de, b07421@freescale.com, linus.walleij@linaro.org, r61911@freescale.com

On Fri, 2013-11-22 at 16:12 +0800, Liu Gang wrote:
> For MPC8572/MPC8536, the status of GPIOs defined as output
> cannot be determined by reading GPDAT register, so the code
> use shadow data register instead. But the code may give the
> wrong status of GPIOs defined as input under some scenarios:
> 
> 1. If some pins were configured as inputs and were asserted
> high before booting the kernel, the shadow data has been
> initialized with those pin values.
> 2. Some pins have been configured as output first and have
> been set to the high value, then reconfigured as input.
> 
> The above cases will make the shadow data for those input
> pins to be set to high. Then reading the pin status will
> always return high even if the actual pin status is low.
> 
> The code should eliminate the effects of the shadow data to
> the input pins, and the status of those pins should be
> read directly from GPDAT.
> 
> Signed-off-by: Liu Gang <Gang.Liu@freescale.com>
> ---
> changes in v2:
>  - Added more description of the problem.
>  - Reduced one in_be32() call.
>  - Do not modify the shadow data.
> 
>  drivers/gpio/gpio-mpc8xxx.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 914e859..d7d6d72 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -70,10 +70,14 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>  	u32 val;
>  	struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
>  	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
> +	u32 out_mask, out_shadow;
>  
> -	val = in_be32(mm->regs + GPIO_DAT) & ~in_be32(mm->regs + GPIO_DIR);
> +	out_mask = in_be32(mm->regs + GPIO_DIR);
>  
> -	return (val | mpc8xxx_gc->data) & mpc8xxx_gpio2mask(gpio);
> +	val = in_be32(mm->regs + GPIO_DAT) & ~out_mask;
> +	out_shadow = mpc8xxx_gc->data & out_mask;
> +
> +	return (val | out_shadow) & mpc8xxx_gpio2mask(gpio);
>  }
>  
>  static int mpc8xxx_gpio_get(struct gpio_chip *gc, unsigned int gpio)

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott



