From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: don't auto-enable for COMPILE_TEST
Date: Wed, 6 Jul 2016 15:38:20 +0200
Message-ID: <CACRpkda95YM2ZA2_w-peq-gDvSs6KLggn_ZbLXGWxVEY+HM7Ow@mail.gmail.com>
References: <20160706125424.1687264-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160706125424.1687264-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Alexander Stein <alexanders83@web.de>, William Breathitt Gray <vilhelm.gray@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 6, 2016 at 2:54 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> I stumbled over a build error with COMPILE_TEST and CONFIG_OF
> disabled:
>
> drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_probe':
> drivers/gpio/gpio-tegra.c:603:9: error: 'struct gpio_chip' has no member named 'of_node'
>
> The problem is that the newly added GPIO_TEGRA Kconfig symbol
> does not have a dependency on CONFIG_OF. However, there is another
> problem here as the driver gets enabled unconditionally whenever
> COMPILE_TEST is set.
>
> This fixes both problems, by making the symbol user-visible
> when COMPILE_TEST is set and default-enabled for ARCH_TEGRA=y.
>
> As a side-effect, it is now possible to compile-test a Tegra
> kernel with GPIO support disabled, which is harmless.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 4dd4dd1d2120 ("gpio: tegra: Allow compile test")

Patch applied.

I'm starting to get a bit tired about anything related to compile testing.

It's not like I don't understand that it is good to test-build things ...

It's just that enabling this turns up so many strange compile bugs to
the left and right that it takes focus away from core development.
I don't know what can be done to alleviate the situation.

Yours,
Linus Walleij
