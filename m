From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv3 0/5] pinctrl fixes for generic functions and groups
Date: Mon, 9 Jul 2018 06:11:35 -0700
Message-ID: <20180709131135.GD99251@atomide.com>
References: <20180705091018.60524-1-tony@atomide.com>
 <CACRpkdYKTKe7c79XDtGf79sOjzDuqEWSJN1KrG2POuemP+TL+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYKTKe7c79XDtGf79sOjzDuqEWSJN1KrG2POuemP+TL+g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, cvwillegen@gmail.com, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [180709 13:02]:
> On Thu, Jul 5, 2018 at 11:10 AM Tony Lindgren <tony@atomide.com> wrote:
> 
> > Here is a resend of fixes for a race issues for generic group and
> > functions reported by H. Nikolaus Schaller <hns@goldelico.com>.
> 
> I applied these 5 for fixes (no choice I guess) will push them to the
> zeroday build for testing and then to next. Added the tags from H.
> Nikolaus and Andy on this.

OK thanks.

> Should this stuff even be tagged for stable? Else I target it
> for v4.18.

Probably should. The fixes tags should do the trick already
hopefully though.

Regards,

Tony
