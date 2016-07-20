From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: tegra: don't auto-enable for COMPILE_TEST
Date: Wed, 20 Jul 2016 13:07:17 +0200
Message-ID: <5240705.FkCKLaq9sU@wuerfel>
References: <20160706125424.1687264-1-arnd@arndb.de> <CACRpkda95YM2ZA2_w-peq-gDvSs6KLggn_ZbLXGWxVEY+HM7Ow@mail.gmail.com> <20160720104148.GA5362@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:54918 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752526AbcGTLHb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jul 2016 07:07:31 -0400
In-Reply-To: <20160720104148.GA5362@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Stein <alexanders83@web.de>, William Breathitt Gray <vilhelm.gray@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, July 20, 2016 12:41:48 PM CEST Ingo Molnar wrote:
> * Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > On Wed, Jul 6, 2016 at 2:54 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > 
> > > I stumbled over a build error with COMPILE_TEST and CONFIG_OF
> > > disabled:
> > >
> > > drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_probe':
> > > drivers/gpio/gpio-tegra.c:603:9: error: 'struct gpio_chip' has no member named 'of_node'
> > >
> > > The problem is that the newly added GPIO_TEGRA Kconfig symbol
> > > does not have a dependency on CONFIG_OF. However, there is another
> > > problem here as the driver gets enabled unconditionally whenever
> > > COMPILE_TEST is set.
> > >
> > > This fixes both problems, by making the symbol user-visible
> > > when COMPILE_TEST is set and default-enabled for ARCH_TEGRA=y.
> > >
> > > As a side-effect, it is now possible to compile-test a Tegra
> > > kernel with GPIO support disabled, which is harmless.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > Fixes: 4dd4dd1d2120 ("gpio: tegra: Allow compile test")
> > 
> > Patch applied.
> 
> This is still not upstream and this build failure is very prominent in the 
> upstream kernel right now.

Note that Linus Walleij is currently on vacation. I don't know
if Alexandre could forward this patch in the meantime.

I also have another patch for a similar regression in linux-next
that prevents an x86 allmodconfig kernel with CONFIG_OF=n
from building (see "pinctrl: bcm: add OF dependencies") and that
one hasn't made it into -next yet (unlike this one that is
fixed in -next but broken in v4.7).

> > I'm starting to get a bit tired about anything related to compile testing.
> 
> They are very useful in finding real problems as well, and some people
> (like me!  rely on being able to generate random kernel images and
>  boot them.

Agreed, I send many patches for build-time regressions every week. Most
of them are for harmless problems, but the other ones that find actual
bugs make it absolutely worthwhile.

I don't mind doing this, and most folks are happy to get an early
feedback about when things break. What's annoying is when I send
a patch within hours after a linux-next release that breaks something
and then the bug makes it into mainline anyway, weeks later.

	Arnd
