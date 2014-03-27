From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: samsung: Add missing "break" statement
Date: Thu, 27 Mar 2014 10:11:04 +0100
Message-ID: <CACRpkdZAWKqCiK_JXqbOKajivUZZiu3GSPVo3MKod1YWhkF89w@mail.gmail.com>
References: <1395477322-19951-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:56530 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406AbaC0JLG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 05:11:06 -0400
Received: by mail-ob0-f176.google.com with SMTP id wp18so3939687obc.35
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2014 02:11:04 -0700 (PDT)
In-Reply-To: <1395477322-19951-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Mar 22, 2014 at 9:35 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/gpio/gpio-samsung.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index a85e00b..07105ee 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -379,6 +379,7 @@ static int s5p64x0_gpio_setcfg_rbank(struct samsung_gpio_chip *chip,
>         case 6:
>                 shift = ((off + 1) & 7) * 4;
>                 reg -= 4;
> +               break;
>         default:
>                 shift = ((off + 1) & 7) * 4;
>                 break;

Obviously no semantic effect so patch applied as it adds code
readability.

But I'm wondering if default should not be doing reg -= 4; as
well?

Yours,
Linus Walleij
