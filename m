From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: fix regmap error handling
Date: Mon, 12 Sep 2016 10:52:03 +0930
Message-ID: <CACPK8XeLYDjm+vkdoM7Lv5pK4+Ls9tTyfV2j3HuE=vaAsWav5w@mail.gmail.com>
References: <20160909092715.403663-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:33983 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753130AbcILBWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2016 21:22:25 -0400
In-Reply-To: <20160909092715.403663-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, colin.king@canonical.com

On Fri, Sep 9, 2016 at 6:56 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> The newly added aspeed driver tries to check for a negative return
> value from a pinctrl function, but stores the intermediate value in
> a 'bool' variable, which cannot work:
>
> drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function 'aspeed_sig_expr_set':
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:192:11: error: comparison of constant '0' with boolean expression is always false [-Werror=bool-compare]
>
> This slightly reworks the logic to use an explicit comparison with zero
> before assigning to the temporary variable.

Thanks for finding this Arnd.

Colin also found the issue. Thanks Colin!

I think we should take this version of the fix. Linus, can you put
this in your tree please?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 7d461fc30d3c..0391f9f13f3e 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -187,10 +187,10 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                         continue;
>
>                 ret = regmap_update_bits(map, desc->reg, desc->mask,
> -                               pattern << __ffs(desc->mask));
> +                               pattern << __ffs(desc->mask)) == 0;
>
> -               if (ret < 0)
> -                       return false;
> +               if (!ret)
> +                       return ret;
>         }
>
>         return aspeed_sig_expr_eval(expr, enable, map);
> --
> 2.9.0
>
