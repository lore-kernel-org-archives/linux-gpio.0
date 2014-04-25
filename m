From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] gpio: mvebu: Remove initcall-based driver initialization
Date: Fri, 25 Apr 2014 12:01:58 +0200
Message-ID: <CABxcv=nDCJXpnn2JSPZ3b64srpFkzuGyUkVS=ivp-qx_fXxzOQ@mail.gmail.com>
References: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:46270 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123AbaDYKCA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Apr 2014 06:02:00 -0400
Received: by mail-we0-f169.google.com with SMTP id u56so2213279wes.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2014 03:01:59 -0700 (PDT)
In-Reply-To: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>

Hello Ezequiel,

On Thu, Apr 24, 2014 at 10:54 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> There's no reason to use an initcall to initialize this driver,
> and regular module_platform_driver() can be used instead.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/gpio/gpio-mvebu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index d425094..7d64cde 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -738,9 +738,4 @@ static struct platform_driver mvebu_gpio_driver = {
>         },
>         .probe          = mvebu_gpio_probe,
>  };
> -
> -static int __init mvebu_gpio_init(void)
> -{
> -       return platform_driver_register(&mvebu_gpio_driver);
> -}
> -postcore_initcall(mvebu_gpio_init);
> +module_platform_driver(mvebu_gpio_driver);
> --
> 1.9.1
>
> --

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
