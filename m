From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 8/9] pinctrl: digicolor: make it explicitly non-modular
Date: Tue, 7 Jun 2016 09:13:17 +0300
Message-ID: <20160607061317.GH2425@tarshish>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
 <1465267388-17884-9-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:43385 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752379AbcFGGN1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 7 Jun 2016 02:13:27 -0400
Content-Disposition: inline
In-Reply-To: <1465267388-17884-9-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi Paul,

On Mon, Jun 06, 2016 at 10:43:07PM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/pinctrl/Kconfig:config PINCTRL_DIGICOLOR
> drivers/pinctrl/Kconfig:        bool
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks. In addition to that you can also revert 8b2b3dcb343b (pinctrl: 
digicolor: add missing platform_set_drvdata() call) that is currently in the 
linux-pinctrl tree. Other then that:

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  drivers/pinctrl/pinctrl-digicolor.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
> index c8073d442dcb..aba3da5ee844 100644
> --- a/drivers/pinctrl/pinctrl-digicolor.c
> +++ b/drivers/pinctrl/pinctrl-digicolor.c
> @@ -15,7 +15,7 @@
>   * - Pin pad configuration (pull up/down, strength)
>   */
>  
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -337,27 +337,17 @@ static int dc_pinctrl_probe(struct platform_device *pdev)
>  	return dc_gpiochip_add(pmap, pdev->dev.of_node);
>  }
>  
> -static int dc_pinctrl_remove(struct platform_device *pdev)
> -{
> -	struct dc_pinmap *pmap = platform_get_drvdata(pdev);
> -
> -	gpiochip_remove(&pmap->chip);
> -
> -	return 0;
> -}
> -
>  static const struct of_device_id dc_pinctrl_ids[] = {
>  	{ .compatible = "cnxt,cx92755-pinctrl" },
>  	{ /* sentinel */ }
>  };
> -MODULE_DEVICE_TABLE(of, dc_pinctrl_ids);
>  
>  static struct platform_driver dc_pinctrl_driver = {
>  	.driver = {
>  		.name = DRIVER_NAME,
>  		.of_match_table = dc_pinctrl_ids,
> +		.suppress_bind_attrs = true,
>  	},
>  	.probe = dc_pinctrl_probe,
> -	.remove = dc_pinctrl_remove,
>  };
> -module_platform_driver(dc_pinctrl_driver);
> +builtin_platform_driver(dc_pinctrl_driver);
> -- 
> 2.8.0
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
