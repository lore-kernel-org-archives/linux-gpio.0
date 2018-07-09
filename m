From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv3 0/5] pinctrl fixes for generic functions and groups
Date: Mon, 9 Jul 2018 14:59:17 +0200
Message-ID: <CACRpkdYKTKe7c79XDtGf79sOjzDuqEWSJN1KrG2POuemP+TL+g@mail.gmail.com>
References: <20180705091018.60524-1-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705091018.60524-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ext Tony Lindgren <tony@atomide.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, cvwillegen@gmail.com, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 5, 2018 at 11:10 AM Tony Lindgren <tony@atomide.com> wrote:

> Here is a resend of fixes for a race issues for generic group and
> functions reported by H. Nikolaus Schaller <hns@goldelico.com>.

I applied these 5 for fixes (no choice I guess) will push them to the
zeroday build for testing and then to next. Added the tags from H.
Nikolaus and Andy on this.

Should this stuff even be tagged for stable? Else I target it
for v4.18.

Yours,
Linus Walleij
