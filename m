From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH] gpio: pxa: avoid attempting to set pin direction via
 pinctrl on MMP2
Date: Thu, 14 Feb 2019 09:52:52 +0100
Message-ID: <50fa8c81950e8bb2583a65bfd920bdf574c9abc1.camel@v3.sk>
References: <20190213230618.1907-1-lkundrak@v3.sk>
         <CACRpkdYyT20Um+5bDAiZAfB-A3M+q5DpUQS31+CkLUSb+qpQOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYyT20Um+5bDAiZAfB-A3M+q5DpUQS31+CkLUSb+qpQOw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-gpio@vger.kernel.org

On Thu, 2019-02-14 at 09:13 +0100, Linus Walleij wrote:
> On Thu, Feb 14, 2019 at 12:06 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> 
> > Similarly to PXA3xx, pinctrl-single can't set pin direction on MMP2 either.
> > See also: commit 9dabfdd84bdfa ("gpio: pxa: disable pinctrl calls for
> > PXA3xx")
> > 
> > Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and request")
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> Patch applied for fixes.
> 
> Should this even go into stable?

I would tend to think it should.

This caused a regression for MMP2 platforms that don't use a pinctrl
driver, and none of them do.

On the other hand it went unnoticed since v4.5.

I've seen stable maintainers pick up fixes even when stable@ wasn't
Cc'd. I guess they apply some heuristics and perhaps look at Fixes:
tags to identify bugfixes?

> Yours,
> Linus Walleij

Lubo
