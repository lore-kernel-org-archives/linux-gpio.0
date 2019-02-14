From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: avoid attempting to set pin direction via
 pinctrl on MMP2
Date: Thu, 14 Feb 2019 10:05:34 +0100
Message-ID: <CACRpkdbuoxZ+dyoAtUGmEjeh1XjjpLz9OHe=GgnKXO3ZK4uKQg@mail.gmail.com>
References: <20190213230618.1907-1-lkundrak@v3.sk> <CACRpkdYyT20Um+5bDAiZAfB-A3M+q5DpUQS31+CkLUSb+qpQOw@mail.gmail.com>
 <50fa8c81950e8bb2583a65bfd920bdf574c9abc1.camel@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50fa8c81950e8bb2583a65bfd920bdf574c9abc1.camel@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 9:52 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> On Thu, 2019-02-14 at 09:13 +0100, Linus Walleij wrote:
> > On Thu, Feb 14, 2019 at 12:06 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> >
> > > Similarly to PXA3xx, pinctrl-single can't set pin direction on MMP2 either.
> > > See also: commit 9dabfdd84bdfa ("gpio: pxa: disable pinctrl calls for
> > > PXA3xx")
> > >
> > > Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and request")
> > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> >
> > Patch applied for fixes.
> >
> > Should this even go into stable?
>
> I would tend to think it should.

OK I tag it for stable.

> This caused a regression for MMP2 platforms that don't use a pinctrl
> driver, and none of them do.
>
> On the other hand it went unnoticed since v4.5.
>
> I've seen stable maintainers pick up fixes even when stable@ wasn't
> Cc'd. I guess they apply some heuristics and perhaps look at Fixes:
> tags to identify bugfixes?

Yes Sasha Levin has an some machine-learning AI that looks at patches
to see if they are elegible for stable, and sometimes people tell
Greg directly to pick a patch, and sometimes Greg just picks a patch
he likes.

But to make things easier for the stable maintainers, it's best to CC stable.

Yours,
Linus Walleij
