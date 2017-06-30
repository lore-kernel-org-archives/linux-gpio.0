From: jmondi <jacopo@jmondi.org>
Subject: Re: [PATCH] pinctrl: rza1: fix error handling
Date: Fri, 30 Jun 2017 18:42:21 +0200
Message-ID: <20170630164221.GH11157@w540>
References: <20170630161009.13762-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58119 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751072AbdF3QmZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2017 12:42:25 -0400
Content-Disposition: inline
In-Reply-To: <20170630161009.13762-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arnd,

On Fri, Jun 30, 2017 at 06:09:53PM +0200, Arnd Bergmann wrote:
> A compiler warning points out a typo:
>

Geert already sent a fix for this
https://patchwork.kernel.org/patch/9818555/

It should have been applied already

Thanks
   j

> drivers/pinctrl/pinctrl-rza1.c: In function 'rza1_pinctrl_probe':
> drivers/pinctrl/pinctrl-rza1.c:1260:5: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>
> This changes the condition to the usual check for failure of the previous
> function call.
>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/pinctrl-rza1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 614a043f3038..1d57d4480a02 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -1257,7 +1257,7 @@ static int rza1_pinctrl_probe(struct platform_device *pdev)
>  	rza1_pctl->dev = &pdev->dev;
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (ret)
> +	if (!res)
>  		return -ENODEV;
>
>  	rza1_pctl->base = devm_ioremap_resource(&pdev->dev, res);
> --
> 2.9.0
>
