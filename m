From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] gpio: mxs: use enable/disable regs to (un)mask irqs
Date: Fri, 21 Oct 2016 19:36:49 +0200
Message-ID: <05028208-b4c5-7a5e-6983-5e8b353bfdc1@denx.de>
References: <20161021131138.10467-1-s.hauer@pengutronix.de>
 <20161021131138.10467-2-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:42829 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932749AbcJUSKL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2016 14:10:11 -0400
In-Reply-To: <20161021131138.10467-2-s.hauer@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>

On 10/21/2016 03:11 PM, Sascha Hauer wrote:
> The mxs gpio controller does not only have a mask register to mask
> interrupts, but also enable/disable registers. Use the enable/disable
> registers rather than the mask register. This does not have any
> advantage for now, but makes the next patch simpler.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks

> ---
>  drivers/gpio/gpio-mxs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
> index b9daa0b..1cf579f 100644
> --- a/drivers/gpio/gpio-mxs.c
> +++ b/drivers/gpio/gpio-mxs.c
> @@ -211,12 +211,13 @@ static int __init mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
>  
>  	ct = gc->chip_types;
>  	ct->chip.irq_ack = irq_gc_ack_set_bit;
> -	ct->chip.irq_mask = irq_gc_mask_clr_bit;
> -	ct->chip.irq_unmask = irq_gc_mask_set_bit;
> +	ct->chip.irq_mask = irq_gc_mask_disable_reg;
> +	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
>  	ct->chip.irq_set_type = mxs_gpio_set_irq_type;
>  	ct->chip.irq_set_wake = mxs_gpio_set_wake_irq;
>  	ct->regs.ack = PINCTRL_IRQSTAT(port) + MXS_CLR;
> -	ct->regs.mask = PINCTRL_IRQEN(port);
> +	ct->regs.enable = PINCTRL_IRQEN(port) + MXS_SET;
> +	ct->regs.disable = PINCTRL_IRQEN(port) + MXS_CLR;
>  
>  	irq_setup_generic_chip(gc, IRQ_MSK(32), IRQ_GC_INIT_NESTED_LOCK,
>  			       IRQ_NOREQUEST, 0);
> 


-- 
Best regards,
Marek Vasut
