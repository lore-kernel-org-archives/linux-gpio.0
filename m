From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] gpio: tegra: don't auto-enable for COMPILE_TEST
Date: Wed, 20 Jul 2016 12:41:48 +0200
Message-ID: <20160720104148.GA5362@gmail.com>
References: <20160706125424.1687264-1-arnd@arndb.de>
 <CACRpkda95YM2ZA2_w-peq-gDvSs6KLggn_ZbLXGWxVEY+HM7Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda95YM2ZA2_w-peq-gDvSs6KLggn_ZbLXGWxVEY+HM7Ow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, Alexander Stein <alexanders83@web.de>, William Breathitt Gray <vilhelm.gray@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


* Linus Walleij <linus.walleij@linaro.org> wrote:

> On Wed, Jul 6, 2016 at 2:54 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > I stumbled over a build error with COMPILE_TEST and CONFIG_OF
> > disabled:
> >
> > drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_probe':
> > drivers/gpio/gpio-tegra.c:603:9: error: 'struct gpio_chip' has no member named 'of_node'
> >
> > The problem is that the newly added GPIO_TEGRA Kconfig symbol
> > does not have a dependency on CONFIG_OF. However, there is another
> > problem here as the driver gets enabled unconditionally whenever
> > COMPILE_TEST is set.
> >
> > This fixes both problems, by making the symbol user-visible
> > when COMPILE_TEST is set and default-enabled for ARCH_TEGRA=y.
> >
> > As a side-effect, it is now possible to compile-test a Tegra
> > kernel with GPIO support disabled, which is harmless.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Fixes: 4dd4dd1d2120 ("gpio: tegra: Allow compile test")
> 
> Patch applied.

This is still not upstream and this build failure is very prominent in the 
upstream kernel right now.

> I'm starting to get a bit tired about anything related to compile testing.

They are very useful in finding real problems as well, and some people
(like me! :-) rely on being able to generate random kernel images and
 boot them.

Thanks,

	Ingo
