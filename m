From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Thu, 17 Dec 2015 10:00:57 +0100
Message-ID: <CACRpkda1amCEXiUTrCEYxJgeCDx4jWi3Ka25fELaGTjimAuFjA@mail.gmail.com>
References: <20151216140456.GA20121@panicking>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35057 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932785AbbLQJA6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 04:00:58 -0500
Received: by mail-oi0-f52.google.com with SMTP id l9so10520275oia.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2015 01:00:58 -0800 (PST)
In-Reply-To: <20151216140456.GA20121@panicking>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Dec 16, 2015 at 3:05 PM, Michael Trimarchi
<michael@amarulasolutions.com> wrote:

> I have get a problem using gpio and imx6q freescale architecture. I don't
> really understand how should work your change and I have done a quick
> fix for me. Can you explain what was the idea?
>
> Michael
>
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index a3f0753..f9c6ff7 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -139,11 +139,14 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
>  {
>         struct bgpio_chip *bgc = to_bgpio_chip(gc);
>         unsigned long pinmask = bgc->pin2mask(bgc, gpio);
> +       unsigned long reg;
>
>         if (bgc->dir & pinmask)
> -               return bgc->read_reg(bgc->reg_set) & pinmask;
> +               reg = bgc->read_reg(bgc->reg_set) & pinmask;
>         else
> -               return bgc->read_reg(bgc->reg_dat) & pinmask;
> +               reg = bgc->read_reg(bgc->reg_dat) & pinmask;
> +
> +       return !!(reg &  bgc->pin2mask(bgc, gpio));
>  }

This looks identical to this fix I have queued for fixes:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=fixes&id=21f2856498ff09a03ebc8f9ff7581451a221d81b

Yours,
Linus Walleij
