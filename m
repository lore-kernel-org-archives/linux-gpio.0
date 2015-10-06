From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: make GPIO_OMAP bool instead of tristate
Date: Tue, 6 Oct 2015 15:45:07 -0500
Message-ID: <561432D3.20709@ti.com>
References: <1444132871-25798-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:43527 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752432AbbJFUpP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 6 Oct 2015 16:45:15 -0400
In-Reply-To: <1444132871-25798-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Austin Schuh <austin@peloton-tech.com>, Santosh Shilimkar <ssantosh@kernel.org>

On 10/06/2015 07:01 AM, Sudip Mukherjee wrote:
> While building arm allmodconfig the build fails with the error:
> ERROR: "handle_bad_irq" [drivers/gpio/gpio-omap.ko] undefined!
> 
> The build breaks as handle_bad_irq is not exported for module use.

Not sure if this is right thing to do. We really want it to be a module if needed.

The handle_bad_irq() was used in this driver to catch the case when Omap
GPIO IRQ is enabled before calling .irq_set_type()   

I think there are few option:
- export handle_bad_irq()
- pass NULL in gpiochip_irqchip_add() instead of handle_bad_irq()
- use handle_simple_irq()
- revert this change

Thought second one should work. 
> 
> Fixes: 450fa54cfd66 ("gpio: omap: convert to use generic irq handler")
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Austin Schuh <austin@peloton-tech.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---
> 
> Same problem for pinctrl was fixed by
> 5ba341604a054294aeb812603349bba024d716ee
> 
> And for your reference:
> https://lkml.org/lkml/2014/2/25/278
> 
>   drivers/gpio/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 63000b1..d910fd1 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -330,7 +330,7 @@ config GPIO_OCTEON
>   	  family of SOCs.
>   
>   config GPIO_OMAP
> -	tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
> +	bool "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
>   	default y if ARCH_OMAP
>   	depends on ARM
>   	select GENERIC_IRQ_CHIP
> 


-- 
regards,
-grygorii
