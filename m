From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: omap2: fix missing include
Date: Fri, 23 Sep 2016 07:13:13 -0700
Message-ID: <20160923141313.y7xp2yyv74nk2v3a@atomide.com>
References: <1474634412-7050-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:42985 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760389AbcIWONa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Sep 2016 10:13:30 -0400
Content-Disposition: inline
In-Reply-To: <1474634412-7050-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Paul Gortmaker <paul.gortmaker@windriver.com>

* Linus Walleij <linus.walleij@linaro.org> [160923 05:40]:
> commit d47529b2e9fe
> "gpio: don't include module.h in shared driver header"
> removed <linux/module.h> from the <linux/gpio/driver.h> header.
> 
> It seems arch/arm/mach-omap2/board-rx51-peripherals.c
> is using __initdata_or_module from <linux/module.h> through
> <linux/gpio.h> to <linux/gpio/driver.h>, so break this dependency
> so that we get a clean compile.
> 
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Fixes: d47529b2e9fe ("gpio: don't include module.h in shared driver header")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Tony: please ACK this if it's OK so I can merge it in front of
> the offending patch.

This file is gone in Linux next but if you need it:

Acked-by: Tony Lindgren <tony@atomide.com>

Sorry the removal got postponed from v4.8 to v4.9. Note that
it will produce a trivial merge conflict.

> ---
>  arch/arm/mach-omap2/board-rx51-peripherals.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-omap2/board-rx51-peripherals.c b/arch/arm/mach-omap2/board-rx51-peripherals.c
> index a5ab712c1a59..6d3af43ae3e4 100644
> --- a/arch/arm/mach-omap2/board-rx51-peripherals.c
> +++ b/arch/arm/mach-omap2/board-rx51-peripherals.c
> @@ -29,6 +29,7 @@
>  #include <linux/power/isp1704_charger.h>
>  #include <linux/platform_data/spi-omap2-mcspi.h>
>  #include <linux/platform_data/mtd-onenand-omap2.h>
> +#include <linux/module.h>
>  
>  #include <plat/dmtimer.h>
>  
> -- 
> 2.7.4
> 
