From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rzn1: remove unnecessary unsigned integer comparison
Date: Mon, 15 Oct 2018 16:21:23 +0200
Message-ID: <CACRpkdZKtK3xEyc3SG88_xp=fcotL5nC9rJoyB6FFK910Bo74Q@mail.gmail.com>
References: <20181011204042.GA17125@embeddedor.com> <CACRpkdb9b6kxgj736OmLhBvzhR26DT+bE2Y=jGaMB3411oa3yw@mail.gmail.com>
 <3c7f85b1-b80d-a963-f599-587dd49d1f12@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3c7f85b1-b80d-a963-f599-587dd49d1f12@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 12, 2018 at 11:28 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> On 10/12/18 11:17 AM, Linus Walleij wrote:
> > Sorry for top-posting, Geert is maintainer for this driver.
> >
>
> Oh okay.
>
> This is what I get when I run the get_maintainer scripts on the rzn1 driver:
>
> $ scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback drivers/pinctrl/pinctrl-rzn1.c
> Linus Walleij <linus.walleij@linaro.org> (maintainer:PIN CONTROL SUBSYSTEM)
> linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM)
> linux-kernel@vger.kernel.org (open list)

Hm I bet it needs a MAINTAINERS update.
Geert can you assume maintainership?

Yours,
Linus Walleij
