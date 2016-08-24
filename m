From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] gpio: Remove superfluous include of io-mapping.h
Date: Wed, 24 Aug 2016 13:08:15 +0100
Message-ID: <20160824120815.GC28943@nuc-i3427.alporthouse.com>
References: <20160823203203.14134-1-chris@chris-wilson.co.uk>
 <CACRpkdZR+1+9MXSKL-MeHOmPTueAvg0xHRre8ApnoYM3inqmUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZR+1+9MXSKL-MeHOmPTueAvg0xHRre8ApnoYM3inqmUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 24, 2016 at 01:55:28PM +0200, Linus Walleij wrote:
> On Tue, Aug 23, 2016 at 10:32 PM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> 
> > The io-mapping.h include arose from the need to workaround an arch/um
> > compile failure:
> >
> >    drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_probe':
> >>> drivers/gpio/gpio-mpc8xxx.c:373:2: error: implicit declaration of
> >>> function 'iounmap' [-Werror=implicit-function-declaration]
> >      iounmap(mpc8xxx_gc->regs);
> >      ^~~~~~~
> >
> > from commit 296ad4acb8ef ("gpio: remove deps on
> > ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") but io-mapping.h doesn't provide
> > iounmap so the problem persisted and eventually (will be) silenced by
> > making OF_GPIO depend on !NO_IOMEM (i.e. disabling building under
> > arch/um). My desire to remove the unneed include to io-mapping is to
> > simplify verification of changes to io-mapping.h
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Alexandre Courbot <gnurou@gmail.com>
> > Cc: linux-gpio@vger.kernel.org
> 
> I chose to to a proper revert instead, but I have added your for
> Reported-by:

Thanks, this will help me hide from 0day as well :)
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
