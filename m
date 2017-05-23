From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular
 distinctions
Date: Tue, 23 May 2017 15:15:15 -0700
Message-ID: <804d9519-5e1b-d9b1-4591-010dcafa2ff1@broadcom.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
 <20170522205648.23545-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170522205648.23545-4-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hi Paul,

Some comments - leave our file headers intact.  If you want to add a new 
comment do so after the existing file header in another comment.  But, I 
don't think any of that information is needed by us.


On 17-05-22 01:56 PM, Paul Gortmaker wrote:
> Fixups here tend to be more of a conglomerate of some of the other
> repeated/systematic ones we've seen in the earlier pinctrl cleanups.
>
> We remove module.h from code that isn't doing anything modular at
> all;  if they have __init sections, then replace it with init.h
>
> One driver has a .remove that would be dispatched on module_exit,
> and as that code is essentially orphaned, so we remove it.  In case
> anyone was previously doing the (pointless) unbind to get to that
> function, we disable unbind for this one driver as well.
>
> A couple bool drivers (hence non-modular) are converted over to
> to builtin_platform_driver().
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Sherman Yin <syin@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-bcm281xx.c   | 16 ++++++++--------
>   drivers/pinctrl/bcm/pinctrl-bcm2835.c    | 20 +++-----------------
>   drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 11 +++++------
>   3 files changed, 16 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> index 810a81786f62..e630f4d5f4c7 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> @@ -1,4 +1,10 @@
>   /*
> + * Broadcom BCM281xx pinctrl driver
> + *
> + * Author(s):
> + *	Sherman Yin <syin@broadcom.com>
> + *	Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>
> + *
Please do not add anything to the header above - leave it as is.
>    * Copyright (C) 2013 Broadcom Corporation
>    *
>    * This program is free software; you can redistribute it and/or
> @@ -12,7 +18,7 @@
>    */
>   #include <linux/err.h>
>   #include <linux/io.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/pinctrl/pinctrl.h>
> @@ -1444,10 +1450,4 @@ static struct platform_driver bcm281xx_pinctrl_driver = {
>   		.of_match_table = bcm281xx_pinctrl_of_match,
>   	},
>   };
> -
> -module_platform_driver_probe(bcm281xx_pinctrl_driver, bcm281xx_pinctrl_probe);
> -
> -MODULE_AUTHOR("Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>");
> -MODULE_AUTHOR("Sherman Yin <syin@broadcom.com>");
> -MODULE_DESCRIPTION("Broadcom BCM281xx pinctrl driver");
> -MODULE_LICENSE("GPL v2");
Fine to remove this if it's not need any more.
> +builtin_platform_driver_probe(bcm281xx_pinctrl_driver, bcm281xx_pinctrl_probe);
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 85d009112864..1eb7a1a5a4bb 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -27,7 +27,7 @@
>   #include <linux/io.h>
>   #include <linux/irq.h>
>   #include <linux/irqdesc.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>   #include <linux/of_address.h>
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
> @@ -1075,31 +1075,17 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int bcm2835_pinctrl_remove(struct platform_device *pdev)
> -{
> -	struct bcm2835_pinctrl *pc = platform_get_drvdata(pdev);
> -
> -	gpiochip_remove(&pc->gpio_chip);
> -
> -	return 0;
> -}
> -
>   static const struct of_device_id bcm2835_pinctrl_match[] = {
>   	{ .compatible = "brcm,bcm2835-gpio" },
>   	{}
>   };
> -MODULE_DEVICE_TABLE(of, bcm2835_pinctrl_match);
>   
>   static struct platform_driver bcm2835_pinctrl_driver = {
>   	.probe = bcm2835_pinctrl_probe,
> -	.remove = bcm2835_pinctrl_remove,
>   	.driver = {
>   		.name = MODULE_NAME,
>   		.of_match_table = bcm2835_pinctrl_match,
> +		.suppress_bind_attrs = true,
>   	},
>   };
> -module_platform_driver(bcm2835_pinctrl_driver);
> -
> -MODULE_AUTHOR("Chris Boot, Simon Arlott, Stephen Warren");
> -MODULE_DESCRIPTION("BCM2835 Pin control driver");
> -MODULE_LICENSE("GPL");
> +builtin_platform_driver(bcm2835_pinctrl_driver);
> diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> index d31c95701a92..3684cca277ad 100644
> --- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> @@ -1,4 +1,8 @@
> -/* Copyright (C) 2014-2015 Broadcom Corporation
> +/*
> + * Broadcom Cygnus IOMUX driver
> + *
> + * Author: Ray Jui <rjui@broadcom.com>
> + * Copyright (C) 2014-2015 Broadcom Corporation
Please do not add any of the above to the file header.
>    *
>    * This program is free software; you can redistribute it and/or
>    * modify it under the terms of the GNU General Public License as
> @@ -17,7 +21,6 @@
>   
>   #include <linux/err.h>
>   #include <linux/io.h>
> -#include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/slab.h>
>   #include <linux/platform_device.h>
> @@ -1016,7 +1019,3 @@ static int __init cygnus_pinmux_init(void)
>   	return platform_driver_register(&cygnus_pinmux_driver);
>   }
>   arch_initcall(cygnus_pinmux_init);
> -
> -MODULE_AUTHOR("Ray Jui <rjui@broadcom.com>");
> -MODULE_DESCRIPTION("Broadcom Cygnus IOMUX driver");
> -MODULE_LICENSE("GPL v2");
Fine with this modification.

Thanks,
  scott
