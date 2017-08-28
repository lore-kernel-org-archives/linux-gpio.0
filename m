From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: uniphier: fix members of rmii group for Pro4
Date: Mon, 28 Aug 2017 12:16:51 +0900
Message-ID: <CAK7LNARqNZe0qgWG_rKAmsnutYVF_=EiHSfvN3GsV=1G_nTfeQ@mail.gmail.com>
References: <1503886886-30065-1-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNASqOQsTDjCNkWjtxp__gns_0kM6BVgsGuNQFpUc3MVM7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:27872 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbdH1DRf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Aug 2017 23:17:35 -0400
In-Reply-To: <CAK7LNASqOQsTDjCNkWjtxp__gns_0kM6BVgsGuNQFpUc3MVM7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

2017-08-28 11:28 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 2017-08-28 11:21 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
>> The ether_rmii_groups should have "ether_rmii" and "ether_rmiib" as
>> members. This patch replaces to them.
>
>
> Linus,
> When you pick up this, please add
>
> Fixes: 1e359ab1285e ("1e359ab1285eaa7")

My mistake.  I mean,

Fixes: 1e359ab1285e ("pinctrl: uniphier: add Ethernet pin-mux settings")



>
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>
>
> Otherwise, looks good to me.
>
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
