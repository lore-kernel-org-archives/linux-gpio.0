From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH] pinctrl: make artpec6 explicitly non-modular
Date: Thu, 20 Apr 2017 09:57:05 +0200
Message-ID: <20170420075705.GO26295@axis.com>
References: <20170419195905.9937-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:60979 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937259AbdDTH5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2017 03:57:08 -0400
Content-Disposition: inline
In-Reply-To: <20170419195905.9937-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org

On Wed, Apr 19, 2017 at 03:59:05PM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/pinctrl/Kconfig:config PINCTRL_ARTPEC6
> drivers/pinctrl/Kconfig:        bool "Axis ARTPEC-6 pin controller driver"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.

Agreed, building as module is useless for this
central pin controller.

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Cc: Lars Persson <lars.persson@axis.com>
> Cc: Niklas Cassel <niklas.cassel@axis.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@axis.com
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/pinctrl/pinctrl-artpec6.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
> index b5a2eff7ae3d..2886e77fbcf0 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -12,7 +12,6 @@
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> -#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
> @@ -979,14 +978,3 @@ static int __init artpec6_pmx_init(void)
>  	return platform_driver_register(&artpec6_pmx_driver);
>  }
>  arch_initcall(artpec6_pmx_init);
> -
> -static void __exit artpec6_pmx_exit(void)
> -{
> -	platform_driver_unregister(&artpec6_pmx_driver);
> -}
> -module_exit(artpec6_pmx_exit);
> -
> -MODULE_AUTHOR("Chris Paterson <chris.paterson@linux.pieboy.co.uk>");
> -MODULE_DESCRIPTION("Axis ARTPEC-6 pin control driver");
> -MODULE_LICENSE("GPL v2");
> -MODULE_DEVICE_TABLE(of, artpec6_pinctrl_match);
> -- 
> 2.11.0

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
