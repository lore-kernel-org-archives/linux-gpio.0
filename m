From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: uniphier: make arrays static, reduces object
 code size
Date: Tue, 12 Sep 2017 22:33:35 +0900
Message-ID: <CAK7LNAS+gobUD_rxfSoG8v1jB564=Oa3=jVuVUV7J4odefrTRw@mail.gmail.com>
References: <20170912112124.1143-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41876 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbdILNef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2017 09:34:35 -0400
In-Reply-To: <20170912112124.1143-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-09-12 20:21 GMT+09:00 Colin King <colin.king@canonical.com>:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate const arrays on the stack, instead make them
> static.  Makes the object code smaller nearly 1000 bytes. Also
> line break wide lines to avoid checkpatch warnings.
>
> Before:
>    text    data     bss     dec     hex filename
>   13112    1996       0   15108    3b04 pinctrl-uniphier-core.o
>
> After:
>    text    data     bss     dec     hex filename
>   11642    2476       0   14118    3726 pinctrl-uniphier-core.o
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Thanks!

-- 
Best Regards
Masahiro Yamada
