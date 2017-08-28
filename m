From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: uniphier: fix members of rmii group for Pro4
Date: Mon, 28 Aug 2017 11:28:14 +0900
Message-ID: <CAK7LNASqOQsTDjCNkWjtxp__gns_0kM6BVgsGuNQFpUc3MVM7g@mail.gmail.com>
References: <1503886886-30065-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503886886-30065-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: linux-gpio@vger.kernel.org

2017-08-28 11:21 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
> The ether_rmii_groups should have "ether_rmii" and "ether_rmiib" as
> members. This patch replaces to them.


Linus,
When you pick up this, please add

Fixes: 1e359ab1285e ("1e359ab1285eaa7")


> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>


Otherwise, looks good to me.

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>





-- 
Best Regards
Masahiro Yamada
