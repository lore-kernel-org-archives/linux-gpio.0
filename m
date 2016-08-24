From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Remove superfluous include of io-mapping.h
Date: Wed, 24 Aug 2016 13:55:28 +0200
Message-ID: <CACRpkdZR+1+9MXSKL-MeHOmPTueAvg0xHRre8ApnoYM3inqmUw@mail.gmail.com>
References: <20160823203203.14134-1-chris@chris-wilson.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160823203203.14134-1-chris@chris-wilson.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 23, 2016 at 10:32 PM, Chris Wilson <chris@chris-wilson.co.uk> wrote:

> The io-mapping.h include arose from the need to workaround an arch/um
> compile failure:
>
>    drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_probe':
>>> drivers/gpio/gpio-mpc8xxx.c:373:2: error: implicit declaration of
>>> function 'iounmap' [-Werror=implicit-function-declaration]
>      iounmap(mpc8xxx_gc->regs);
>      ^~~~~~~
>
> from commit 296ad4acb8ef ("gpio: remove deps on
> ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") but io-mapping.h doesn't provide
> iounmap so the problem persisted and eventually (will be) silenced by
> making OF_GPIO depend on !NO_IOMEM (i.e. disabling building under
> arch/um). My desire to remove the unneed include to io-mapping is to
> simplify verification of changes to io-mapping.h
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org

I chose to to a proper revert instead, but I have added your for
Reported-by:

Thanks a lot.

Yours,
Linus Walleij
