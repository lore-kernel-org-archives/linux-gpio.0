From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 31/54] pinctrl: sunxi: Be sure to clamp return value
Date: Tue, 22 Dec 2015 22:39:35 +0800
Message-ID: <CAGb2v64K_F7oNmK1n7U=R42002DCpZ3TeVNYtm66Wh8WyyrajA@mail.gmail.com>
References: <1450794761-24377-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:48382 "EHLO
	smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754086AbbLVOkA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:40:00 -0500
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com [209.85.213.177])
	(Authenticated sender: b93043)
	by smtp.csie.ntu.edu.tw (Postfix) with ESMTPSA id 7AC0D2096F
	for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 22:39:56 +0800 (CST)
Received: by mail-ig0-f177.google.com with SMTP id m11so50679591igk.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:39:56 -0800 (PST)
In-Reply-To: <1450794761-24377-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>

On Tue, Dec 22, 2015 at 10:32 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index a437e4f8628b..c53a2dbdb5cf 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -469,7 +469,7 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)

Above 2 lines:

        val = (readl(pctl->membase + reg) >> index) & DATA_PINS_MASK;

Where DATA_PINS_MASK is 0x01. I think we're covered. But if the !!
design pattern
makes it clearer,

Acked-by: Chen-Yu Tsai <wens@csie.org>

>         if (set_mux)
>                 sunxi_pmx_set(pctl->pctl_dev, offset, SUN4I_FUNC_IRQ);
>
> -       return val;
> +       return !!val;
>  }
>
>  static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
> --
> 2.4.3
>
