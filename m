From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: Remove double variable assignment
Date: Mon, 24 Feb 2014 15:22:33 +0100
Message-ID: <CACRpkdZ=inN+RBH78mPiEKZ2OnpLFxbUisU2XWh4bTDxAvCtUQ@mail.gmail.com>
References: <1392470976-16901-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:58131 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752253AbaBXOWe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 09:22:34 -0500
Received: by mail-ob0-f180.google.com with SMTP id vb8so6949597obc.11
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 06:22:33 -0800 (PST)
In-Reply-To: <1392470976-16901-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kgene Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Feb 15, 2014 at 2:29 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/gpio/gpio-samsung.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index a85e00b..929f31e 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -377,7 +377,6 @@ static int s5p64x0_gpio_setcfg_rbank(struct samsung_gpio_chip *chip,
>                 reg -= 4;
>                 break;
>         case 6:
> -               shift = ((off + 1) & 7) * 4;
>                 reg -= 4;
>         default:
>                 shift = ((off + 1) & 7) * 4;

This makes perfect sense from a semantic point of view.

But I'm just worried that it may be a syntactic error after all,
such as a break; missing in case 6?

What does Samsung folks say about this?

Yours,
Linus Walleij
