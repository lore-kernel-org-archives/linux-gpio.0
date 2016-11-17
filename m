From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: sunxi: fix theoretical uninitialized variable access
Date: Thu, 17 Nov 2016 10:24:28 +0100
Message-ID: <6865471.komOtxkTtZ@wuerfel>
References: <20161116141841.2030776-1-arnd@arndb.de> <20161116203358.midi7vmaqirpywtt@lukather> <CACRpkdYk25q9P5sErnfHcH49BT43vCCDihsZNEsf-6Gvpq+Pww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:51439 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751762AbcKQJZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2016 04:25:04 -0500
In-Reply-To: <CACRpkdYk25q9P5sErnfHcH49BT43vCCDihsZNEsf-6Gvpq+Pww@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thursday, November 17, 2016 10:08:28 AM CET Linus Walleij wrote:
> On Wed, Nov 16, 2016 at 9:33 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> 
> > On Wed, Nov 16, 2016 at 03:18:18PM +0100, Arnd Bergmann wrote:
> >> gcc warns about a  way that it could use an uninitialized variable:
> >>
> >> drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pinctrl_init':
> >> drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: error: 'best_div' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >>
> >> This cannot really happen except if 'freq' is UINT_MAX and 'clock' is
> >> zero, and both of these are forbidden. To shut up the warning anyway,
> >> this changes the logic to initialize the return code to the first
> >> divider value before looking at the others.
> >>
> >> Fixes: 7c926492d38a ("pinctrl: sunxi: Add support for interrupt debouncing")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thanks for that patch.
> >
> > Just out of curiosity, which gcc gives those warnings? I have 6.2 and
> > it didn't output anything..
> 
> Context: Arnd re-enabled -Werror=maybe-uninitialized
> in the kernel build and this kind of stuff started to appear so
> it needs to be fixed up.

Right, it was disabled from linux-4.8-rc1 to linux-4.9-rc4 and is now back
in the default builds when using gcc-4.9 or higher. You should get the
warning if you test with linux-next or -rc4.

	Arnd
