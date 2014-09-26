From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: remove remaining users of gpiochip_remove() retval
Date: Fri, 26 Sep 2014 22:41:32 +0200
Message-ID: <201409262241.32579.arnd@arndb.de>
References: <1410905274-22339-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:61097 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754829AbaIZUli (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 16:41:38 -0400
In-Reply-To: <1410905274-22339-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On Wednesday 17 September 2014, Linus Walleij wrote:
> Some drivers accidentally still use the return value from
> gpiochip_remove(). Get rid of them so we can simplify this function
> and get rid of the return value.
> 
> Cc: Abdoulaye Berthe <berthe.ab@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This patch will be merged through the GPIO tree.

Hi Linus, this patch caused a new build warning in some configurations:

> diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
> index a53a689a2bfa..7df34b70e8b6 100644
> --- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
> +++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
> @@ -1298,10 +1298,7 @@ static int abx500_gpio_probe(struct platform_device *pdev)
>  	return 0;
>  
>  out_rem_chip:
> -	err = gpiochip_remove(&pct->chip);
> -	if (err)
> -		dev_info(&pdev->dev, "failed to remove gpiochip\n");
> -
> +	gpiochip_remove(&pct->chip);
>  	return ret;
>  }


drivers/pinctrl/nomadik/pinctrl-abx500.c: In function 'abx500_gpio_probe':
drivers/pinctrl/nomadik/pinctrl-abx500.c:1208:11: warning: unused variable 'err' [-Wunused-variable]

Please fix by removing that variable.

	Arnd
